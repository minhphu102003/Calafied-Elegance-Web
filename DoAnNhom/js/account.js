const linkmenus = document.querySelectorAll('.item-bar>a');
const linksubmenus = document.querySelectorAll(".item-submenu>a");

console.log(linksubmenus);
const submenu = document.querySelector('.sub-menu');
submenu.style.display = "none";

let index = 1;

for (let i = 0; i < linkmenus.length; i++) {
    linkmenus[i].addEventListener("click", function () {
        linkmenus[index].classList.remove('active');
        if (i === 0 && submenu.style.display === 'none') {
            submenu.style.display = "block";
            linksubmenus[1].classList.add('active');
        }
        else if (i === 0 && submenu.style.display === 'block') {
            return;
        }
        else {
            linkmenus[i].classList.add('active');
            submenu.style.display = "none";
            linksubmenus.forEach(item => {
                item.classList.remove('active');
            });
        }
    })
}

linksubmenus.forEach(item => {
    item.addEventListener("click", () => {
        linksubmenus.forEach(item => {
            item.classList.remove('active');
        });
        item.classList.add('active');
        linkmenus.forEach(item => {
            item.classList.remove('active');
        });
    })
})