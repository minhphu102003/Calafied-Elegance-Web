const eye = document.querySelector('.container-input>i');
const password = document.querySelector('#password');
eye.addEventListener("click",function(){
  if(password.type == "password"){
    password.setAttribute('type','text');
    eye.classList.remove('fa-eye-slash');
    eye.classList.add('fa-eye');
  }
  else{
    password.setAttribute('type', 'password') ;
    eye.classList.remove('fa-eye');
    eye.classList.add('fa-eye-slash');
  }
})