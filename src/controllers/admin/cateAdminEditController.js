const db = require("../../config/db/connect");
const fs = require("fs");
const path = require("path");

// ===== GET FORM EDIT =====
exports.getEditCategory = (req, res) => {
  const id = req.params.id;

  const sql = "SELECT * FROM categories WHERE category_id = ?";

  db.query(sql, [id], (err, result) => {
    if (err) {
      console.log(err);
      return res.send("Lỗi lấy dữ liệu category");
    }

    if (result.length === 0) {
      return res.send("Không tìm thấy category");
    }

    res.render("admin/pages/cate_view_admin_edit", {
      title: "Sửa danh mục",
      category: result[0],
      admin: req.admin || {},
    });
  });
};

// ===== POST UPDATE CATEGORY =====
exports.postEditCategory = (req, res) => {
  const id = req.params.id;

  const { category_name, categorry_type, category_is_display } = req.body;

  let newImage = req.file ? req.file.filename : null;

  // lấy ảnh cũ
  const getOld = "SELECT category_img FROM categories WHERE category_id = ?";

  db.query(getOld, [id], (err, data) => {
    if (err) {
      console.log(err);
      return res.send("Lỗi lấy ảnh cũ");
    }

    const oldImage = data[0]?.category_img;

    // nếu không upload ảnh mới => giữ ảnh cũ
    if (!newImage) {
      newImage = oldImage;
    } else {
      // xóa ảnh cũ (optional - an toàn hơn)
      const oldPath = path.join(__dirname, "../../../src/public/imgs/categories/", oldImage || "");

      if (fs.existsSync(oldPath)) {
        fs.unlinkSync(oldPath);
      }
    }

    const sql = `
      UPDATE categories 
      SET category_name = ?, 
          categorry_type = ?, 
          category_img = ?, 
          category_is_display = ?
      WHERE category_id = ?
    `;

    db.query(sql, [category_name, categorry_type, newImage, category_is_display, id], (err2) => {
      if (err2) {
        console.log(err2);
        return res.send("Lỗi update category");
      }

      return res.redirect("/admin/categories_admin");
    });
  });
};
