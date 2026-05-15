const db = require("./src/config/db/connect");

db.query("DESCRIBE users", (err, result) => {
    if (err) {
        console.error("Error describing users table:", err);
    } else {
        console.log("Users table schema:");
        console.table(result);
    }
    process.exit();
});
