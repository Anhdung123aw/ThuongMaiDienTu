const db = require('./src/config/db/connect');

const sql = "ALTER TABLE `feedbacks` ADD COLUMN `feedback_img` VARCHAR(255) DEFAULT NULL AFTER `feedback_content`";

db.query(sql, (err, result) => {
    if (err) {
        if (err.errno === 1060) {
            console.log('Cột feedback_img đã tồn tại từ trước rồi.');
        } else {
            console.error('Lỗi khi cập nhật DB:', err.message);
        }
    } else {
        console.log('Đã thêm cột feedback_img thành công!');
    }
    process.exit();
});
