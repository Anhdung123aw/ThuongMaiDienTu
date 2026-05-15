const db = require("./src/config/db/connect");

db.query("SELECT * FROM orders ORDER BY order_id DESC LIMIT 5", (err, result) => {
    if (err) {
        console.error("Error fetching orders:", err);
    } else {
        console.log("Latest orders:");
        console.table(result);
    }
    process.exit();
});
