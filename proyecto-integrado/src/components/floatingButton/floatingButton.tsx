import React, { useRef, useEffect } from 'react';
import './floatingButton.css';

export function Floating() {
    const buttonRef = useRef<HTMLButtonElement>(null);

    useEffect(() => {
        const backToTopButton = buttonRef.current;
        if (!backToTopButton) {
            console.warn("No se encontró el botón 'top' en el DOM.");
            return;
        }

        const handleScroll = () => {
            if (window.scrollY > 300) {
                backToTopButton.classList.add('show');
            } else {
                backToTopButton.classList.remove('show');
            }
        };

        const handleClick = () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        };

        window.addEventListener('scroll', handleScroll);
        backToTopButton.addEventListener('click', handleClick);

        return () => {
            window.removeEventListener('scroll', handleScroll);
            backToTopButton.removeEventListener('click', handleClick);
        };
    }, []);
  return (
    <button id="top">
        <svg className="scrollBtn-icon" xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 -960 960 960" width="48" color="#fff"><path d="M450-80v-686L242-558l-42-42 280-280 280 280-42 42-208-208v686h-60Z"></path></svg>
    </button>
  );
}