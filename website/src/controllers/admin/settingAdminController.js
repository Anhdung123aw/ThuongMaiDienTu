const db = require("../../config/db/connect");
const util = require("node:util");

const query = util.promisify(db.query).bind(db);

const settingAdminController = () => {};

settingAdminController.getHomeSections = async (req, res) => {
  try {
    const title = "CÀI ĐẶT";
    let admin = req.admin;

    // LẤY DATA
    let sql = `
      SELECT 
        id,
        section_key,
        display_order
      FROM home_sections
      ORDER BY display_order ASC
    `;

    let sections = await query(sql);

    res.status(200).render("admin/pages/settings_admin", {
      title,
      admin,
      data: {
        sections: sections,
        totalRow: sections.length,
      },
    });
  } catch (error) {
    console.error("Lỗi lấy home_sections:", error);
    res.render("pages/site/404-error");
  }
};

settingAdminController.updateOrderSection = async (req, res) => {
  try {
    console.log("BODY:", req.body); // 👈 thêm dòng này

    let { id, newOrder } = req.body;
    newOrder = parseInt(newOrder);

    const current = await query(
      "SELECT display_order FROM home_sections WHERE id = ?",
      [id]
    );

    if (!current.length) {
      return res.json({ success: false });
    }

    const oldOrder = current[0].display_order;

    if (oldOrder === newOrder) {
      return res.json({ success: true });
    }

    const target = await query(
      "SELECT id FROM home_sections WHERE display_order = ?",
      [newOrder]
    );

    const temp = -1;

    // B1
    await query("UPDATE home_sections SET display_order = ? WHERE id = ?", [
      temp,
      id,
    ]);

    // B2
    if (target.length) {
      await query("UPDATE home_sections SET display_order = ? WHERE id = ?", [
        oldOrder,
        target[0].id,
      ]);
    }

    // B3
    await query("UPDATE home_sections SET display_order = ? WHERE id = ?", [
      newOrder,
      id,
    ]);

    res.json({ success: true });
  } catch (err) {
    console.error("ERROR UPDATE:", err);
    res.json({ success: false, error: err.message });
  }
};

module.exports = settingAdminController;
