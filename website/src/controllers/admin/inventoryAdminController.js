const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const inventoryAdminController = {};

inventoryAdminController.getInventory = async (req, res) => {
  const title = "QUẢN LÝ KHO";
  let admin = req.admin;

  let page = parseInt(req.query.page) || 1;
  let limit = 10;
  let offset = (page - 1) * limit;

  // COUNT
  let countSql = `SELECT COUNT(*) AS total FROM product_variants`;
  let countResult = await query(countSql);
  let totalRow = countResult[0].total;
  let totalPage = Math.ceil(totalRow / limit);

  // DATA (JOIN)
  let sql = `
  SELECT 
    pv.product_variant_id,
    pv.product_variant_name,
    pv.product_variant_price,
    pv.product_variant_available,
    pv.product_variant_is_bestseller,

    p.product_id,
    p.product_name,
    p.product_avt_img,

    d.discount_name

  FROM product_variants pv
  JOIN products p 
    ON pv.product_id = p.product_id

  LEFT JOIN discounts d 
    ON pv.discount_id = d.discount_id

  ORDER BY pv.product_variant_id ASC
  LIMIT ${limit} OFFSET ${offset}
`;

  let inventory = await query(sql);

  res.render("admin/pages/inventory_admin", {
    title,
    admin,
    data: {
      inventory,
      totalRow,
      totalPage,
      page,
      limit,
    },
  });
};
inventoryAdminController.getEditPage = async (req, res) => {
  const id = req.params.id;
  let admin = req.admin;
  const sql = `
    SELECT 
      pv.*,
      p.product_name,
      p.product_id,  
      p.product_avt_img, 
      d.discount_id
    FROM product_variants pv
    JOIN products p ON pv.product_id = p.product_id
    LEFT JOIN discounts d ON pv.discount_id = d.discount_id
    WHERE pv.product_variant_id = ?
  `;

  const result = await query(sql, [id]);

  // lấy danh sách khuyến mãi
  const discounts = await query("SELECT * FROM discounts");

  res.render("admin/pages/edit_inventory", {
    admin,
    item: result[0],
    discounts,
  });
};
inventoryAdminController.updateInventory = async (req, res) => {
  const { product_variant_id, price, variant_name, is_bestseller, discount_id, quantity } = req.body;

  if (quantity < 0) {
    return res.send("Số lượng không hợp lệ");
  }

  const sql = `
    UPDATE product_variants
    SET 
      product_variant_price = ?,
      product_variant_name = ?,
      product_variant_is_bestseller = ?,
      discount_id = ?,
      product_variant_available = ?
    WHERE product_variant_id = ?
  `;

  await query(sql, [price, variant_name, is_bestseller, discount_id || null, quantity, product_variant_id]);

  res.redirect("/admin/inventory_admin");
};
inventoryAdminController.deleteInventory = async (req, res) => {
  const id = req.params.id;

  const sql = `DELETE FROM product_variants WHERE product_variant_id = ?`;

  await query(sql, [id]);

  res.redirect("/admin/inventory_admin");
};
module.exports = inventoryAdminController;
