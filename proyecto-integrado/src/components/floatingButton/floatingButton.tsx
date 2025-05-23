import { useRef, useEffect } from 'react';
import './floatingButton.css';

export function Floating({ target }: { target: string }) {
  const buttonRef = useRef<HTMLDivElement>(null);

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
      const targetElement = document.querySelector(target);
      if (targetElement) {
        targetElement.scrollIntoView({ behavior: 'smooth' });
      } else {
        console.warn(`No se encontró el elemento con selector "${target}".`);
      }
    };

    window.addEventListener('scroll', handleScroll);
    backToTopButton.addEventListener('click', handleClick);

    return () => {
      window.removeEventListener('scroll', handleScroll);
      backToTopButton.removeEventListener('click', handleClick);
    };
  }, [target]);

  return (
    <div className="patata" id="patata" ref={buttonRef}>
      <svg className="scrollBtn-icon" xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 -960 960 960" width="48" color="#fff">
        <path d="M450-80v-686L242-558l-42-42 280-280 280 280-42 42-208-208v686h-60Z"></path>
      </svg>
    </div>
  );
}