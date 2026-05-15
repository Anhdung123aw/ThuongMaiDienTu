const { json } = require("express");
const svgCaptcha = require("svg-captcha");

const db = require("../../config/db/connect");
const auth = require("../../models/customer/auth.model");
const jwt = require("jsonwebtoken");
const { promisify } = require("util");

const index = require("../../models/customer/index.model");

const authController = () => {};

// [GET] auth/register
authController.register = async (req, res) => {
  res.render("./pages/auth/register");
};

// [GET] auth/captcha
authController.getCaptcha = async (req, res) => {
  const captcha = svgCaptcha.create({
    size: 6,
    noise: 2,
    color: true,
    background: "#f0f0f0",
  });
  req.session.captcha = captcha.text.toLowerCase();
  res.type("svg");
  res.status(200).send(captcha.data);
};

// [POST] auth/send-otp
authController.sendOTP = async (req, res) => {
  const { user_phone } = req.body;
  if (!user_phone) {
    return res.json({ status: "error", error: "Thiếu số điện thoại" });
  }

  // Tạo mã OTP 6 số ngẫu nhiên
  const otp = Math.floor(100000 + Math.random() * 900000).toString();
  req.session.otp = otp;
  req.session.otpPhone = user_phone;

  console.log(`[OTP] Mã xác thực cho ${user_phone} là: ${otp}`);

  return res.json({
    status: "success",
    success: "Mã OTP đã được gửi (Kiểm tra console/thông báo)",
    otp: otp, // Trả về luôn để dễ test cho dự án demo
  });
};



// [POST] auth/register
authController.submitRegister = async (req, res) => {
  const { captcha, user_phone } = req.body;

  // Kiểm tra Captcha
  if (!captcha || captcha.toLowerCase() !== req.session.captcha) {
    return res.json({
      status: "error",
      error: "Mã xác nhận không chính xác",
    });
  }


  auth.registerPost(req, function (error, dupPhoneNumber, success) {
    if (error) {
      return res.json({
        status: "error",
        error: "Lỗi hệ thống khi đăng ký. Vui lòng thử lại sau.",
      });
    }
    if (dupPhoneNumber)
      return res.json({
        status: "error",
        error: "Số điện thoại đã được sử dụng",
      });

    if (success) {
      // Xóa captcha sau khi dùng xong
      delete req.session.captcha;

      // Đăng nhập luôn cho user sau khi đăng ký thành công
      auth.findNumberPhone(req, function (err, notFound, success, id) {
        if (success) {
          const token = jwt.sign(
            {
              id,
            },
            process.env.JWT_SECRET,
            {
              expiresIn: process.env.JWT_EXPIRES,
            }
          );

          const cookieOptions = {
            expires: new Date(
              Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
            ),
            httpOnly: true,
          };
          res.cookie("userSave", token, cookieOptions);
          return res.json({
            status: "success",
            success: "Đăng ký và đăng nhập thành công",
          });
        } else {
          // Nếu không tìm thấy user vừa tạo (hy hữu), vẫn báo thành công nhưng không login
          return res.json({
            status: "success",
            success: "Đăng ký thành công, vui lòng đăng nhập",
          });
        }
      });
    }
  });
};

// [GET] /login
authController.login = async (req, res) => {
  res.render("./pages/auth/login");
};

// [POST] /login
authController.submitLogin = async (req, res) => {
  const { captcha } = req.body;

  // Kiểm tra Captcha
  if (!captcha || captcha.toLowerCase() !== req.session.captcha) {
    return res.json({
      status: "error",
      error: "Mã xác nhận không chính xác",
    });
  }

  await auth.loginPost(
    req,
    function (err, nonePhoneNumber, NotMatchPassword, success, id) {
      if (err) res.render("./pages/site/404-error");
      if (nonePhoneNumber) {
        return res.json({
          status: "error",
          error: "Số điện thoại không tồn tại.",
        });
      }

      if (NotMatchPassword) {
        return res.json({
          status: "error2",
          error: "Mật khẩu không chính xác.",
        });
      }

      if (success) {
        const token = jwt.sign(
          {
            id,
          },
          process.env.JWT_SECRET,
          {
            expiresIn: process.env.JWT_EXPIRES,
          }
        );

        const cookieOptions = {
          expires: new Date(
            Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
          ),
          httpOnly: true,
        };
        res.cookie("userSave", token, cookieOptions);
        
        // Xóa captcha sau khi dùng xong
        delete req.session.captcha;

        return res.json({
          status: "success",
          success: "Bạn đã đăng nhập thành công",
        });
      }
    }
  );
};

authController.logout = async (req, res) => {
  res.cookie("userSave", "logout", {
    expires: new Date(Date.now() + 2 * 1000),
    httpOnly: true,
  });
  res.status(200).redirect("/");
};

authController.forgotPassword = async (req, res) => {
  let header_user = await index.header_user(req);
  let header = await index.header(req);

  const title = "Quên mật khẩu";
  res.render("./pages/auth/forgot", {
    header: header,
    user: header_user,
    title,
  });
};

authController.findUser = async (req, res) => {
  auth.findNumberPhone(req, function (err, notFound, success, user_id) {
    if (err) {
      return res.json({
        status: "error",
        error: "Lỗi truy cập.",
      });
    } else if (notFound) {
      return res.json({
        status: "notFound",
        error: "Số điện thoại không tồn tại.",
      });
    } else if (success) {
      return res.json({
        status: "success",
        user_id: user_id,
      });
    }
  });
};

authController.forgotPasswordPost = async (req, res) => {
  auth.findNumberPhone(req, function (err, notFound, success, user_id) {
    if (err) {
      return res.json({
        status: "error",
        error: "Lỗi truy cập.",
      });
    } else if (notFound) {
      return res.json({
        status: "notFound",
        error: "Số điện thoại không tồn tại.",
      });
    } else if (success) {
      return res.json({
        status: "success",
        user_id: user_id,
      });
    }
  });
};

authController.resetPassword = async (req, res) => {
    const user_new_password = req.body.user_password;
    const user_phone = req.body.user_phone;

    await auth.resetPassword(user_phone, user_new_password, function(err, results){
        if (err) {
            res.status(404).redirect.json({
                status: 'error',
            })
            throw err;
        }
        else {
            res.status(200).json({
                status: 'success',
            })
        }
    });
};

// [POST] /auth/change-password
authController.changePassPost = async (req, res) => {
  const user_phone = req.user.user_phone;
  const user_old_password = req.body.user_old_password;
  const user_new_password = req.body.user_new_password;

  auth.checkPhone(user_phone, async (err, result) => {
    if (err) {
      res.status(404).redirect('/error');
      throw err;
    }

    const user_password = result[0]?.user_password;
    //   console.log("pass: ", pass, "\noldPass: ", oldPass);
    await auth.checkOldPassword(
      user_old_password,
      user_password,
      async (notMatchPassword, matchPassword) => {
        if (notMatchPassword) {
          res.status(404).json({
            status: 'notMatchOldPassword',
            message: "Mật khẩu cũ không chính xác!",
          });
        } else if (matchPassword) {
          auth.resetPassword(user_phone, user_new_password, function (err, results){
            if (err) {
              res.status(404).redirect('/error')
              throw err;
            }
            else {
              res.status(200).json({
                  status: 'success',
              })
          }
          });
        }
      }
    );
  });
};

module.exports = authController;
