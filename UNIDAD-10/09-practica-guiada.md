# 9. Práctica guiada: agenda de un centro juvenil

## 9.1. Objetivo

Crear una aplicación web llamada **Punto Joven** que cargue actividades desde JSON, permita filtrarlas, marcar favoritas, añadir actividades locales y mostrar un resumen. La interfaz será accesible y conservará favoritas mediante `localStorage`.

## 9.2. Funcionalidades

- Cargar actividades desde `datos/actividades.json`.
- Mostrar estados de carga, error y lista vacía.
- Filtrar por categoría y buscar por texto.
- Ordenar por fecha o título.
- Marcar favoritas y conservarlas localmente.
- Añadir una actividad mediante formulario.
- Eliminar actividades añadidas durante la sesión.
- Actualizar el resumen y anunciar cambios.

## 9.3. Estructura

```text
punto-joven/
├── index.html
├── css/
│   └── estilos.css
├── js/
│   └── app.js
├── datos/
│   └── actividades.json
└── README.md
```

Se necesita un servidor local para cargar el JSON mediante `fetch`.

## 9.4. Datos JSON

```json
[
  {
    "id": "A01",
    "titulo": "Laboratorio de sonido",
    "categoria": "musica",
    "fecha": "2027-02-05",
    "plazas": 12,
    "lugar": "Estudio 1"
  },
  {
    "id": "A02",
    "titulo": "Torneo de ajedrez",
    "categoria": "juegos",
    "fecha": "2027-02-08",
    "plazas": 20,
    "lugar": "Sala común"
  },
  {
    "id": "A03",
    "titulo": "Fotografía urbana",
    "categoria": "arte",
    "fecha": "2027-02-12",
    "plazas": 8,
    "lugar": "Aula creativa"
  },
  {
    "id": "A04",
    "titulo": "Entrenamiento funcional",
    "categoria": "deporte",
    "fecha": "2027-02-14",
    "plazas": 15,
    "lugar": "Pista exterior"
  }
]
```

## 9.5. HTML esencial

```html
<script src="js/app.js" defer></script>

<main>
  <h1>Agenda Punto Joven</h1>

  <section aria-labelledby="filtros-titulo">
    <h2 id="filtros-titulo">Buscar actividades</h2>

    <label for="busqueda">Buscar por título</label>
    <input id="busqueda" type="search">

    <label for="categoria">Categoría</label>
    <select id="categoria">
      <option value="todas">Todas</option>
      <option value="musica">Música</option>
      <option value="arte">Arte</option>
      <option value="juegos">Juegos</option>
      <option value="deporte">Deporte</option>
    </select>

    <label for="orden">Orden</label>
    <select id="orden">
      <option value="fecha">Fecha</option>
      <option value="titulo">Título</option>
    </select>
  </section>

  <section aria-labelledby="listado-titulo">
    <h2 id="listado-titulo">Próximas actividades</h2>
    <p id="estado" role="status" aria-live="polite">Cargando actividades…</p>
    <div id="listado"></div>
  </section>

  <section aria-labelledby="resumen-titulo">
    <h2 id="resumen-titulo">Resumen</h2>
    <p id="resumen"></p>
  </section>

  <section aria-labelledby="formulario-titulo">
    <h2 id="formulario-titulo">Añadir actividad</h2>
    <form id="formulario">
      <label for="nuevo-titulo">Título</label>
      <input id="nuevo-titulo" name="titulo" required minlength="3">

      <label for="nueva-categoria">Categoría</label>
      <select id="nueva-categoria" name="categoria" required>
        <option value="">Selecciona</option>
        <option value="musica">Música</option>
        <option value="arte">Arte</option>
        <option value="juegos">Juegos</option>
        <option value="deporte">Deporte</option>
      </select>

      <label for="nueva-fecha">Fecha</label>
      <input id="nueva-fecha" name="fecha" type="date" required>

      <label for="nuevas-plazas">Plazas</label>
      <input id="nuevas-plazas" name="plazas" type="number" min="1" max="100" required>

      <label for="nuevo-lugar">Lugar</label>
      <input id="nuevo-lugar" name="lugar" required>

      <button type="submit">Añadir actividad</button>
    </form>
  </section>
</main>
```

## 9.6. Estado y referencias

```js
let actividades = [];
let favoritas = cargarFavoritas();

const listado = document.querySelector("#listado");
const estado = document.querySelector("#estado");
const resumen = document.querySelector("#resumen");
const busqueda = document.querySelector("#busqueda");
const categoria = document.querySelector("#categoria");
const orden = document.querySelector("#orden");
const formulario = document.querySelector("#formulario");
```

## 9.7. Cargar datos

```js
async function cargarActividades() {
  const respuesta = await fetch("datos/actividades.json");

  if (!respuesta.ok) {
    throw new Error(`No se pudieron cargar los datos (${respuesta.status})`);
  }

  const datos = await respuesta.json();

  if (!Array.isArray(datos)) {
    throw new Error("El formato recibido no es válido");
  }

  return datos;
}
```

## 9.8. Favoritas

```js
function cargarFavoritas() {
  try {
    const datos = JSON.parse(localStorage.getItem("favoritas") ?? "[]");
    return Array.isArray(datos) ? datos : [];
  } catch {
    return [];
  }
}

function guardarFavoritas() {
  localStorage.setItem("favoritas", JSON.stringify(favoritas));
}

function alternarFavorita(id) {
  if (favoritas.includes(id)) {
    favoritas = favoritas.filter(item => item !== id);
  } else {
    favoritas = [...favoritas, id];
  }

  guardarFavoritas();
  actualizarVista();
}
```

## 9.9. Crear una ficha

```js
function crearFicha(actividad) {
  const article = document.createElement("article");
  article.className = "actividad";
  article.dataset.id = actividad.id;

  const titulo = document.createElement("h3");
  titulo.textContent = actividad.titulo;

  const datos = document.createElement("p");
  datos.textContent = `${actividad.fecha} · ${actividad.lugar}`;

  const plazas = document.createElement("p");
  plazas.textContent = `${actividad.plazas} plazas`;

  const botonFavorita = document.createElement("button");
  botonFavorita.type = "button";
  botonFavorita.dataset.accion = "favorita";
  const guardada = favoritas.includes(actividad.id);
  botonFavorita.setAttribute("aria-pressed", String(guardada));
  botonFavorita.textContent = guardada
    ? "Quitar de favoritas"
    : "Añadir a favoritas";

  article.append(titulo, datos, plazas, botonFavorita);

  if (actividad.local) {
    const eliminar = document.createElement("button");
    eliminar.type = "button";
    eliminar.dataset.accion = "eliminar";
    eliminar.textContent = "Eliminar";
    article.append(eliminar);
  }

  return article;
}
```

## 9.10. Filtrar y ordenar

```js
function obtenerActividadesVisibles() {
  const texto = busqueda.value.trim().toLocaleLowerCase("es");
  const categoriaElegida = categoria.value;

  const filtradas = actividades.filter(actividad => {
    const coincideTexto = actividad.titulo
      .toLocaleLowerCase("es")
      .includes(texto);

    const coincideCategoria = categoriaElegida === "todas"
      || actividad.categoria === categoriaElegida;

    return coincideTexto && coincideCategoria;
  });

  return [...filtradas].sort((a, b) => {
    if (orden.value === "titulo") {
      return a.titulo.localeCompare(b.titulo, "es");
    }

    return a.fecha.localeCompare(b.fecha);
  });
}
```

Las fechas con formato ISO `AAAA-MM-DD` pueden ordenarse como texto si todas conservan ese formato.

## 9.11. Renderizar

```js
function renderizarActividades(datos) {
  const fragmento = document.createDocumentFragment();

  for (const actividad of datos) {
    fragmento.append(crearFicha(actividad));
  }

  listado.replaceChildren(fragmento);

  estado.textContent = datos.length === 0
    ? "No hay actividades que coincidan con los filtros."
    : `${datos.length} actividades mostradas.`;
}

function actualizarResumen() {
  const plazas = actividades.reduce(
    (total, actividad) => total + actividad.plazas,
    0
  );

  resumen.textContent = `${actividades.length} actividades, ${plazas} plazas y ${favoritas.length} favoritas.`;
}

function actualizarVista() {
  renderizarActividades(obtenerActividadesVisibles());
  actualizarResumen();
}
```

## 9.12. Eventos de filtros

```js
busqueda.addEventListener("input", actualizarVista);
categoria.addEventListener("change", actualizarVista);
orden.addEventListener("change", actualizarVista);
```

## 9.13. Delegación de eventos

```js
listado.addEventListener("click", evento => {
  const boton = evento.target.closest("button[data-accion]");

  if (!boton || !listado.contains(boton)) {
    return;
  }

  const ficha = boton.closest(".actividad");
  const id = ficha.dataset.id;

  if (boton.dataset.accion === "favorita") {
    alternarFavorita(id);
  }

  if (boton.dataset.accion === "eliminar") {
    actividades = actividades.filter(actividad => actividad.id !== id);
    favoritas = favoritas.filter(item => item !== id);
    guardarFavoritas();
    actualizarVista();
    estado.textContent = "Actividad eliminada.";
  }
});
```

## 9.14. Formulario

```js
formulario.addEventListener("submit", evento => {
  evento.preventDefault();

  if (!formulario.checkValidity()) {
    formulario.reportValidity();
    return;
  }

  const datos = new FormData(formulario);

  const nuevaActividad = {
    id: crypto.randomUUID(),
    titulo: datos.get("titulo").trim(),
    categoria: datos.get("categoria"),
    fecha: datos.get("fecha"),
    plazas: Number(datos.get("plazas")),
    lugar: datos.get("lugar").trim(),
    local: true
  };

  actividades = [...actividades, nuevaActividad];
  formulario.reset();
  actualizarVista();
  estado.textContent = `Se añadió ${nuevaActividad.titulo}.`;
});
```

## 9.15. Inicialización

```js
async function iniciar() {
  estado.textContent = "Cargando actividades…";

  try {
    actividades = await cargarActividades();
    actualizarVista();
  } catch (error) {
    console.error(error);
    estado.textContent = "No se pudo cargar la agenda. Inténtalo de nuevo más tarde.";
  }
}

iniciar();
```

## 9.16. Comprobaciones

1. La carga funciona mediante servidor local.
2. Un JSON inexistente muestra un error comprensible.
3. Los filtros pueden combinarse.
4. El orden no modifica el array original.
5. Las favoritas permanecen tras recargar.
6. Los botones comunican su estado con `aria-pressed`.
7. Solo las actividades locales muestran «Eliminar».
8. Los datos del formulario se convierten correctamente.
9. No se utiliza `innerHTML` con datos.
10. No aparecen errores en consola.

## 9.17. README

Debe explicar:

- Objetivo y funcionalidades.
- Estructura de archivos.
- Cómo iniciar un servidor local.
- Estructura de los datos JSON.
- Funciones principales.
- Uso de DOM, eventos, Fetch y `localStorage`.
- Medidas de accesibilidad y seguridad.
- Capturas y pruebas realizadas.
- Errores encontrados y solución.

## 9.18. Ampliaciones

- Guardar también actividades locales.
- Añadir filtro «solo favoritas».
- Incorporar edición de actividades.
- Mostrar fechas con `Intl.DateTimeFormat`.
- Separar el código en módulos.
- Añadir diálogo nativo de confirmación accesible.

## 9.19. Lista de comprobación

- [ ] Estructura de carpetas correcta.
- [ ] Datos cargados mediante `fetch` y comprobación de `response.ok`.
- [ ] Estados de carga, error, vacío y éxito.
- [ ] Filtros y ordenación funcionales.
- [ ] DOM generado mediante nodos y `textContent`.
- [ ] Delegación de eventos en la lista.
- [ ] Formulario validado y datos convertidos.
- [ ] Favoritas almacenadas sin datos sensibles.
- [ ] Interacción accesible por teclado.
- [ ] Código organizado en funciones claras.
- [ ] Consola sin errores.
- [ ] README completo.

## 9.20. Propuesta de evaluación

| Criterio | Peso orientativo |
|---|---:|
| Variables, funciones y organización | 15 % |
| Arrays, objetos, filtros y ordenación | 15 % |
| Creación y actualización del DOM | 20 % |
| Eventos y formularios | 15 % |
| Fetch, JSON y estados de interfaz | 15 % |
| Almacenamiento, accesibilidad y seguridad | 10 % |
| README, pruebas y presentación | 10 % |

