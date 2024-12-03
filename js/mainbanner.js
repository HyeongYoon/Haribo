// banner.js
const slide = document.querySelector('.banner-slide');
const images = document.querySelectorAll('.banner-slide img');
const indicators = document.querySelectorAll('.indicator div');
const prev = document.querySelector('.arrow.left');
const next = document.querySelector('.arrow.right');
let currentIndex = 0;

function showSlide(index) {
  const translateXValue = -(index * 100);
  slide.style.transform = `translateX(${translateXValue}%)`;
  indicators.forEach((dot, i) => {
    dot.classList.toggle('active', i === index);
  });
}

function nextSlide() {
  currentIndex = (currentIndex + 1) % images.length;
  showSlide(currentIndex);
}

function prevSlide() {
  currentIndex = (currentIndex - 1 + images.length) % images.length;
  showSlide(currentIndex);
}

next.addEventListener('click', nextSlide);
prev.addEventListener('click', prevSlide);

indicators.forEach((dot, i) => {
  dot.addEventListener('click', () => {
    currentIndex = i;
    showSlide(currentIndex);
  });
});

// 자동 슬라이드
setInterval(nextSlide, 5000);
