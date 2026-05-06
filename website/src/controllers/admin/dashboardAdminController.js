const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const general = require("../../models/general.model");
const dashboard = require("../../models/admin/dashboardAdmin.model");
const dashboardController = {};

/* =========================
   DASHBOARD MAIN
========================= */
dashboardController.getDashboard = async (req, res) => {
  const title = "DASHBOARD";
  let admin = req.admin;

  /* =========================
     SUMMARY DATA FIXED
  ========================= */

  // 1. Tổng khách hàng (users)
  const customerSql = `
    SELECT COUNT(*) AS customer_count 
    FROM users
    WHERE user_active = 1
  `;

  // 2. Tổng đơn hàng
  const orderSql = `
    SELECT COUNT(*) AS order_count 
    FROM orders
  `;

  // 3. Tổng doanh thu (lấy từ order_details)
  const revenueSql = `
    SELECT COALESCE(SUM(order_detail_price_after * order_detail_quantity),0) AS revenue
    FROM order_details
  `;

  const customerData = await query(customerSql);
  const orderData = await query(orderSql);
  const revenueData = await query(revenueSql);

  let summary = {
    customer_count: customerData[0].customer_count,
    quantity_sold: orderData[0].order_count,
    revenue: revenueData[0].revenue,
  };

  res.status(200).render("./admin/pages/dashboard_admin", {
    admin,
    title,
    summary,
    toCurrency: general.toCurrency,
  });
};

/* =========================
   CHART DATA
========================= */
dashboardController.getChart = async (req, res) => {
  let chartRevenue = await dashboard.getChartRevenue();
  let chartCategory = await dashboard.getChartCategory();
  return res.json({
    status: "success",
    chartRevenueData: chartRevenue,
    chartCategoryData: chartCategory,
  });
};
/* =========================
   TOP 5 PRODUCT (OPTION)
========================= */
async function getTop5Products() {
  const sql = `
    SELECT 
      p.product_name,
      SUM(od.order_detail_quantity) AS total_sold
    FROM order_details od
    JOIN product_variants pv ON od.product_variant_id = pv.product_variant_id
    JOIN products p ON pv.product_id = p.product_id
    GROUP BY p.product_id
    ORDER BY total_sold DESC
    LIMIT 5
  `;
  return await query(sql);
}

/* =========================
   MONTHLY REVENUE
========================= */
async function getMonthlyRevenue() {
  const sql = `
    SELECT 
      MONTH(o.order_date) AS month,
      SUM(od.order_detail_price_after * od.order_detail_quantity) AS revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY MONTH(o.order_date)
    ORDER BY month ASC
  `;
  return await query(sql);
}

/* =========================
   CATEGORY PAGE (FIX BASIC)
========================= */
dashboardController.getCategory = async (req, res) => {
  const title = "QUẢN LÝ DANH MỤC SẢN PHẨM";
  let searchKey = req.query.searchKey || "";

  let sql = `
    SELECT * FROM categories
  `;

  if (searchKey) {
    sql += `
      WHERE category_name LIKE '%${searchKey}%'
      OR category_id LIKE '%${searchKey}%'
    `;
  }

  const categories = await query(sql);

  res.render("admin/pages/cate_admin", {
    title,
    categories,
    data: {
      categories,
      totalRow: categories.length,
      searchKey,
    },
  });
};

/* =========================
   ORDERS PAGE (FIXED)
========================= */
dashboardController.getOrders = async (req, res) => {
  const title = "QUẢN LÝ ĐƠN HÀNG";

  const sql = `
    SELECT 
      o.*,
      u.user_name,
      SUM(od.order_detail_quantity * od.order_detail_price_after) AS total
    FROM orders o
    LEFT JOIN users u ON o.customer_id = u.user_id
    LEFT JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id
    ORDER BY o.order_id DESC
  `;

  const orders = await query(sql);

  res.render("admin/pages/orders_admin", {
    title,
    orders,
  });
};

module.exports = dashboardController;
