const { GoogleGenerativeAI } = require("@google/generative-ai");
const db = require("../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);

// Cache in-memory cho embeddings
let productEmbeddingsCache = null;

// Hàm tính Cosine Similarity giữa 2 vector
function cosineSimilarity(vecA, vecB) {
  let dotProduct = 0;
  let normA = 0;
  let normB = 0;
  for (let i = 0; i < vecA.length; i++) {
    dotProduct += vecA[i] * vecB[i];
    normA += vecA[i] * vecA[i];
    normB += vecB[i] * vecB[i];
  }
  if (normA === 0 || normB === 0) return 0;
  return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
}

// Khởi tạo và Cache Product Embeddings
async function initProductEmbeddings() {
  if (productEmbeddingsCache) return productEmbeddingsCache;
  
  console.log("[RAG] Đang tải danh sách sản phẩm...");
  const products = await query(`
    SELECT 
      p.product_id,
      p.product_name,
      pv.product_variant_name,
      pv.product_variant_price,
      pv.product_variant_available,
      c.category_name,
      d.discount_name,
      d.discount_amount
    FROM product_variants pv
    JOIN products p ON pv.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
    LEFT JOIN discounts d ON pv.discount_id = d.discount_id
    WHERE pv.product_variant_available > 0
  `);

  console.log(`[RAG] Đang tạo vector embedding cho ${products.length} sản phẩm...`);
  
  const embeddingModel = genAI.getGenerativeModel({ model: "gemini-embedding-2" });
  const cache = [];

  for (const p of products) {
    const textInfo = `- Tên: ${p.product_name} (${p.product_variant_name || ""})
- Giá: ${p.product_variant_price?.toLocaleString("vi-VN")}đ
- Danh mục: ${p.category_name}
- Tồn kho: ${p.product_variant_available}
- Khuyến mãi: ${p.discount_name ? p.discount_name + " giảm " + p.discount_amount + "%" : "Không có"}`;
    
    // Gọi API để lấy vector
    const result = await embeddingModel.embedContent(textInfo);
    const embedding = result.embedding.values;
    
    cache.push({
      info: textInfo,
      embedding: embedding
    });
  }
  
  productEmbeddingsCache = cache;
  console.log("[RAG] Hoàn tất tạo bộ nhớ cache vector!");
  return productEmbeddingsCache;
}

const chatbotController = {};

chatbotController.chat = async (req, res) => {
  try {
    const { message, history = [] } = req.body;

    if (!message) {
      return res.status(400).json({ error: "Thiếu nội dung tin nhắn" });
    }

    // Kiểm tra API key
    if (!process.env.GEMINI_API_KEY || process.env.GEMINI_API_KEY === "YOUR_GEMINI_API_KEY_HERE") {
      return res.status(500).json({ error: "Chưa cấu hình Gemini API Key" });
    }

    // 1. Lấy cache sản phẩm (chạy 1 lần đầu tiên)
    const productCache = await initProductEmbeddings();

    // 2. Tạo embedding cho câu hỏi của user
    const embeddingModel = genAI.getGenerativeModel({ model: "gemini-embedding-2" });
    const userResult = await embeddingModel.embedContent(message);
    const userEmbedding = userResult.embedding.values;

    // 3. Tính độ tương đồng và lấy Top 10
    const scoredProducts = productCache.map(p => ({
      info: p.info,
      score: cosineSimilarity(userEmbedding, p.embedding)
    }));
    
    // Sort giảm dần theo điểm số (càng gần 1 càng giống)
    scoredProducts.sort((a, b) => b.score - a.score);
    const topProducts = scoredProducts.slice(0, 10).map(p => p.info).join("\n\n");

    const systemPrompt = `Bạn là trợ lý ảo AI thông minh của cửa hàng TECHMO - chuyên bán đồ ăn vặt và đồ uống tại Việt Nam.

ĐÂY LÀ TOP 10 SẢN PHẨM PHÙ HỢP NHẤT VỚI NHU CẦU CỦA KHÁCH HIỆN TẠI:
${topProducts}

HƯỚNG DẪN TƯ VẤN:
1. Bạn là nhân viên bán hàng xuất sắc. Hãy tư duy linh hoạt và hiểu nhu cầu ẩn sâu của khách.
   Ví dụ: Khách bảo "buồn ngủ" -> Gợi ý đồ uống có ga (Coca, Pepsi), nước tăng lực hoặc đồ ăn cay/chua để tỉnh táo. Khách bảo "đói" -> Gợi ý bánh, mì, xúc xích.
2. Trả lời bằng tiếng Việt, thái độ thân thiện, nhiệt tình, có sử dụng emoji phù hợp.
3. CHỈ giới thiệu các sản phẩm CÓ TRONG DANH SÁCH trên. Tuyệt đối KHÔNG bịa ra sản phẩm cửa hàng không bán.
4. Nếu khách hỏi một món cửa hàng không có, hãy khéo léo xin lỗi và GỢI Ý MÓN KHÁC tương tự có trong danh sách.
5. Khi nhắc đến giá tiền, luôn format dạng: 15.000đ.
6. Trả lời súc tích, tránh dài dòng.`;

    const model = genAI.getGenerativeModel({
      model: "gemini-2.5-flash",
      systemInstruction: systemPrompt,
    });

    // Chuẩn bị lịch sử chat
    const chatHistory = history.map((msg) => ({
      role: msg.role,
      parts: [{ text: msg.text }],
    }));

    const chat = model.startChat({ history: chatHistory });
    const result = await chat.sendMessage(message);
    const response = result.response.text();

    res.json({ reply: response });
  } catch (err) {
    console.error("Chatbot error:", err.message);
    res.status(500).json({ error: "Lỗi: " + err.message });
  }
};

module.exports = chatbotController;
