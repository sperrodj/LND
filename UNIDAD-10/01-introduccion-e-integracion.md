# 1. Introducción, integración y herramientas

## 1.1. ¿Qué es JavaScript?

JavaScript es un lenguaje de programación. La especificación del lenguaje se denomina **ECMAScript**. El navegador añade objetos y API como `document`, `localStorage` o `fetch` para interactuar con una página y con la plataforma web.

```js
const mensaje = "Hola";          // Lenguaje JavaScript
document.title = mensaje;        // API DOM del navegador
```

JavaScript también puede ejecutarse fuera del navegador, pero esta unidad se centra en su uso en páginas web.

## 1.2. Estructura del proyecto

```text
primer-js/
├── index.html
├── css/
│   └── estilos.css
└── js/
    └── app.js
```

`index.html`:

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Primer proyecto con JavaScript</title>
    <link rel="stylesheet" href="css/estilos.css">
    <script src="js/app.js" defer></script>
  </head>
  <body>
    <h1>Primer proyecto con JavaScript</h1>
    <button id="saludar" type="button">Mostrar saludo</button>
  </body>
</html>
```

`defer` descarga el archivo mientras se analiza el HTML y lo ejecuta cuando el documento ya se ha procesado, respetando el orden de los scripts diferidos.

## 1.3. Módulos

```html
<script type="module" src="js/app.js"></script>
```

Los módulos permiten usar `import` y `export`, tienen ámbito propio y se comportan de forma diferida. Para proyectos pequeños de introducción puede utilizarse `defer`; cuando el código se divida en archivos relacionados, los módulos ofrecen una estructura mejor.

## 1.4. Consola

```js
console.log("Aplicación iniciada");
console.warn("Falta una configuración opcional");
console.error("No se pudo cargar el archivo");
console.table([
  { nombre: "Ana", turno: "mañana" },
  { nombre: "Leo", turno: "tarde" }
]);
```

La consola sirve para observar valores y errores durante el desarrollo. No debe utilizarse como interfaz final para el usuario.

## 1.5. Primera interacción

```js
const boton = document.querySelector("#saludar");

boton.addEventListener("click", () => {
  console.log("¡Hola desde JavaScript!");
});
```

Este ejemplo contiene tres pasos:

1. Seleccionar el botón.
2. Escuchar el evento `click`.
3. Ejecutar una función cuando ocurra.

Estos conceptos se desarrollarán después. Por ahora interesa comprobar que el archivo está enlazado.

## 1.6. JavaScript en línea

```html
<button onclick="alert('Hola')">Saludar</button>
```

Aunque funciona, mezcla HTML y comportamiento, dificulta reutilizar funciones y utiliza manejadores globales. Es preferible `addEventListener()` desde un archivo externo.

## 1.7. Modo estricto

```js
"use strict";
```

El modo estricto evita ciertos comportamientos antiguos y convierte algunos errores silenciosos en errores visibles. Los módulos ya se ejecutan en modo estricto.

## 1.8. Herramientas del navegador

- **Consola:** mensajes, errores y ejecución de expresiones.
- **Sources/Fuentes:** archivos, puntos de interrupción y ejecución paso a paso.
- **Elements/Inspector:** HTML actual y listeners asociados.
- **Network/Red:** scripts, solicitudes y respuestas.
- **Application/Almacenamiento:** `localStorage`, cookies y otros datos.

## 1.9. Actividades

1. Crea la estructura de carpetas.
2. Vincula `app.js` con `defer`.
3. Muestra tres tipos de mensajes en consola.
4. Cambia temporalmente `defer` y observa cuándo puede fallar la selección del botón.
5. Localiza `app.js` en las herramientas de red y fuentes.

