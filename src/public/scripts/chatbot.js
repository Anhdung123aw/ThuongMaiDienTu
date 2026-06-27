(function () {
  const SUGGESTIONS = [
    "Sản phẩm bán chạy?",
    "Có khuyến mãi gì?",
    "Snack giá rẻ?",
    "Xem tất cả sản phẩm",
  ];

  let chatHistory = [];
  let isOpen = false;

  // ===== BUILD HTML =====
  const widget = document.createElement("div");
  widget.id = "chatbot-widget";
  widget.innerHTML = `
    <div id="chatbot-box">
      <div id="chatbot-header">
        <div class="bot-avatar">
          <span class="material-symbols-rounded">smart_toy</span>
        </div>
        <div class="bot-info">
          <div class="bot-name">TECHMO Assistant</div>
          <div class="bot-status">🟢 Đang hoạt động</div>
        </div>
        <button id="chatbot-close">
          <span class="material-symbols-rounded">close</span>
        </button>
      </div>

      <div id="chatbot-messages">
        <!-- messages will be injected here -->
      </div>

      <div id="chatbot-suggestions">
        ${SUGGESTIONS.map((s) => `<button class="suggestion-chip">${s}</button>`).join("")}
      </div>

      <div id="chatbot-input-area">
        <input id="chatbot-input" type="text" placeholder="Nhắn tin cho TECHMO..." autocomplete="off" />
        <button id="chatbot-send">
          <span class="material-symbols-rounded">send</span>
        </button>
      </div>
    </div>

    <button id="chatbot-toggle" title="Chat với TECHMO AI">
      <span id="chatbot-badge"></span>
      <span class="material-symbols-rounded" id="chatbot-icon">smart_toy</span>
    </button>
  `;
  document.body.appendChild(widget);

  // ===== ELEMENTS =====
  const box = document.getElementById("chatbot-box");
  const toggle = document.getElementById("chatbot-toggle");
  const closeBtn = document.getElementById("chatbot-close");
  const input = document.getElementById("chatbot-input");
  const sendBtn = document.getElementById("chatbot-send");
  const messages = document.getElementById("chatbot-messages");
  const badge = document.getElementById("chatbot-badge");
  const icon = document.getElementById("chatbot-icon");
  const chips = document.querySelectorAll(".suggestion-chip");

  // ===== TOGGLE =====
  function openChat() {
    box.style.display = "flex";
    isOpen = true;
    icon.textContent = "close";
    badge.style.display = "none";
    input.focus();
    if (messages.children.length === 0) {
      addBotMessage(
        "Xin chào! Tôi là trợ lý ảo của TECHMO 🛒\nTôi có thể giúp bạn tìm sản phẩm, xem giá và khuyến mãi. Bạn cần hỗ trợ gì?"
      );
    }
  }

  function closeChat() {
    box.style.display = "none";
    isOpen = false;
    icon.textContent = "smart_toy";
  }

  toggle.addEventListener("click", () => (isOpen ? closeChat() : openChat()));
  closeBtn.addEventListener("click", closeChat);

  // ===== MESSAGES =====
  function addBotMessage(text) {
    const wrap = document.createElement("div");
    wrap.className = "chat-msg bot";
    wrap.innerHTML = `
      <div class="chat-avatar">
        <span class="material-symbols-rounded">smart_toy</span>
      </div>
      <div class="chat-bubble">${escapeHtml(text)}</div>
    `;
    messages.appendChild(wrap);
    scrollBottom();
  }

  function addUserMessage(text) {
    const wrap = document.createElement("div");
    wrap.className = "chat-msg user";
    wrap.innerHTML = `<div class="chat-bubble">${escapeHtml(text)}</div>`;
    messages.appendChild(wrap);
    scrollBottom();
  }

  function addTyping() {
    const wrap = document.createElement("div");
    wrap.className = "chat-msg bot";
    wrap.id = "typing-msg";
    wrap.innerHTML = `
      <div class="chat-avatar">
        <span class="material-symbols-rounded">smart_toy</span>
      </div>
      <div class="typing-indicator">
        <span></span><span></span><span></span>
      </div>
    `;
    messages.appendChild(wrap);
    scrollBottom();
    return wrap;
  }

  function scrollBottom() {
    messages.scrollTop = messages.scrollHeight;
  }

  function escapeHtml(text) {
    return text
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/\n/g, "<br>");
  }

  // ===== SEND =====
  async function sendMessage(text) {
    text = text.trim();
    if (!text) return;

    input.value = "";
    addUserMessage(text);
    sendBtn.disabled = true;
    input.disabled = true;

    const typing = addTyping();

    try {
      const res = await fetch("/chatbot/chat", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: text, history: chatHistory }),
      });

      const data = await res.json();
      typing.remove();

      const reply = data.reply || data.error || "Xin lỗi, tôi không hiểu.";
      addBotMessage(reply);

      // Lưu history (giới hạn 10 lượt)
      chatHistory.push({ role: "user", text });
      chatHistory.push({ role: "model", text: reply });
      if (chatHistory.length > 20) chatHistory = chatHistory.slice(-20);

      // Badge nếu cửa sổ đang đóng
      if (!isOpen) {
        badge.style.display = "flex";
        badge.textContent = "1";
      }
    } catch (err) {
      typing.remove();
      addBotMessage("Đã xảy ra lỗi kết nối. Vui lòng thử lại.");
    } finally {
      sendBtn.disabled = false;
      input.disabled = false;
      input.focus();
    }
  }

  sendBtn.addEventListener("click", () => sendMessage(input.value));
  input.addEventListener("keydown", (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      sendMessage(input.value);
    }
  });

  chips.forEach((chip) => {
    chip.addEventListener("click", () => {
      if (!isOpen) openChat();
      sendMessage(chip.textContent);
    });
  });
})();
