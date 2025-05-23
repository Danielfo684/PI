document.addEventListener('DOMContentLoaded', () => {
    const backToTopButton = document.getElementById('top');

    if (backToTopButton) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 300) {
                backToTopButton.classList.add('show');
            } else {
                backToTopButton.classList.remove('show');
            }
        });

        backToTopButton.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    } else {
        console.warn("No se encontró el botón 'top' en el DOM.");
    }

    const navBar = document.querySelector('.nav-bar');
    const navigation = document.querySelector('.navigation');

    if (navBar && navigation) {
        navBar.addEventListener('click', () => {
            navBar.classList.toggle('open');
            navigation.classList.toggle('menu-mobile');
        });
    }
});