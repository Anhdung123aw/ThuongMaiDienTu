const db = require("../../config/db/connect");

/**
 * THÊM DANH MỤC (POST)
 * file này tách riêng để tránh đụng code cũ
 */
exports.postAddCategory = (req, res) => {
  try {
    const { category_name, categorry_type } = req.body;

    // ảnh upload (nếu có)
    const category_img = req.file ? req.file.filename : null;

    const sql = `
            INSERT INTO categories
            (category_name, category_img, categorry_type, category_added_date, category_is_display)
            VALUES (?, ?, ?, NOW(), ?)
        `;

    const values = [category_name, category_img, categorry_type || null, 1];

    db.query(sql, values, (err) => {
      if (err) {
        console.log("❌ Lỗi thêm category:", err);
        return res.status(500).send("Lỗi server");
      }

      return res.redirect("/admin/categories_admin");
    });
  } catch (error) {
    console.log("❌ Server error:", error);
    return res.status(500).send("Server error");
  }
};
