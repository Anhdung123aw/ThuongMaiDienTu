const db = require("./src/config/db/connect");

db.query("DESCRIBE orders", (err, result) => {
    if (err) {
        console.error("Error describing orders table:", err);
    } else {
        console.log("Orders table schema:");
        console.table(result);
    }
    process.exit();
});
