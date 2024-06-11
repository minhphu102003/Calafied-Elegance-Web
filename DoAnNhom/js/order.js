
const listStatus = document.querySelectorAll('.item-status');
listStatus.forEach(item => {
    item.addEventListener("click", function () {
        listStatus.forEach(item => {
            item.classList.remove('active');
        })
        item.classList.add('active');
    });
});


function getLastCharacterOfHref() {
    var currentURL = window.location.href;
    var lastChar = currentURL.charAt(currentURL.length - 1);

    if (!isNaN(lastChar)) {
        listStatus[0].classList.remove('active');
        var targetIndex = parseInt(lastChar);
        listStatus[targetIndex].classList.add('active');
    }
}

getLastCharacterOfHref();

const submenu = document.querySelector('.sub-menu');
const linkmenus = document.querySelectorAll('.item-bar>a');
const linksubmenus = document.querySelectorAll(".item-submenu>a");
linksubmenus[1].classList.add('active');
submenu.style.display = "none";
linksubmenus.forEach(item => {
    item.classList.remove('active');
})