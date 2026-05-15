const db = require("./src/config/db/connect");
const bcrypt = require("bcryptjs");

async function testRegister() {
    const user_phone = "0123456789";
    const user_login_name = "Test User";
    const user_password = "password123";
    
    let hashedPassword = await bcrypt.hash(user_password, 8);

    const userData = {
        user_login_name: user_phone,
        user_phone: user_phone,
        user_name: user_login_name,
        user_password: hashedPassword,
        user_register_date: new Date().toISOString().slice(0, 10),
        user_active: 1,
    };

    db.query("INSERT INTO users SET ?", userData, (error, results) => {
        if (error) {
            console.error("Test registration failed:", error);
        } else {
            console.log("Test registration succeeded:", results);
            // Clean up
            db.query("DELETE FROM users WHERE user_phone = ?", [user_phone], (err) => {
                if (err) console.error("Cleanup failed:", err);
                else console.log("Cleanup succeeded");
                process.exit();
            });
        }
    });
}

testRegister();
