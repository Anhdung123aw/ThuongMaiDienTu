const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const general = require("../../models/general.model");

const customerAdminController = {};

customerAdminController.getCustomers = async (req, res) => {
  const title = "QUẢN LÝ KHÁCH HÀNG";
  let admin = req.admin;

  let page = parseInt(req.query.page) || 1;
  let limit = 10;
  let offset = (page - 1) * limit;

  // COUNT
  let countSql = `SELECT COUNT(*) AS total FROM users`;
  let countResult = await query(countSql);
  let totalRow = countResult[0].total;
  let totalPage = Math.ceil(totalRow / limit);

  // DATA
  let sql = `
    SELECT 
      user_id,
      user_name,
      user_birth,
      user_sex,
      user_email,
      user_phone,
      user_address,
      user_status,
      user_avt_img
    FROM users
    ORDER BY user_id DESC
    LIMIT ${limit} OFFSET ${offset}
  `;

  let customers = await query(sql);
  let formatFunction = await general.formatFunction();

  res.render("admin/pages/customers_admin", {
    title,
    admin,
    data: {
      customers,
      totalRow,
      totalPage,
      page,
      limit,
    },
    formatFunction,
  });
};
customerAdminController.getEditCustomer = async (req, res) => {
  const id = req.params.id;
  let admin = req.admin;

  const sql = `
    SELECT 
      user_id,
      user_name,
      user_birth,
      user_sex,
      user_email,
      user_phone,
      user_address,
      user_status
    FROM users
    WHERE user_id = ?
  `;

  const result = await query(sql, [id]);

  if (!result.length) {
    return res.send("Không tìm thấy khách hàng");
  }

  res.render("admin/pages/edit_customer_admin", {
    admin,
    item: result[0],
  });
};
customerAdminController.updateCustomer = async (req, res) => {
  const id = req.params.id;

  const { user_name, user_birth, user_sex, user_email, user_phone, user_address, user_status } = req.body;

  // ================= VALIDATE =================
  const nameRegex = /^[A-Za-zÀ-ỹ\s]+$/;
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const phoneRegex = /^[0-9]{10}$/;

  if (!nameRegex.test(user_name)) {
    return res.send("Tên chỉ được chứa chữ cái");
  }

  if (!emailRegex.test(user_email)) {
    return res.send("Email không đúng định dạng");
  }

  if (!phoneRegex.test(user_phone)) {
    return res.send("Số điện thoại phải đủ 10 số");
  }

  // fix status an toàn
  const status = user_status == 1 ? 1 : 0;

  const sql = `
    UPDATE users
    SET 
      user_name = ?,
      user_birth = ?,
      user_sex = ?,
      user_email = ?,
      user_phone = ?,
      user_address = ?,
      user_status = ?
    WHERE user_id = ?
  `;

  await query(sql, [user_name, user_birth, user_sex, user_email, user_phone, user_address, status, id]);

  res.redirect("/admin/customers_admin");
};
customerAdminController.deleteCustomer = async (req, res) => {
  const id = req.params.id;

  await query(`DELETE FROM users WHERE user_id = ?`, [id]);

  res.redirect("/admin/customers_admin");
};
module.exports = customerAdminController;
