// Funcion del slide banner
let slideIndex = 0;
showSlides();

function showSlides() {
    const slides = document.getElementsByClassName("mySlides");
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex = (slideIndex + 1) > slides.length ? 1 : slideIndex + 1;
    slides[slideIndex - 1].style.display = "block";
    setTimeout(showSlides, 3000);
}

// funciones del menu
const toggleBtn = document.querySelector('.toggle-btn');
const toggleMenu = document.querySelector('.toggle-menu');

toggleBtn.addEventListener('click', () => {
    toggleMenu.classList.toggle('active');
});
