const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const discountAdminController = {};

// ================= LIST =================
discountAdminController.getDiscounts = async (req, res) => {
  const title = "QUẢN LÝ KHUYẾN MÃI";
  let admin = req.admin;

  let page = parseInt(req.query.page) || 1;
  let limit = 10;
  let offset = (page - 1) * limit;

  let countSql = `SELECT COUNT(*) AS total FROM discounts`;
  let countResult = await query(countSql);

  let totalRow = countResult[0].total;
  let totalPage = Math.ceil(totalRow / limit);

  let sql = `
    SELECT *
    FROM discounts
    ORDER BY discount_id DESC
    LIMIT ${limit} OFFSET ${offset}
  `;

  let discounts = await query(sql);

  res.render("admin/pages/discounts_admin", {
    title,
    admin,
    data: {
      discounts,
      totalRow,
      totalPage,
      page,
      limit,
    },
  });
};

// ================= GET ADD =================
discountAdminController.getAddPage = async (req, res) => {
  let admin = req.admin;

  res.render("admin/pages/add_discount_admin", {
    admin,
  });
};

// ================= ADD =================
discountAdminController.postAddDiscount = async (req, res) => {
  const { discount_name, discount_description, discount_start_date, discount_end_date, discount_amount } = req.body;

  if (!discount_name || !discount_start_date || !discount_end_date || !discount_amount) {
    return res.send("Thiếu dữ liệu");
  }

  const amount = Number(discount_amount);

  if (amount < 0 || amount > 100) {
    return res.send("Giảm giá phải từ 0 đến 100%");
  }

  if (new Date(discount_start_date) > new Date(discount_end_date)) {
    return res.send("Ngày bắt đầu phải nhỏ hơn ngày kết thúc");
  }

  const sql = `
    INSERT INTO discounts
    (
      discount_name,
      discount_description,
      discount_start_date,
      discount_end_date,
      discount_amount,
      discount_is_display
    )
    VALUES (?, ?, ?, ?, ?, 1)
  `;

  await query(sql, [discount_name, discount_description || null, discount_start_date, discount_end_date, amount]);

  res.redirect("/admin/discounts_admin");
};

// ================= GET EDIT =================
discountAdminController.getEditPage = async (req, res) => {
  let admin = req.admin;
  const id = req.params.id;

  const sql = `SELECT * FROM discounts WHERE discount_id = ?`;
  const result = await query(sql, [id]);

  if (!result.length) {
    return res.send("Không tìm thấy khuyến mãi");
  }

  res.render("admin/pages/edit_discount_admin", {
    admin,
    item: result[0],
  });
};

// ================= UPDATE =================
discountAdminController.updateDiscount = async (req, res) => {
  const id = req.params.id;

  const { discount_name, discount_description, discount_start_date, discount_end_date, discount_amount } = req.body;

  const amount = Number(discount_amount);

  if (amount < 0 || amount > 100) {
    return res.send("Giảm giá phải từ 0 đến 100%");
  }

  const sql = `
    UPDATE discounts
    SET
      discount_name = ?,
      discount_description = ?,
      discount_start_date = ?,
      discount_end_date = ?,
      discount_amount = ?
    WHERE discount_id = ?
  `;

  await query(sql, [discount_name, discount_description, discount_start_date, discount_end_date, amount, id]);

  res.redirect("/admin/discounts_admin");
};

// ================= DELETE =================
discountAdminController.deleteDiscount = async (req, res) => {
  const id = req.params.id;

  await query(`DELETE FROM discounts WHERE discount_id = ?`, [id]);

  res.redirect("/admin/discounts_admin");
};

module.exports = discountAdminController;
