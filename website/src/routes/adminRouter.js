const express = require("express");
const router = express.Router();

// import controller
const authAdminController = require("../controllers/admin/authAdminController.js");
const dashboardAdminController = require("../controllers/admin/dashboardAdminController.js");
const cateAdminController = require("../controllers/admin/cateAdminController.js");
const upload = require("../config/upload");

//Thêm
const orderAdminController = require("../controllers/admin/orderAdminController.js");
const customerAdminController = require("../controllers/admin/customerAdminController.js");
//
// import middleware
const adminMiddleware = require("../middleware/adminMiddleware.js");

// admin auth
router.get("/login", adminMiddleware.checkAuth, authAdminController.getLogin);
router.post("/login", adminMiddleware.checkAuth, authAdminController.postLogin);
router.get("/logout", adminMiddleware.checkUnAuth, authAdminController.getLogout);

// admin dashboard
router.get("/dashboard", adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard);
router.get("/dashboard/getChart", adminMiddleware.isLoggedIn, dashboardAdminController.getChart);
router.get("/", adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard);

// admin cate management
router.get("/categories_admin/add", adminMiddleware.isLoggedIn, cateAdminController.addCategories);
router.get("/categories_admin", adminMiddleware.isLoggedIn, cateAdminController.getCategories);

// admin product management
router.get("/products_admin/add", adminMiddleware.isLoggedIn, cateAdminController.addProducts);
router.get("/products_admin", adminMiddleware.isLoggedIn, cateAdminController.getProducts);

//Thêm
const inventoryAdminController = require("../controllers/admin/inventoryAdminController.js");
router.get("/orders_admin", adminMiddleware.isLoggedIn, orderAdminController.getOrders);

router.get("/customers_admin", adminMiddleware.isLoggedIn, customerAdminController.getCustomers);

// ===== SỬA =====
router.get("/inventory_admin/edit/:id", adminMiddleware.isLoggedIn, inventoryAdminController.getEditPage);

// ===== UPDATE =====
router.post("/inventory_admin/update", adminMiddleware.isLoggedIn, inventoryAdminController.updateInventory);

// ===== XÓA =====
router.get("/inventory_admin/delete/:id", adminMiddleware.isLoggedIn, inventoryAdminController.deleteInventory);

router.get("/inventory_admin", adminMiddleware.isLoggedIn, inventoryAdminController.getInventory);

const discountAdminController = require("../controllers/admin/discountAdminController.js");
const productController = require("../controllers/admin/productController");
const uploadProduct = require("../config/upload1");
router.get("/discounts_admin", adminMiddleware.isLoggedIn, discountAdminController.getDiscounts);

const settingAdminController = require("../controllers/admin/settingAdminController.js");

router.get("/settings_admin", adminMiddleware.isLoggedIn, settingAdminController.getHomeSections);
router.post("/update-order-section", settingAdminController.updateOrderSection);
//

//
const cateAdminControllerAdd = require("../controllers/admin/cateAdminController_add");
router.post("/categories_admin/add", adminMiddleware.isLoggedIn, upload.single("category_img"), cateAdminControllerAdd.postAddCategory);
const cateAdminEditController = require("../controllers/admin/cateAdminEditController.js");
router.get("/products_admin/edit/:id", adminMiddleware.isLoggedIn, productController.getEditProduct);

router.post("/products_admin/edit/:id", adminMiddleware.isLoggedIn, uploadProduct.single("image"), productController.postEditProduct);
//

// GET danh sách
router.get("/products_admin", adminMiddleware.isLoggedIn, productController.getProducts);

// GET form thêm
router.get("/products_admin/add", adminMiddleware.isLoggedIn, productController.getAddProduct);
//
router.get("/products_admin/edit/:id", productController.getEditProduct);
router.post("/products_admin/edit/:id", uploadProduct.single("image"), productController.postEditProduct);
// POST thêm
router.post("/products_admin/add", adminMiddleware.isLoggedIn, uploadProduct.single("image"), productController.postAddProduct);

// XÓA
router.get("/products_admin/delete/:id", adminMiddleware.isLoggedIn, productController.deleteProduct);

// ẨN / HIỆN
router.get("/products_admin/toggle/:id", adminMiddleware.isLoggedIn, productController.toggleDisplay);
//
router.get("/categories_admin/edit/:id", adminMiddleware.isLoggedIn, cateAdminEditController.getEditCategory);

router.post("/categories_admin/edit/:id", adminMiddleware.isLoggedIn, upload.single("category_img"), cateAdminEditController.postEditCategory);
//
router.get("/discounts_admin/add", adminMiddleware.isLoggedIn, discountAdminController.getAddPage);

router.post("/discounts_admin/add", adminMiddleware.isLoggedIn, discountAdminController.postAddDiscount);
//
router.get("/discounts_admin/edit/:id", adminMiddleware.isLoggedIn, discountAdminController.getEditPage);

router.post("/discounts_admin/edit/:id", adminMiddleware.isLoggedIn, discountAdminController.updateDiscount);
router.get("/discounts_admin/delete/:id", adminMiddleware.isLoggedIn, discountAdminController.deleteDiscount);
// ===== EDIT CUSTOMER =====
router.get("/customers_admin/edit/:id", adminMiddleware.isLoggedIn, customerAdminController.getEditCustomer);

router.post("/customers_admin/edit/:id", adminMiddleware.isLoggedIn, customerAdminController.updateCustomer);

// ===== DELETE CUSTOMER =====
router.get("/customers_admin/delete/:id", adminMiddleware.isLoggedIn, customerAdminController.deleteCustomer);

//
router.get("/orders_admin/view/:id", adminMiddleware.isLoggedIn, orderAdminController.viewOrder);

router.get("/orders_admin/edit/:id", adminMiddleware.isLoggedIn, orderAdminController.getEditOrder);
router.post("/orders_admin/edit/:id", adminMiddleware.isLoggedIn, orderAdminController.updateOrder);
module.exports = router;
