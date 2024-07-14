document.addEventListener("DOMContentLoaded", function() {
    var btnAcocinar = document.getElementById("btnAcocinar");

    // Función para verificar si el botón está visible en la ventana
    function isButtonVisible() {
        var rect = btnAcocinar.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    // Función para agregar la animación cuando el botón sea visible
    function addButtonAnimation() {
        if (isButtonVisible()) {
            btnAcocinar.classList.add("animacionBoton");
            window.removeEventListener("scroll", addButtonAnimation); // Elimina el listener una vez que se activa la animación
        }
    }

    // Agrega un listener para activar la animación cuando se hace scroll
    window.addEventListener("scroll", addButtonAnimation);

    // Agrega un listener para activar la animación si el botón ya es visible cuando la página se carga
    addButtonAnimation();

    // Función para manejar el evento click del botón
    function handleClick(event) {
        event.preventDefault(); // Evita el comportamiento predeterminado del enlace
        // Agrega aquí lo que quieras que haga el botón al hacer clic
        console.log("¡Hiciste clic en el botón!");
        // Por ejemplo, puedes redirigir a otra página
        setTimeout(function() {
            window.location.href = btnAcocinar.getAttribute("href");
        }, 1000); // Redirige después de cierto tiempo (aquí 1 segundo)
    }

    // Agrega el evento click al botón
    btnAcocinar.addEventListener("click", handleClick);
});


document.addEventListener("DOMContentLoaded", function() {
    var dropdownToggles = document.querySelectorAll('.dropdown-toggle');

    // Función para manejar el evento click del botón
    function handleClick(event) {
        event.preventDefault(); // Evita el comportamiento predeterminado del enlace
        var dropdownMenu = this.nextElementSibling; // Obtiene el menú desplegable asociado al botón clickeado

        // Alternar la visibilidad del menú desplegable
        if (dropdownMenu.classList.contains('show')) {
            dropdownMenu.classList.remove('show');
        } else {
            // Ocultar todos los menús desplegables antes de mostrar el menú clickeado
            var allDropdownMenus = document.querySelectorAll('.dropdown-menu');
            allDropdownMenus.forEach(function(menu) {
                menu.classList.remove('show');
            });
            dropdownMenu.classList.add('show');
        }
    }

    // Agrega el evento click a todos los botones de dropdown
    dropdownToggles.forEach(function(button) {
        button.addEventListener('click', handleClick);
    });

    // Cierra el menú desplegable si se hace clic fuera de él
    window.addEventListener('click', function(event) {
        if (!event.target.matches('.dropdown-toggle')) {
            var dropdownMenus = document.querySelectorAll('.dropdown-menu');
            dropdownMenus.forEach(function(menu) {
                if (menu.classList.contains('show')) {
                    menu.classList.remove('show');
                }
            });
        }
    });
});


function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}