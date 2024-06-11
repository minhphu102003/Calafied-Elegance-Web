for (let i = 1; i <= 31; i++) {
  document.getElementById("ngay").innerHTML += `<option value="${i}">${i}</option>`;
}

// Tạo danh sách tháng từ 1 đến 12
for (let i = 1; i <= 12; i++) {
  document.getElementById("thang").innerHTML += `<option value="${i}">${i}</option>`;
}

// Tạo danh sách năm từ 1900 đến năm hiện tại
const currentYear = new Date().getFullYear();
for (let i = 1900; i <= currentYear; i++) {
  document.getElementById("nam1").innerHTML += `<option value="${i}">${i}</option>`;
}

const submenu = document.querySelector('.sub-menu');
const linkmenus = document.querySelectorAll('.item-bar>a');
const linksubmenus = document.querySelectorAll(".item-submenu>a");
linksubmenus[1].classList.add('active');
submenu.style.display = "block";

linkmenus.forEach(item => {
    item.classList.remove('active');
})
