window.onload = () => {
    funcionAlert();
}

function funcionAlert() {
    const boton = document.getElementById('boton');

    boton.addEventListener('click', () => {
        alert("Hola mundo")
    })
}