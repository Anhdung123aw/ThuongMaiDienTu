const inputs = document.querySelectorAll(".register__input-field");
const toggle_btn = document.querySelectorAll(".register__toggle");
const main = document.querySelector("main");
const images = document.querySelectorAll(".register__image");

inputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

function moveSlider() {
  let index = 1;

  function transitionSlide() {
    let currentImage = document.querySelector(`.register__img-${index}`);
    images.forEach((img) => img.classList.remove("show"));
    currentImage.classList.add("show");

    index = (index % images.length) + 1;
  }

  return transitionSlide;
}

const autoSlide = moveSlider();

function startAutoSlide() {
  autoSlide();
  setTimeout(startAutoSlide, 3000); //tự động chuyển slide mỗi 3 giây
}

startAutoSlide();

const passwordInput = document.getElementById("password");
const togglePasswordButton = document.getElementById("togglePassword");

togglePasswordButton.addEventListener("click", function () {
  const isVisible = togglePasswordButton.getAttribute("data-visible") === "true";

  if (isVisible) {
    passwordInput.type = "password"; // Ẩn mật khẩu
    togglePasswordButton.setAttribute("data-visible", "false");
    togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility";
  } else {
    passwordInput.type = "text"; // Hiển thị mật khẩu
    togglePasswordButton.setAttribute("data-visible", "true");
    togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility_off";
  }
});

const passwordInputN = document.getElementById("passwordRepeat");
const togglePasswordButtonN = document.getElementById("togglePasswordN");

togglePasswordButtonN.addEventListener("click", function () {
  const isVisible = togglePasswordButtonN.getAttribute("data-visible") === "true";

  if (isVisible) {
    passwordInputN.type = "password"; // Ẩn mật khẩu
    togglePasswordButtonN.setAttribute("data-visible", "false");
    togglePasswordButtonN.querySelector(".material-symbols-outlined").textContent = "visibility";
  } else {
    passwordInputN.type = "text"; // Hiển thị mật khẩu
    togglePasswordButtonN.setAttribute("data-visible", "true");
    togglePasswordButtonN.querySelector(".material-symbols-outlined").textContent = "visibility_off";
  }
});

const form = document.getElementById("form");
const phoneNumber = document.getElementById("phoneNumber");
const password = document.getElementById("password");
const passwordRepeat = document.getElementById("passwordRepeat");

const captchaImg = document.getElementById("captcha-img");
const refreshCaptcha = document.getElementById("refresh-captcha");

const reloadCaptcha = () => {
  captchaImg.src = `/auth/captcha?t=${Date.now()}`;
};

if (captchaImg) {
  captchaImg.addEventListener("click", reloadCaptcha);
}
if (refreshCaptcha) {
  refreshCaptcha.addEventListener("click", reloadCaptcha);
}


form.addEventListener("submit", (e) => {
  //Ngăn chặn việc gửi form nếu có bất kỳ trường nào không hợp lệ
  e.preventDefault();
  //Kiểm tra dữ liệu nhập vào
  validateInput();
});

const setError = (element, message) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.register__error`);

  errorDisplay.innerText = message;
  inputControl.classList.add("error");
  inputControl.classList.remove("error");
};

const setSuccess = (element) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.register__error`);

  errorDisplay.innerText = "";
  inputControl.classList.add("success");
  inputControl.classList.remove("error");
};

const isValidPhoneNumber = (phoneNumber) => {
  const re = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
  return re.test(String(phoneNumber).trim());
};

//
const isValidName = (name) => {
  return !/\d/.test(name); // nếu có số → false
};

const isValidPassword = (password) => {
  const hasLetter = /[a-zA-Z]/.test(password);
  const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>_]/.test(password);
  return password.length >= 8 && hasLetter && hasSpecialChar;
};
//

const validateInput = async () => {
  // Lấy giá trị của các trường thông tin
  const userNameValue = userName.value.trim();
  const phoneNumberValue = phoneNumber.value.trim();
  const passwordValue = password.value.trim();
  const passwordRepeatValue = passwordRepeat.value.trim();

  // Kiểm tra giá trị của các trường thông tin
  let isAllValid = true;

  if (userNameValue === "") {
    setError(userName, "Vui lòng nhập họ tên!");
    isAllValid = false;
  } else if (!isValidName(userNameValue)) {
    setError(userName, "Tên không được chứa số và kí tự đặc biệt!");
    isAllValid = false;
  } else {
    setSuccess(userName);
  }

  if (phoneNumberValue === "") {
    setError(phoneNumber, "Vui lòng nhập số điện thoại!");
    isAllValid = false;
  } else if (!isValidPhoneNumber(phoneNumberValue)) {
    setError(phoneNumber, "Số điện thoại không đúng định dạng!");
    isAllValid = false;
  } else {
    setSuccess(phoneNumber);
  }

  if (passwordValue === "") {
    setError(password, "Vui lòng nhập mật khẩu!");
    isAllValid = false;
  } else if (!isValidPassword(passwordValue)) {
    setError(password, "Mật khẩu phải ít nhất 8 ký tự, bao gồm ít nhất 1 chữ cái và 1 ký tự đặc biệt!");
    isAllValid = false;
  } else if (passwordRepeatValue === "") {
    setError(passwordRepeat, "Vui lòng nhập lại mật khẩu!");
    isAllValid = false;
  } else if (passwordRepeatValue !== passwordValue) {
    setError(password, "Mật khẩu không khớp!");
    setError(passwordRepeat, "Mật khẩu không khớp!");
    isAllValid = false;
  } else {
    setSuccess(password);
    setSuccess(passwordRepeat);
  }

  const captcha = document.getElementById("captcha");
  const captchaValue = captcha.value.trim();

  if (captchaValue === "") {
    setError(captcha, "Vui lòng nhập mã xác nhận!");
    isAllValid = false;
  } else {
    setSuccess(captcha);
  }


  // Nếu tất cả các trường thông tin hợp lệ, thì gửi form
  if (isAllValid) {
    const register = {
      user_login_name: userName.value.trim(),
      user_phone: phoneNumber.value.trim(),
      user_password: password.value.trim(),
      captcha: captchaValue,
    };


    await fetch("/auth/register", {
      method: "POST",
      body: JSON.stringify(register),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then(async (back) => {
        if (back.status == "error") {
          setError(captcha, back.error);
          reloadCaptcha();
        } else {
          window.location.href = "/";
        }
      });
  }
};
