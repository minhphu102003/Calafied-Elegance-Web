// ! Interactive chuyển ảnh
const imgActive = document.querySelector('.img-active img');
const itemImgs = document.querySelectorAll('.item-img img');
itemImgs.forEach(item => {
    item.addEventListener('click', () => {
        itemImgs.forEach(item => {
            item.classList.remove('active');
        });
        let source = item.src;
        imgActive.src = source;
        item.classList.add('active');
    });
});

// !Làm hiệu ứng chuyển attribute sản phẩm
const descriptions = document.querySelectorAll('.description');
const information = document.querySelector('.information');
const review = document.querySelector('.review-detail');
descriptions.forEach(item => {
    item.addEventListener("click", () => {
        descriptions.forEach(item => {
            item.classList.remove('active');
        })
        item.classList.add('active');
        if (item.textContent !== "Mô tả") {
            review.style.display = 'block';
            information.style.display = 'none';
        }
        else {
            review.style.display = "none";
            information.style.display = 'block';
        }
    });
});

const stars = document.querySelectorAll('.star');
for (let index = 0; index < stars.length; index++) {
    stars[index].addEventListener("click", function () {
        stars.forEach(item => {
            item.classList.remove('fa-solid');
            item.classList.add('fa-regular');
        })
        for (let i = 0; i <= index; i++) {
            stars[i].classList.remove('fa-regular');
            stars[i].classList.add('fa-solid');
        }
    });
}

// ! Nếu double click vào star thì không chọn sao nào 
stars.forEach(item => {
    item.addEventListener("dblclick", function () {
        stars.forEach(item => {
            item.classList.remove('fa-solid');
            item.classList.add('fa-regular');
        })
    });
});

// !Thiếu bắt lỗi form , còn ít ngày làm mấy cái quan trọng trước


// !Tương tác gần phần footer
const confirmTitles = document.querySelectorAll('.confirm-title');
const containerDetails = document.querySelectorAll('.container-detail');

for (let i = 0; i < confirmTitles.length; i++) {
    confirmTitles[i].addEventListener('click', () => {
        const arrow = confirmTitles[i].querySelector('i');
        if (arrow.classList.contains('fa-caret-right')) {
            containerDetails[i].style.display = 'block';
            arrow.classList.remove('fa-caret-right');
            arrow.classList.add('fa-caret-up');
        }
        else {
            containerDetails[i].style.display = 'none';
            arrow.classList.remove('fa-caret-up');
            arrow.classList.add('fa-caret-right');
        }
    });
}

const minus = document.querySelector('.fa-minus');
const plus = document.querySelector('.fa-plus');
const input = document.querySelector('.shopping-cart input');
input.value = 1;
minus.addEventListener("click", function () {
    if (input.value > 1) {
        input.value--;
    }
});

plus.addEventListener("click", function () {
    input.value++;
});