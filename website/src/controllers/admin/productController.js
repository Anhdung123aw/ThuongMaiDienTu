const db = require("../../config/db/connect");
const util = require("util");
const fs = require("fs");
const path = require("path");

const query = util.promisify(db.query).bind(db);

// ================== [1] DANH SÁCH SẢN PHẨM ==================
exports.getProducts = async (req, res) => {
  try {
    const sql = `
      SELECT 
        p.product_id,
        p.product_name,
        p.product_avt_img,
        p.product_is_display,
        COUNT(oi.id) AS product_count,
        SUM(oi.quantity * oi.price_per_unit) AS revenue
      FROM products p
      LEFT JOIN order_items oi ON p.product_id = oi.product_id
      GROUP BY p.product_id
      ORDER BY p.product_id DESC
    `;

    const products = await query(sql);

    res.render("admin/products_admin/index", {
      title: "Sản phẩm",
      data: {
        products: products,
        totalRow: products.length,
        searchKey: "",
      },
      formatFunction: {
        toCurrency: (num) => Number(num || 0).toLocaleString("vi-VN") + " đ",
      },
    });
  } catch (err) {
    console.error(err);
    res.send("Lỗi load sản phẩm");
  }
};

// ================== [2] FORM THÊM ==================
exports.getAddProduct = async (req, res) => {
  try {
    const categories = await query("SELECT * FROM category");

    res.render("admin/products_admin/add", {
      title: "Thêm sản phẩm",
      categories: categories,
    });
  } catch (err) {
    console.error(err);
    res.send("Lỗi load form thêm");
  }
};

// ================== [3] THÊM SẢN PHẨM ==================
exports.postAddProduct = async (req, res) => {
  try {
    console.log("🔥 CONTROLLER CHẠY");
    const { productName, category_id, description } = req.body;

    // ===== ẢNH =====
    const image = req.file ? req.file.filename : "default.png";

    // ===== 1. INSERT PRODUCTS =====
    const productSql = `
      INSERT INTO products (
        category_id,
        product_name,
        product_avt_img,
        product_description,
        product_rate,
        product_view_count,
        product_is_display
      )
      VALUES (?, ?, ?, ?, 0, 0, 1)
    `;

    const result = await query(productSql, [category_id, productName, image, description]);

    const productId = result.insertId;

    // ===== 2. INSERT VARIANT (FIX LỖI UNIT) =====
    const variantSql = `
      INSERT INTO product_variants (
        product_id,
        discount_id,
        product_variant_name,
        product_variant_price,
        product_variant_available,
        product_variant_is_stock,
        product_variant_is_bestseller,
        product_variant_added_date,
        product_variant_is_display,
        unit
      )
      VALUES (?, NULL, ?, ?, ?, 1, 0, NOW(), 1, ?)
    `;

    await query(variantSql, [
      productId,
      "Mặc định",
      0, // giá
      0, // số lượng
      "cái", // 🔥 FIX QUAN TRỌNG
    ]);

    // ===== 3. INSERT product_imgs =====
    if (image !== "default.png") {
      const imgSql = `
        INSERT INTO product_imgs (
          product_id,
          image_name,
          image_is_display
        )
        VALUES (?, ?, 1)
      `;

      await query(imgSql, [productId, image]);
    }

    // ===== 4. TẠO FOLDER & MOVE FILE =====
    // ===== 4. TẠO FOLDER & MOVE FILE =====
    // ===== 4. TẠO FOLDER & MOVE FILE (FIX CHUẨN) =====
    const basePath = path.join(process.cwd(), "src/public/imgs/product_image");
    const newDir = path.join(basePath, "P" + productId);

    // tạo folder
    if (!fs.existsSync(newDir)) {
      fs.mkdirSync(newDir, { recursive: true });
      console.log("✅ Đã tạo folder:", newDir);
    }

    // move file
    if (req.file) {
      const oldPath = req.file.path; // 🔥 quan trọng
      const newPath = path.join(newDir, req.file.filename);

      console.log("OLD:", oldPath);
      console.log("NEW:", newPath);

      fs.renameSync(oldPath, newPath);
    }
    // ===== DONE =====
    res.redirect("/admin/products_admin");
  } catch (err) {
    console.error("❌ ERROR:", err);
    res.send(err.message);
  }
};
// ================== [4] XÓA SẢN PHẨM ==================
exports.deleteProduct = async (req, res) => {
  try {
    const id = req.params.id;

    await query("DELETE FROM products WHERE product_id = ?", [id]);

    res.redirect("/admin/products_admin");
  } catch (err) {
    console.error(err);
    res.send("Lỗi xóa sản phẩm");
  }
};

// ================== [5] ẨN / HIỆN ==================
exports.toggleDisplay = async (req, res) => {
  try {
    const id = req.params.id;

    const product = await query("SELECT product_is_display FROM products WHERE product_id = ?", [id]);

    const newStatus = product[0].product_is_display ? 0 : 1;

    await query("UPDATE products SET product_is_display = ? WHERE product_id = ?", [newStatus, id]);

    res.redirect("/admin/products_admin");
  } catch (err) {
    console.error(err);
    res.send("Lỗi cập nhật trạng thái");
  }
};
exports.getEditProduct = async (req, res) => {
  const id = req.params.id;

  const product = await query("SELECT * FROM products WHERE product_id = ?", [id]);

  const categories = await query("SELECT * FROM categories");

  res.render("admin/pages/edit", {
    title: "Sửa sản phẩm",
    product: product[0],
    categories,
    admin: req.admin,
  });
};
exports.postEditProduct = async (req, res) => {
  try {
    const id = req.params.id;
    const { productName, category_id, description } = req.body;

    let image = null;

    if (req.file) {
      image = req.file.filename;

      const basePath = path.join(process.cwd(), "src/public/imgs/product_image");
      const newDir = path.join(basePath, "P" + id);

      if (!fs.existsSync(newDir)) {
        fs.mkdirSync(newDir, { recursive: true });
      }

      fs.renameSync(req.file.path, path.join(newDir, image));
    }

    let sql = `
      UPDATE products 
      SET product_name = ?, category_id = ?, product_description = ?
    `;

    let params = [productName, category_id, description];

    if (image) {
      sql += ", product_avt_img = ?";
      params.push(image);
    }

    sql += " WHERE product_id = ?";
    params.push(id);

    await query(sql, params);

    res.redirect("/admin/products_admin");
  } catch (err) {
    console.error(err);
    res.send("Lỗi sửa");
  }
};
