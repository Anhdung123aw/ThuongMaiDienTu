const general = require("../../models/general.model");
const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const orderAdminController = () => {};

orderAdminController.getOrders = async (req, res) => {
  const title = "QUẢN LÝ ĐƠN HÀNG";
  let admin = req.admin;

  let page = parseInt(req.query.page) || 1;
  let limit = 10;
  let offset = (page - 1) * limit;

  // COUNT
  let countSql = `SELECT COUNT(*) AS total FROM orders`;
  let countResult = await query(countSql);
  let totalRow = countResult[0].total;
  let totalPage = Math.ceil(totalRow / limit);

  // DATA
  let sql = `
        SELECT 
            o.order_id,
            o.order_name,
            o.order_date,
            o.order_delivery_address,
            o.order_status,
            COALESCE(SUM(od.order_detail_quantity * od.order_detail_price_after), 0) AS order_total_after
        FROM orders o
        LEFT JOIN order_details od 
            ON o.order_id = od.order_id
        GROUP BY 
            o.order_id,
            o.order_name,
            o.order_date,
            o.order_delivery_address,
            o.order_status
        ORDER BY o.order_id DESC
        LIMIT ${limit} OFFSET ${offset}
    `;

  let orders = await query(sql);

  let formatFunction = await general.formatFunction();

  res.status(200).render("admin/pages/orders_admin", {
    title,
    admin,
    data: {
      orders,
      totalRow,
      totalPage,
      page,
      limit,
    },
    formatFunction,
  });
};
orderAdminController.viewOrder = async (req, res) => {
  const title = "CHI TIẾT ĐƠN HÀNG";
  let id = req.params.id;

  let sql = `
    SELECT 
    o.*,
    od.order_detail_quantity,
    od.order_detail_price_after,

    pv.product_variant_name,
    pv.product_id,              -- 🔥 BẮT BUỘC CÓ DÒNG NÀY
    pv.product_variant_price,

    p.product_name,
    p.product_avt_img,
    p.product_id AS real_product_id, -- (optional nhưng an toàn)

    pm.paying_method_name

FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN product_variants pv ON od.product_variant_id = pv.product_variant_id
JOIN products p ON pv.product_id = p.product_id
JOIN paying_methods pm ON o.paying_method_id = pm.paying_method_id
WHERE o.order_id = ?
`;

  let rows = await query(sql, [id]);

  res.render("admin/pages/orders_view_admin", {
    title,
    order: rows[0],
    admin: req.admin,
    items: rows,
  });
};
orderAdminController.getEditOrder = async (req, res) => {
  const title = "SỬA ĐƠN HÀNG";
  let id = req.params.id;

  // =========================
  // 1. LẤY THÔNG TIN ĐƠN HÀNG
  // =========================
  let orderSql = `
    SELECT 
      o.*,
      pm.paying_method_name
    FROM orders o
    LEFT JOIN paying_methods pm 
      ON o.paying_method_id = pm.paying_method_id
    WHERE o.order_id = ?
  `;

  let orderRows = await query(orderSql, [id]);

  // =========================
  // 2. LẤY DANH SÁCH PHƯƠNG THỨC THANH TOÁN
  // =========================
  let paymentSql = `
    SELECT *
    FROM paying_methods
    WHERE paying_method_is_display = 1
  `;

  let paymentMethods = await query(paymentSql);

  // =========================
  // 3. LẤY CHI TIẾT ĐƠN HÀNG (ITEMS)
  // =========================
  let itemsSql = `
    SELECT 
      od.*,
      pv.product_variant_name,
      pv.product_id,
      pv.product_variant_price,
      p.product_name,
      p.product_avt_img
    FROM order_details od
    JOIN product_variants pv 
      ON od.product_variant_id = pv.product_variant_id
    JOIN products p 
      ON pv.product_id = p.product_id
    WHERE od.order_id = ?
  `;

  let items = await query(itemsSql, [id]);

  // =========================
  // 4. RENDER VIEW
  // =========================
  res.render("admin/pages/orders_edit_admin", {
    title,
    order: orderRows[0] || null,
    items: items || [], // 🔥 FIX items is not defined
    paymentMethods: paymentMethods || [], // 🔥 FIX paymentMethods is not defined
    admin: req.admin, // 🔥 FIX sidebar crash
  });
};
orderAdminController.updateOrder = async (req, res) => {
  let id = req.params.id;

  let { order_name, order_phone, order_status, order_delivery_address, order_note } = req.body;

  let sql = `
    UPDATE orders 
    SET 
      order_name = ?,
      order_phone = ?,
      order_status = ?,
      order_delivery_address = ?,
      order_note = ?
    WHERE order_id = ?
  `;

  await query(sql, [order_name, order_phone, order_status, order_delivery_address, order_note, id]);

  res.redirect("/admin/orders_admin");
};
module.exports = orderAdminController;
