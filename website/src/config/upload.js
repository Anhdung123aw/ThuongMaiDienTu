const multer = require("multer");
const fs = require("fs");
const path = require("path");

// đúng path của bạn
const uploadPath = path.join(__dirname, "../../src/public/imgs/categories");

// tự tạo folder nếu chưa có
if (!fs.existsSync(uploadPath)) {
  fs.mkdirSync(uploadPath, { recursive: true });
}

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, uploadPath);
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage });

module.exports = upload;
