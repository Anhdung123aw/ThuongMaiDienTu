const db = require("./src/config/db/connect");

db.query("DESCRIBE customers", (err, result) => {
    if (err) {
        console.error("Error describing customers table:", err);
    } else {
        console.log("Customers table schema:");
        console.table(result);
    }
    process.exit();
});
