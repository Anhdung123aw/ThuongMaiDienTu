const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);
const general = require("../general.model");
const indexAdmin = require("./indexAdmin.model");

const dashboard = function () {};

dashboard.getSummary = async (req, res) => {
  let getSummary = `SELECT * FROM view_dashboard`;
  let summary = await query(getSummary);
  summary[0].revenue = await indexAdmin.toCurrency(Number(summary[0].revenue));
  return summary[0];
};

dashboard.getChartTop5 = async (req, res) => {
  let getChartTop5 = `SELECT * FROM view_getchart_top5_product`;

  let chartTop5 = await query(getChartTop5);
  return chartTop5;
};

dashboard.getChartRevenue = async () => {
  const sql = `
        SELECT 
            DATE_FORMAT(order_date, '%Y-%m') AS month,

            COUNT(*) AS total_orders,

            SUM(CASE 
                WHEN order_status = 'Đã hủy' THEN 1 
                ELSE 0 
            END) AS order_cancel,

            SUM(CASE 
                WHEN order_status != 'Đã hủy' THEN 1 
                ELSE 0 
            END) AS order_paid

        FROM orders
        GROUP BY DATE_FORMAT(order_date, '%Y-%m')
        ORDER BY month ASC
    `;

  return await query(sql);
};
dashboard.getChartCategory = async () => {
  const sql = `
        SELECT 
            c.category_name,
            SUM(od.order_detail_price_after * od.order_detail_quantity) AS revenue
        FROM orders o
        JOIN order_details od ON o.order_id = od.order_id
        JOIN products p ON od.product_variant_id = p.product_id
        JOIN categories c ON p.category_id = c.category_id
        WHERE o.order_status != 'Đã hủy'
        GROUP BY c.category_id, c.category_name
    `;

  return await query(sql);
};
module.exports = dashboard;
