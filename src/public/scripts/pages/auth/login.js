const inputs = document.querySelectorAll(".login__input-field");
const toggle_btn = document.querySelectorAll(".login__toggle");
const main = document.querySelector("main");
const images = document.querySelectorAll(".login__image");

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
        let currentImage = document.querySelector(`.login__img-${index}`);
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
        passwordInput.type = "Password"; // Ẩn mật khẩu
        togglePasswordButton.setAttribute("data-visible", "false");
        togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility";


    } else {
        passwordInput.type = "text"; // Hiển thị mật khẩu
        togglePasswordButton.setAttribute("data-visible", "true");
        togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility_off";

    }
});

const form = document.getElementById('form');
const phoneNumber = document.getElementById('phoneNumber');
const password = document.getElementById('password');
const captcha = document.getElementById('captcha');
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


form.addEventListener('submit', e => {
    e.preventDefault();

    validateInput();
});


const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(`.login__error`);

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('error');
}

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(`.login__error`);

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
}

const isValidPhoneNumber = phoneNumber => {
    const re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
    return re.test(String(phoneNumber).trim());
}

const isValidPassword = password => {
    const hasLetter = /[a-zA-Z]/.test(password);
    const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>_]/.test(password);
    return password.length >= 8 && hasLetter && hasSpecialChar;
}

const validateInput = () => {

    const PhoneNumberValue = phoneNumber.value.trim();
    const PasswordValue = password.value.trim();

    let isAllValid = true;

    if (PhoneNumberValue === '') {
        setError(phoneNumber, 'Vui lòng nhập số điện thoại!');
        isAllValid = false;
    } else if (!isValidPhoneNumber(PhoneNumberValue)) {
        setError(phoneNumber, 'Số điện thoại không đúng định dạng!')
        isAllValid = false;
    } else {
        setSuccess(phoneNumber);
    }

    if (PasswordValue === '') {
        setError(password, 'Vui lòng nhập mật khẩu!');
        isAllValid = false;
    } else if (!isValidPassword(PasswordValue)) {
        setError(password, 'Mật khẩu phải ít nhất 8 ký tự, bao gồm ít nhất 1 chữ cái và 1 ký tự đặc biệt!');
        isAllValid = false;
    } else {
        setSuccess(password);
    }

    const captchaValue = captcha.value.trim();
    if (captchaValue === '') {
        setError(captcha, 'Vui lòng nhập mã xác nhận!');
        isAllValid = false;
    } else {
        setSuccess(captcha);
    }

    if (isAllValid) {
        const login = {
            phoneNumber: phoneNumber.value.trim(),
            password: password.value.trim(),
            captcha: captcha.value.trim()
        }
        fetch("/auth/login", {
            method: 'POST',
            body: JSON.stringify(login),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => res.json()).then(back => {
            if (back.status == "error") {
                setError(phoneNumber, back.error);
                if (back.error.includes("Mã xác nhận")) {
                    setError(captcha, back.error);
                    reloadCaptcha();
                }
            }
            else if (back.status == "error2") {
                setError(password, back.error);
                reloadCaptcha();
            }
            else {
                window.location.href = '/'
            }
        })
    }
};
