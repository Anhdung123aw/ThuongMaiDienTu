const multer = require("multer");
const path = require("path");
const fs = require("fs");

// ===== THƯ MỤC TMP =====
const tmpDir = path.join(__dirname, "../../public/imgs/product_image/tmp");

// tạo nếu chưa có
if (!fs.existsSync(tmpDir)) {
  fs.mkdirSync(tmpDir, { recursive: true });
}

// ===== STORAGE =====
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, tmpDir); // 👈 luôn lưu vào tmp
  },

  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);

    const uniqueName = Date.now() + "-" + Math.round(Math.random() * 1e9) + ext;

    cb(null, uniqueName);
  },
});

// ===== FILTER CHỈ CHO ẢNH =====
const fileFilter = (req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png|webp/;

  const extname = allowedTypes.test(path.extname(file.originalname).toLowerCase());

  const mimetype = allowedTypes.test(file.mimetype);

  if (extname && mimetype) {
    cb(null, true);
  } else {
    cb(new Error("Chỉ cho phép upload ảnh (jpg, jpeg, png, webp)"));
  }
};

// ===== LIMIT =====
const limits = {
  fileSize: 5 * 1024 * 1024, // 5MB
};

// ===== EXPORT =====
const upload = multer({
  storage,
  fileFilter,
  limits,
});

module.exports = upload;
