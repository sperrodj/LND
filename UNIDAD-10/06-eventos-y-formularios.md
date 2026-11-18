# 6. Eventos y formularios

## 6.1. Escuchar eventos

```js
const boton = document.querySelector("#mostrar");

boton.addEventListener("click", manejarClic);

function manejarClic(evento) {
  console.log(evento.type);
  console.log(evento.currentTarget);
}
```

- `target`: elemento donde se originó el evento.
- `currentTarget`: elemento cuyo listener se está ejecutando.

## 6.2. Eventos habituales

- `click`: activación con puntero o mecanismos equivalentes.
- `input`: cambia el valor mientras se edita.
- `change`: se confirma un cambio de control.
- `submit`: envío de formulario.
- `keydown`: pulsación de una tecla.
- `focusin` y `focusout`: cambios de foco que se propagan.

No se debe reproducir el comportamiento de un botón mediante un `div`. Un botón nativo ya dispone de activación por teclado y semántica.

## 6.3. Comportamiento predeterminado

```js
formulario.addEventListener("submit", evento => {
  evento.preventDefault();
  console.log("Envío controlado con JavaScript");
});
```

`preventDefault()` evita la acción predeterminada. Debe utilizarse solo cuando el código ofrece una alternativa funcional.

## 6.4. Propagación

Los eventos suelen recorrer el árbol. Esto permite escuchar en un contenedor:

```js
listado.addEventListener("click", evento => {
  const boton = evento.target.closest("button[data-accion]");

  if (!boton || !listado.contains(boton)) {
    return;
  }

  const ficha = boton.closest(".ficha");
  console.log(boton.dataset.accion, ficha.dataset.id);
});
```

Esta **delegación de eventos** funciona también con fichas añadidas después.

## 6.5. Leer formularios

```html
<form id="formulario-actividad">
  <label for="titulo">Título</label>
  <input id="titulo" name="titulo" required>

  <label for="categoria">Categoría</label>
  <select id="categoria" name="categoria" required>
    <option value="">Selecciona</option>
    <option value="arte">Arte</option>
    <option value="deporte">Deporte</option>
  </select>

  <button type="submit">Añadir actividad</button>
</form>
```

```js
const formulario = document.querySelector("#formulario-actividad");

formulario.addEventListener("submit", evento => {
  evento.preventDefault();

  if (!formulario.checkValidity()) {
    formulario.reportValidity();
    return;
  }

  const datos = new FormData(formulario);
  const titulo = datos.get("titulo").trim();
  const categoria = datos.get("categoria");

  console.log({ titulo, categoria });
});
```

## 6.6. Validación adicional

HTML debe expresar primero las restricciones posibles: `required`, `min`, `max`, `minlength`, tipos adecuados y `pattern` cuando sea necesario.

JavaScript se reserva para reglas que dependen de varias entradas o del estado:

```js
const fecha = formulario.elements.fecha;

if (new Date(fecha.value) < new Date()) {
  fecha.setCustomValidity("La fecha no puede estar en el pasado.");
} else {
  fecha.setCustomValidity("");
}
```

La validación del cliente mejora la experiencia, pero el servidor debe volver a validar todos los datos.

## 6.7. Filtros interactivos

```js
const filtro = document.querySelector("#filtro-categoria");

filtro.addEventListener("change", () => {
  const categoria = filtro.value;
  const resultado = categoria === "todas"
    ? actividades
    : actividades.filter(item => item.categoria === categoria);

  renderizarActividades(resultado);
});
```

## 6.8. Estado y botones

```js
function actualizarBoton(boton, guardada) {
  boton.setAttribute("aria-pressed", String(guardada));
  boton.textContent = guardada ? "Quitar de favoritas" : "Añadir a favoritas";
}
```

`aria-pressed` comunica el estado de un botón conmutable. No basta con cambiar únicamente un icono o color.

## 6.9. Mensajes dinámicos

HTML:

```html
<p id="mensajes" role="status" aria-live="polite"></p>
```

JavaScript:

```js
function anunciar(mensaje) {
  document.querySelector("#mensajes").textContent = mensaje;
}
```

Una región de estado puede comunicar cambios importantes sin mover el foco. No debe anunciar cada pulsación o actualización irrelevante.

## 6.10. Eliminar listeners

```js
boton.addEventListener("click", manejarClic);
boton.removeEventListener("click", manejarClic);
```

Para poder eliminarlo debe conservarse la misma referencia de función.

## 6.11. Actividades

1. Controla el envío de un formulario.
2. Añade una validación que relacione dos campos.
3. Implementa un filtro de categorías.
4. Utiliza delegación para botones de fichas dinámicas.
5. Crea un botón con `aria-pressed` y anuncia el cambio.

