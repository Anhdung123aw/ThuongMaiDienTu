const db = require("../../config/db/connect");
const util = require("node:util");
const query = util.promisify(db.query).bind(db);

const search = function () {};

// ============================
// SEARCH + FILTER + SORT FIXED FULL
// ============================
search.findProductsBySearchKey = async (req, limit = 24) => {
  const searchKey = req.query.searchKey || "";
  const minPrice = req.query.minPrice;
  const maxPrice = req.query.maxPrice;
  const sort = req.query.sort;
  const discount = req.query.discount === "true" || req.query.discount === true;

  let where = `
    WHERE p.product_is_display = 1
      AND pv.product_variant_is_display = 1
      AND pv.product_variant_id = (
        SELECT MIN(pv2.product_variant_id)
        FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
        AND pv2.product_variant_is_display = 1
      )
  `;

  let params = [];

  // =========================
  // SEARCH
  // =========================
  if (searchKey) {
    where += ` AND p.product_name LIKE ?`;
    params.push(`%${searchKey}%`);
  }

  // =========================
  // PRICE FILTER
  // =========================
  if (minPrice && maxPrice) {
    where += `
      AND EXISTS (
        SELECT 1 FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
        AND pv2.product_variant_price BETWEEN ? AND ?
      )
    `;
    params.push(Number(minPrice), Number(maxPrice));
  } else {
    if (minPrice) {
      where += `
        AND EXISTS (
          SELECT 1 FROM product_variants pv2
          WHERE pv2.product_id = p.product_id
          AND pv2.product_variant_price >= ?
        )
      `;
      params.push(Number(minPrice));
    }

    if (maxPrice) {
      where += `
        AND EXISTS (
          SELECT 1 FROM product_variants pv2
          WHERE pv2.product_id = p.product_id
          AND pv2.product_variant_price <= ?
        )
      `;
      params.push(Number(maxPrice));
    }
  }

  // =========================
  // SORT FIXED
  // =========================
  let orderBy = `ORDER BY p.product_id DESC`;

  if (sort === "price_asc") {
    orderBy = `
      ORDER BY (
        SELECT MIN(pv2.product_variant_price)
        FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
      ) ASC
    `;
  }

  if (sort === "price_desc") {
    orderBy = `
      ORDER BY (
        SELECT MIN(pv2.product_variant_price)
        FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
      ) DESC
    `;
  }

  if (sort === "rating_desc") orderBy = `ORDER BY p.product_rate DESC`;
  if (sort === "best_seller") orderBy = `ORDER BY p.product_view_count DESC`;

  // =========================
  // DISCOUNT FILTER
  // =========================
  if (discount) {
    where += ` AND vd.discount_amount IS NOT NULL`;
  }

  // =========================
  // COUNT QUERY
  // =========================
  const countSQL = `
    SELECT COUNT(DISTINCT p.product_id) as total
    FROM products p
    JOIN product_variants pv ON pv.product_id = p.product_id
    LEFT JOIN view_discounts vd ON pv.discount_id = vd.discount_id
    ${where}
  `;

  const countResult = await query(countSQL, params);
  const totalRow = countResult[0].total || 0;

  // =========================
  // PAGINATION FIX (QUAN TRỌNG)
  // =========================
  let page = parseInt(req.query.page);
  if (!page || page < 1) page = 1;

  let totalPage = Math.ceil(totalRow / limit);
  if (totalPage < 1) totalPage = 1;

  if (page > totalPage) page = totalPage;

  let start = (page - 1) * limit;
  if (start < 0) start = 0;

  // =========================
  // DATA QUERY
  // =========================
  const dataSQL = `
    SELECT 
      p.*,
      pv.product_variant_id,
      pv.product_variant_name,
      pv.product_variant_price,
      pv.product_variant_available,
      pv.unit,
      vd.discount_amount,
      vd.discount_description,
      c.category_name
    FROM products p
    JOIN product_variants pv 
      ON pv.product_id = p.product_id
    LEFT JOIN view_discounts vd
      ON pv.discount_id = vd.discount_id
    LEFT JOIN categories c
      ON p.category_id = c.category_id
    ${where}
    ${orderBy}
    LIMIT ?, ?
  `;

  const finalParams = [...params, start, limit];

  const products = await query(dataSQL, finalParams);

  return {
    products,
    searchKey,
    category_id: null,
    minPrice,
    maxPrice,
    sort,
    discount,
    totalRow,
    totalPage,
    page,
    limit,
  };
};

search.findProductsByCateId = async (req, limit = 24) => {
  const category_id = req.query.category_id;
  const minPrice = req.query.minPrice;
  const maxPrice = req.query.maxPrice;
  const sort = req.query.sort;
  const discount = req.query.discount === "true" || req.query.discount === true;

  let where = `
    WHERE p.product_is_display = 1
      AND pv.product_variant_is_display = 1
      AND pv.product_variant_id = (
        SELECT MIN(pv2.product_variant_id)
        FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
        AND pv2.product_variant_is_display = 1
      )
  `;

  let params = [];

  // =========================
  // CATEGORY FILTER
  // =========================
  if (category_id) {
    where += ` AND p.category_id = ?`;
    params.push(category_id);
  }

  // =========================
  // PRICE FILTER
  // =========================
  if (minPrice && maxPrice) {
    where += `
      AND EXISTS (
        SELECT 1 FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
        AND pv2.product_variant_price BETWEEN ? AND ?
      )
    `;
    params.push(Number(minPrice), Number(maxPrice));
  } else {
    if (minPrice) {
      where += `
        AND EXISTS (
          SELECT 1 FROM product_variants pv2
          WHERE pv2.product_id = p.product_id
          AND pv2.product_variant_price >= ?
        )
      `;
      params.push(Number(minPrice));
    }

    if (maxPrice) {
      where += `
        AND EXISTS (
          SELECT 1 FROM product_variants pv2
          WHERE pv2.product_id = p.product_id
          AND pv2.product_variant_price <= ?
        )
      `;
      params.push(Number(maxPrice));
    }
  }

  // =========================
  // SORT FIXED
  // =========================
  let orderBy = `ORDER BY p.product_id DESC`;

  if (sort === "price_asc") {
    orderBy = `
      ORDER BY (
        SELECT MIN(pv2.product_variant_price)
        FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
      ) ASC
    `;
  }

  if (sort === "price_desc") {
    orderBy = `
      ORDER BY (
        SELECT MIN(pv2.product_variant_price)
        FROM product_variants pv2
        WHERE pv2.product_id = p.product_id
      ) DESC
    `;
  }

  if (sort === "rating_desc") orderBy = `ORDER BY p.product_rate DESC`;
  if (sort === "best_seller") orderBy = `ORDER BY p.product_view_count DESC`;

  // =========================
  // DISCOUNT FILTER
  // =========================
  if (discount) {
    where += ` AND vd.discount_amount IS NOT NULL`;
  }

  // =========================
  // COUNT QUERY
  // =========================
  const countSQL = `
    SELECT COUNT(DISTINCT p.product_id) as total
    FROM products p
    JOIN product_variants pv ON pv.product_id = p.product_id
    LEFT JOIN view_discounts vd ON pv.discount_id = vd.discount_id
    ${where}
  `;

  const countResult = await query(countSQL, params);
  const totalRow = countResult[0].total || 0;

  // =========================
  // PAGINATION FIX (QUAN TRỌNG)
  // =========================
  let page = parseInt(req.query.page);
  if (!page || page < 1) page = 1;

  let totalPage = Math.ceil(totalRow / limit);
  if (totalPage < 1) totalPage = 1;

  if (page > totalPage) page = totalPage;

  let start = (page - 1) * limit;
  if (start < 0) start = 0;

  // =========================
  // DATA QUERY
  // =========================
  const dataSQL = `
    SELECT 
      p.*,
      pv.product_variant_id,
      pv.product_variant_name,
      pv.product_variant_price,
      pv.product_variant_available,
      pv.unit,
      vd.discount_amount,
      vd.discount_description,
      c.category_name
    FROM products p
    JOIN product_variants pv 
      ON pv.product_id = p.product_id
    LEFT JOIN view_discounts vd
      ON pv.discount_id = vd.discount_id
    LEFT JOIN categories c
      ON p.category_id = c.category_id
    ${where}
    ${orderBy}
    LIMIT ?, ?
  `;

  const finalParams = [...params, start, limit];

  const products = await query(dataSQL, finalParams);

  return {
    products,
    category_id,
    searchKey: null,
    minPrice,
    maxPrice,
    sort,
    discount,
    totalRow,
    totalPage,
    page,
    limit,
  };
};

module.exports = search;
