const userIcon = document.querySelector('.user');
const formLogin = document.querySelector('.form-login');
userIcon.addEventListener("click", () => {
    formLogin.style.display = "block";
});

const close = formLogin.querySelector('.button-close');
close.addEventListener("click", () => {
    formLogin.style.display = 'none';
})