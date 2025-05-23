document.addEventListener('DOMContentLoaded', () => {
    const navBar = document.querySelector('.nav-bar');
    const navigation = document.querySelector('.navigation');

    if (navBar && navigation) {
        navBar.addEventListener('click', () => {
            navBar.classList.toggle('open');
            navigation.classList.toggle('menu-mobile');
        });
    }
});