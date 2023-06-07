window.onload = () => {
  getData()
}

function getData() {
  let nombre = document.getElementById("name")
  document.querySelector('form').addEventListener('submit', e => {
    e.preventDefault()
    const data = Object.fromEntries(new FormData(e.target))
    console.log(JSON.stringify(data))
    /* 1ª Modificación: Cuando el usuario inserta un número superior a 6 caracteres, salta una alerta */
    if(nombre.value.length < 6) {
      alert("Introduzca un nombre mayor a 6 caracteres")
    } 
  })
}
