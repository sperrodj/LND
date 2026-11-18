# 5. DOM: selección y modificación

## 5.1. ¿Qué es el DOM?

El **Document Object Model** representa el documento como un árbol de objetos. JavaScript puede consultar y modificar ese árbol.

```html
<article class="ficha" data-id="A01">
  <h2>Iniciación al teatro</h2>
  <p class="plazas">15 plazas</p>
</article>
```

`article`, `h2`, el párrafo, sus atributos y textos se representan como nodos relacionados.

## 5.2. Seleccionar elementos

```js
const titulo = document.querySelector("h1");
const primeraFicha = document.querySelector(".ficha");
const fichas = document.querySelectorAll(".ficha");
```

- `querySelector`: primera coincidencia o `null`.
- `querySelectorAll`: `NodeList` estática con todas las coincidencias.

```js
const formulario = document.getElementById("inscripcion");
```

Debe contemplarse que una selección pueda no existir:

```js
if (titulo) {
  titulo.textContent = "Nueva programación";
}
```

## 5.3. Recorrer selecciones

```js
fichas.forEach(ficha => {
  ficha.classList.add("ficha--preparada");
});
```

## 5.4. Texto y HTML

```js
titulo.textContent = "Actividades de noviembre";
```

`textContent` trata todo como texto. Es la opción adecuada para datos del usuario o externos.

```js
contenedor.innerHTML = "<strong>Contenido generado</strong>";
```

`innerHTML` interpreta marcado. No debe recibir contenido sin controlar porque puede introducir código no deseado. Para construir interfaces resulta más seguro crear nodos.

## 5.5. Atributos, propiedades y `dataset`

```js
const enlace = document.querySelector("a.detalle");
enlace.href = "detalle.html";
enlace.setAttribute("aria-label", "Ver detalles de teatro");

const ficha = document.querySelector(".ficha");
console.log(ficha.dataset.id);
ficha.dataset.estado = "disponible";
```

`data-id="A01"` se consulta como `dataset.id`.

## 5.6. Clases

```js
ficha.classList.add("destacada");
ficha.classList.remove("oculta");
ficha.classList.toggle("seleccionada");
ficha.classList.contains("seleccionada");
```

Es preferible cambiar clases y dejar la presentación en CSS, en lugar de asignar numerosos estilos en línea.

## 5.7. Crear elementos

```js
function crearFicha(actividad) {
  const article = document.createElement("article");
  article.classList.add("ficha");
  article.dataset.id = actividad.id;

  const titulo = document.createElement("h2");
  titulo.textContent = actividad.titulo;

  const plazas = document.createElement("p");
  plazas.textContent = `${actividad.plazas} plazas`;

  article.append(titulo, plazas);
  return article;
}
```

Insertar:

```js
const listado = document.querySelector("#listado");
listado.append(crearFicha(actividad));
```

## 5.8. Fragmentos

```js
const fragmento = document.createDocumentFragment();

for (const actividad of actividades) {
  fragmento.append(crearFicha(actividad));
}

listado.replaceChildren(fragmento);
```

El fragmento permite preparar varios nodos y sustituir el contenido en una operación clara.

## 5.9. Eliminar y reemplazar

```js
ficha.remove();
listado.replaceChildren();
```

Antes de eliminar, debe actualizarse también el estado de datos si el elemento representa información de la aplicación.

## 5.10. Plantillas HTML

```html
<template id="plantilla-ficha">
  <article class="ficha">
    <h2 class="ficha__titulo"></h2>
    <p class="ficha__plazas"></p>
  </article>
</template>
```

```js
const plantilla = document.querySelector("#plantilla-ficha");
const copia = plantilla.content.cloneNode(true);
copia.querySelector(".ficha__titulo").textContent = actividad.titulo;
copia.querySelector(".ficha__plazas").textContent = `${actividad.plazas} plazas`;
listado.append(copia);
```

## 5.11. Separar datos y representación

```js
let actividades = [/* datos */];

function renderizarActividades(datos) {
  const fragmento = document.createDocumentFragment();
  datos.forEach(actividad => fragmento.append(crearFicha(actividad)));
  listado.replaceChildren(fragmento);
}
```

Los datos viven en el array; el DOM es su representación. Cuando cambian los datos, se vuelve a representar la parte necesaria.

## 5.12. Actividades

1. Selecciona elementos mediante clase, `id` y atributo.
2. Cambia texto, atributos y clases.
3. Crea una ficha sin usar `innerHTML`.
4. Renderiza un array mediante un fragmento.
5. Añade un estado vacío cuando el array no contenga elementos.

