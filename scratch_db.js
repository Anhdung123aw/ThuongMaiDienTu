const db = require("./src/config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);
const search = require("./src/models/customer/search.model");

async function check() {
  try {
    const req = {
      query: {
        searchKey: "",
        discount: "true"
      }
    };
    
    console.log("Running findProductsBySearchKey(req, 24) with discount=true...");
    const res1 = await search.findProductsBySearchKey(req, 24);
    console.log("Total rows found:", res1.totalRow);
    console.log("Products count:", res1.products.length);
    if (res1.products.length > 0) {
      console.log("First product sample:", {
        product_id: res1.products[0].product_id,
        product_name: res1.products[0].product_name,
        discount_amount: res1.products[0].discount_amount,
        product_variant_id: res1.products[0].product_variant_id
      });
    }

    const reqCate = {
      query: {
        category_id: 1, // Let's try category 1 or just check
        discount: "true"
      }
    };
    console.log("\nRunning findProductsByCateId(reqCate, 24) with discount=true...");
    const res2 = await search.findProductsByCateId(reqCate, 24);
    console.log("Total rows found for category:", res2.totalRow);
    console.log("Products count:", res2.products.length);
  } catch (err) {
    console.error(err);
  } finally {
    db.end();
  }
}

check();
