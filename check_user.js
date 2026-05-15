const db = require("./src/config/db/connect");

db.query("SELECT * FROM view_user WHERE user_phone = '0346367112'", (err, result) => {
    if (err) {
        console.error("Error fetching user:", err);
    } else {
        console.log("User details from view_user:");
        console.table(result);
    }
    process.exit();
});
