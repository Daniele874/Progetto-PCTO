// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

function cambiaTema(colore) {
    if (colore === 'scuro') {
        document.body.style.backgroundColor = "rgb(44, 44, 44)";
        document.body.style.color = "white";
        document.querySelector(".navbar").style.backgroundColor = "rgb(58, 58, 58)";
        document.querySelector(".site-footer").style.backgroundColor = "rgb(58, 58, 58)";
    }
    else if (colore === 'chiaro') {
        document.body.style.backgroundColor = "white";
        document.body.style.color = "black";
        document.querySelectorAll("h2, h4").forEach(el => {
            el.style.setProperty("color", "black")});
        document.querySelector(".navbar").style.backgroundColor = "#008080";
        document.querySelector(".site-footer").style.backgroundColor = "#008080";
    }
}

function sponsors(event) {
    event.preventDefault();

    window.scrollTo({
        top: document.body.scrollHeight,
        behavior: 'smooth'
    });
}