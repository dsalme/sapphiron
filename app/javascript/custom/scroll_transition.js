// app/javascript/scroll_transition.js
// = require_self
document.addEventListener("DOMContentLoaded", function () {
    var lastScrollTop = 0;
    var header = document.querySelector('header');

    window.addEventListener("scroll", function (e) {
        var st = window.scrollY || document.documentElement.scrollTop;

        // Si haces scroll hacia abajo y el header no está colapsado, colapsarlo
        if (st > lastScrollTop && st > 100) {
            header.classList.add('header-transition');
            header.style.transform = 'translateY(-100%)';
        } else {
            // Si haces scroll hacia arriba, expandir el header
            header.style.transform = 'translateY(0)';
        }

        lastScrollTop = st;
    });
});
