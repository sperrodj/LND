# 9. Práctica guiada: festival de cine al aire libre

## 9.1. Objetivo

Crear y aplicar una hoja CSS adaptable a una web ficticia llamada **Noches de Cine**, dedicada a un festival de cine al aire libre. Se trabajarán variables, tipografía, modelo de cajas, Flexbox, Grid, formularios, estados y media queries.

No se utilizará JavaScript. Toda la interacción disponible debe proceder de elementos HTML nativos.

## 9.2. Estructura del proyecto

```text
noches-de-cine/
├── index.html
├── programacion.html
├── entradas.html
├── css/
│   └── estilos.css
├── img/
│   ├── portada.jpg
│   ├── pelicula-aurora.jpg
│   ├── pelicula-marea.jpg
│   └── pelicula-orbita.jpg
└── README.md
```

Primero se crea la estructura, después se guardan las imágenes en `img/` y finalmente se empieza a escribir código.

## 9.3. HTML mínimo de referencia

La portada debe contener una estructura semántica semejante:

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Programación y entradas del festival Noches de Cine.">
    <title>Noches de Cine | Festival al aire libre</title>
    <link rel="stylesheet" href="css/estilos.css">
  </head>
  <body>
    <a class="saltar" href="#contenido">Saltar al contenido principal</a>

    <header class="cabecera">
      <div class="contenedor cabecera__interior">
        <a class="marca" href="index.html">Noches de Cine</a>
        <nav aria-label="Navegación principal">
          <ul class="menu">
            <li><a aria-current="page" href="index.html">Inicio</a></li>
            <li><a href="programacion.html">Programación</a></li>
            <li><a href="entradas.html">Entradas</a></li>
          </ul>
        </nav>
      </div>
    </header>

    <main id="contenido">
      <section class="portada">
        <div class="contenedor portada__contenido">
          <p class="etiqueta">Del 12 al 15 de agosto</p>
          <h1>Historias bajo las estrellas</h1>
          <p>Cuatro noches de cine, encuentros y música en directo.</p>
          <a class="boton" href="programacion.html">Ver programación</a>
        </div>
      </section>

      <section class="seccion contenedor" aria-labelledby="destacadas">
        <h2 id="destacadas">Proyecciones destacadas</h2>
        <div class="cartelera">
          <!-- Tres artículos con clase pelicula -->
        </div>
      </section>
    </main>

    <footer class="pie">
      <div class="contenedor">
        <p>Noches de Cine · Plaza del Faro</p>
      </div>
    </footer>
  </body>
</html>
```

## 9.4. Paso 1: variables y base

```css
:root {
  color-scheme: light;
  --color-fondo: #f8f5ef;
  --color-superficie: #ffffff;
  --color-texto: #20232a;
  --color-principal: #293462;
  --color-acento: #d45d79;
  --color-claro: #f6d6df;
  --color-borde: #d8d4cd;
  --sombra: 0 0.75rem 2rem rgb(26 30 48 / 12%);
  --radio: 0.85rem;
  --ancho: 72rem;
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  color: var(--color-texto);
  background-color: var(--color-fondo);
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  line-height: 1.6;
}

img {
  display: block;
  max-width: 100%;
  height: auto;
}

.contenedor {
  width: min(100% - 2rem, var(--ancho));
  margin-inline: auto;
}
```

## 9.5. Paso 2: tipografía y enlaces

```css
h1,
h2,
h3 {
  margin-block-start: 0;
  line-height: 1.15;
  text-wrap: balance;
}

h1 {
  font-size: clamp(2.5rem, 8vw, 5.5rem);
}

h2 {
  font-size: clamp(1.8rem, 4vw, 2.75rem);
}

a {
  color: var(--color-principal);
  text-underline-offset: 0.2em;
}

a:hover {
  color: var(--color-acento);
}

a:focus-visible,
button:focus-visible,
input:focus-visible,
select:focus-visible,
textarea:focus-visible {
  outline: 3px solid var(--color-acento);
  outline-offset: 3px;
}
```

## 9.6. Paso 3: cabecera con Flexbox

```css
.cabecera {
  background-color: var(--color-superficie);
  border-bottom: 1px solid var(--color-borde);
}

.cabecera__interior {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  gap: 0.75rem 2rem;
  padding-block: 1rem;
}

.marca {
  color: var(--color-principal);
  font-size: 1.25rem;
  font-weight: 800;
  text-decoration: none;
}

.menu {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem 1.25rem;
  margin: 0;
  padding: 0;
  list-style: none;
}

.menu a {
  display: block;
  padding-block: 0.5rem;
  font-weight: 650;
  text-decoration: none;
}

.menu a[aria-current="page"] {
  color: var(--color-acento);
  border-bottom: 3px solid currentColor;
}
```

## 9.7. Paso 4: portada

```css
.portada {
  min-height: 70vh;
  display: grid;
  place-items: center;
  color: white;
  background-image:
    linear-gradient(90deg, rgb(14 18 40 / 88%), rgb(14 18 40 / 35%)),
    url("../img/portada.jpg");
  background-position: center;
  background-size: cover;
}

.portada__contenido {
  padding-block: 5rem;
}

.portada__contenido p:not(.etiqueta) {
  max-width: 45ch;
  font-size: 1.15rem;
}

.etiqueta {
  display: inline-block;
  padding: 0.35rem 0.75rem;
  border-radius: 999px;
  color: var(--color-principal);
  background-color: var(--color-claro);
  font-weight: 800;
}
```

## 9.8. Paso 5: botón reutilizable

```css
.boton {
  display: inline-flex;
  min-height: 2.75rem;
  align-items: center;
  justify-content: center;
  padding: 0.7rem 1.1rem;
  border: 2px solid var(--color-acento);
  border-radius: 0.5rem;
  color: white;
  background-color: var(--color-acento);
  font: inherit;
  font-weight: 750;
  text-decoration: none;
  cursor: pointer;
  transition: transform 160ms ease, background-color 160ms ease;
}

.boton:hover {
  color: white;
  background-color: #ad405c;
  transform: translateY(-2px);
}
```

## 9.9. Paso 6: cartelera con Grid

HTML de una película:

```html
<article class="pelicula">
  <img src="img/pelicula-aurora.jpg" alt="Paisaje montañoso iluminado por una aurora">
  <div class="pelicula__contenido">
    <p class="pelicula__datos">12 de agosto · 21:30</p>
    <h3>Aurora</h3>
    <p>Un viaje documental por comunidades próximas al círculo polar.</p>
    <a href="entradas.html">Reservar entrada</a>
  </div>
</article>
```

CSS:

```css
.seccion {
  padding-block: 4rem;
}

.cartelera {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 17rem), 1fr));
  gap: 1.5rem;
}

.pelicula {
  display: grid;
  grid-template-rows: auto 1fr;
  overflow: hidden;
  border: 1px solid var(--color-borde);
  border-radius: var(--radio);
  background-color: var(--color-superficie);
  box-shadow: var(--sombra);
  transition: transform 180ms ease, box-shadow 180ms ease;
}

.pelicula:hover,
.pelicula:focus-within {
  transform: translateY(-0.25rem);
  box-shadow: 0 1rem 2.5rem rgb(26 30 48 / 18%);
}

.pelicula img {
  width: 100%;
  aspect-ratio: 3 / 2;
  object-fit: cover;
}

.pelicula__contenido {
  padding: 1.25rem;
}

.pelicula__datos {
  color: #60646d;
  font-size: 0.9rem;
  font-weight: 700;
}
```

## 9.10. Paso 7: formulario de entradas

```css
.formulario {
  display: grid;
  gap: 1.5rem;
  max-width: 46rem;
}

.formulario fieldset {
  display: grid;
  gap: 1rem;
  padding: 1.25rem;
  border: 1px solid var(--color-borde);
  border-radius: var(--radio);
  background-color: var(--color-superficie);
}

.formulario label,
.formulario legend {
  font-weight: 700;
}

.formulario input,
.formulario select,
.formulario textarea {
  width: 100%;
  padding: 0.75rem;
  border: 2px solid #8d9199;
  border-radius: 0.4rem;
  background-color: white;
  font: inherit;
}

.formulario input:user-invalid,
.formulario select:user-invalid {
  border-color: #a12727;
}
```

## 9.11. Paso 8: enlace para saltar contenido

```css
.saltar {
  position: fixed;
  inset-block-start: 0.5rem;
  inset-inline-start: 0.5rem;
  z-index: 100;
  padding: 0.75rem 1rem;
  color: white;
  background-color: #111;
  transform: translateY(-150%);
}

.saltar:focus {
  transform: translateY(0);
}
```

El enlace permanece disponible para teclado aunque no ocupe espacio visual mientras no recibe el foco.

## 9.12. Paso 9: adaptación

```css
@media (min-width: 48rem) {
  .portada__contenido {
    padding-block: 8rem;
  }

  .formulario__fila {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }
}

@media (prefers-reduced-motion: reduce) {
  html {
    scroll-behavior: auto;
  }

  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

## 9.13. Paso 10: pie e impresión

```css
.pie {
  padding-block: 2rem;
  color: white;
  background-color: var(--color-principal);
}

@media print {
  .cabecera,
  .boton,
  .saltar,
  .pie {
    display: none;
  }

  body {
    color: black;
    background: white;
  }

  .pelicula {
    break-inside: avoid;
    box-shadow: none;
  }
}
```

## 9.14. Comprobaciones

1. Validar HTML y CSS.
2. Probar navegación con teclado.
3. Revisar el foco de enlaces, campos y botones.
4. Probar anchos desde 320 px hasta escritorio amplio.
5. Ampliar el zoom y comprobar que no desaparece contenido.
6. Activar movimiento reducido.
7. Revisar la vista de impresión.
8. Comprobar que no existe desplazamiento horizontal injustificado.
9. Revisar Flexbox y Grid con el inspector.

## 9.15. README

Debe incluir:

- Objetivo y temática.
- Estructura de archivos.
- Paleta y variables utilizadas.
- Decisiones de Flexbox, Grid y responsive.
- Medidas de accesibilidad.
- Procedencia y licencia de imágenes.
- Capturas de móvil y escritorio.
- Problemas encontrados y solución.

## 9.16. Ampliaciones

- Tema oscuro mediante `prefers-color-scheme`.
- Página de preguntas frecuentes.
- Tabla de programación adaptable.
- Galería adicional con Grid.
- Componente de aviso para cambios de última hora.

## 9.17. Lista de comprobación

- [ ] CSS externo correctamente vinculado.
- [ ] Variables para colores y medidas repetidas.
- [ ] Selectores comprensibles y sin especificidad innecesaria.
- [ ] Modelo de cajas global con `border-box`.
- [ ] Flexbox y Grid usados con una finalidad clara.
- [ ] Diseño mobile first y sin anchuras rígidas problemáticas.
- [ ] Estados `hover` y `focus-visible` distinguibles.
- [ ] Movimiento reducido respetado.
- [ ] Formularios legibles y controles suficientemente grandes.
- [ ] HTML y CSS válidos.
- [ ] README y capturas incluidos.

## 9.18. Propuesta de evaluación

| Criterio | Peso orientativo |
|---|---:|
| Organización, sintaxis y cascada | 15 % |
| Apariencia, tipografía y modelo de cajas | 15 % |
| Flexbox | 15 % |
| Grid | 15 % |
| Diseño adaptable | 15 % |
| Accesibilidad y estados | 15 % |
| README, validación y presentación | 10 % |

## 9.19. Referencias técnicas

- CSS Snapshot del W3C.
- CSS Flexible Box Layout Module.
- CSS Grid Layout Module.
- Media Queries.

