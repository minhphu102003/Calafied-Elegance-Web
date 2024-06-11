const eyes = document.querySelectorAll('.fa-eye-slash');
const confirmPassword = document.querySelector("#confirmpassword");
const password = document.querySelector('#password');
for (let i = 0; i < eyes.length; i++) {
    eyes[i].addEventListener("click", function () {
        if (i === 0) {
            if (password.type === 'text') {
                password.setAttribute("type", "password");
                eyes[i].classList.remove('fa-eye');
                eyes[i].classList.add('fa-eye-slash');
            }
            else {
                password.setAttribute("type", "text");
                eyes[i].classList.remove('fa-eye-slash');
                eyes[i].classList.add('fa-eye');
            }
        }
        else {
            if (confirmPassword.type === 'text') {
                confirmPassword.setAttribute("type", "password");
                eyes[i].classList.remove('fa-eye');
                eyes[i].classList.add('fa-eye-slash');
            }
            else {
                confirmPassword.setAttribute("type", "text");
                eyes[i].classList.remove('fa-eye-slash');
                eyes[i].classList.add('fa-eye');
            }
        }
    });
}

function checkValid(inputElement) {
    if (inputElement.value === "") {
        inputElement.nextElementSibling.textContent = "Trường này bắt buộc phải nhập";
        inputElement.classList.add("invalid");
        return false;
    } else {
        inputElement.nextElementSibling.textContent = "";
        inputElement.classList.remove("invalid");
        return true;
    }
}

function checkValidBlurHandler() {
    checkValid(this);
}

function emailBlurHandler() {
    checkEmail(this);
}

function changelFocusHandler() {
    change(this);
}

function checkEmail(inputElement) {
    if (!checkValid(inputElement)) {
        return false;
    }
    else {
        let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!regex.test(inputElement.value)) {
            inputElement.nextElementSibling.textContent = "Vui lòng nhập email đúng định dạng";
            inputElement.classList.add("invalid");
            return false;
        }
        else {
            inputElement.nextElementSibling.textContent = "";
            inputElement.classList.remove('invalid');
            return true;
        }
    }
}

function change(inputElement) {
    inputElement.nextElementSibling.textContent = "";
    inputElement.classList.remove("invalid");
}

const email = document.querySelector("#email");
email.addEventListener("blur", emailBlurHandler);
email.addEventListener("focus", changelFocusHandler);

const userName = document.querySelector('#username');
userName.addEventListener("blur", checkValidBlurHandler);
userName.addEventListener("focus", changelFocusHandler);

function checkPassword(inputElement) {
    const minLength = 8;
    const maxLength = 20;
    const hasNumber = /\d/;
    const hasUpperCase = /[A-Z]/;
    const hasLowerCase = /[a-z]/;
    const hasSpecialChar = /[@!$#%]/;
    if (!checkValid(inputElement)) {
        return false;
    }
    else if (inputElement.value.length < minLength || inputElement.value.length > maxLength) {
        inputElement.nextElementSibling.textContent = "Mật khẩu phải đảm bảo số lượng trong khoảng từ 8 đến 20 kí tự";
        inputElement.classList.add("invalid");
        return false;
    }
    else if (!hasNumber.test(inputElement.value) || !hasUpperCase.test(inputElement.value) || !hasLowerCase.test(inputElement.value) || !hasSpecialChar.test(inputElement.value)) {
        inputElement.nextElementSibling.textContent = "Mật khẩu phải có chữ viết thường in hoa và kí tự đặt biệt";
        inputElement.classList.add("invalid");
        return false;
    }
    else {
        inputElement.nextElementSibling.textContent = "";
        inputElement.classList.remove("invalid");
        return true;
    }
}

function passwordBlurHandler() {
    checkPassword(this);
}

password.addEventListener("blur", passwordBlurHandler);
password.addEventListener("focus", changelFocusHandler);

function confirmPassword1(inputElement) {
    if (!checkValid(inputElement)) {
        return false;
    }
    else if (inputElement.value !== password.value) {
        inputElement.nextElementSibling.textContent = "Mật khẩu nhập không trùng khớp ";
        inputElement.classList.add('invalid');
        return false;
    }
    else {
        inputElement.nextElementSibling.textContent = "";
        inputElement.classList.remove('invalid');
        return true;
    }
}

function confirmPassworddBlurHandler() {
    confirmPassword1(this);
}

confirmPassword.addEventListener("blur", confirmPassworddBlurHandler);
confirmPassword.addEventListener("focus", changelFocusHandler);

function submit() {
    if (!checkEmail(email) || !checkValid(userName) || !checkPassword(password) || !confirmPassword1(confirmPassword)) {
        window.alert("Đăng kí không thành công");
        return;
    }
    else {
        var dataInput = {
            email: email.value,
            userName: userName.value,
            password: password.value
        }
        $.ajax({
            type: "POST",
            url: "/api/data/postdata",
            data: JSON.stringify(dataInput),
            contentType: "application/json",
            success: function (response) {
                window.alert("Đăng kí thành công");
            },
            error: function (error) {
                console.error("Lỗi khi gửi dữ liệu: ", error);
            }
        });
        return;
    }
}

const buttonSubmit = document.querySelector('.register-button');
buttonSubmit.addEventListener("click", submit);