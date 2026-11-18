# 2. Texto, enlaces y contenido multimedia

## 2.1. Elementos de texto

```html
<p>La muestra permanecerá abierta hasta el <time datetime="2027-02-14">14 de febrero</time>.</p>
<p><strong>Aforo limitado.</strong> Se recomienda <em>reservar con antelación</em>.</p>
```

- `p`: párrafo.
- `strong`: contenido de gran importancia.
- `em`: énfasis que cambia el sentido de la frase.
- `mark`: contenido destacado por su relevancia en el contexto.
- `small`: información secundaria, como condiciones legales.
- `sub` y `sup`: subíndice y superíndice.
- `abbr`: abreviatura, preferiblemente con explicación.
- `time`: fecha u hora legible también por máquinas.

```html
<p>La asociación <abbr title="Asociación Fotográfica Insular">AFI</abbr> organiza el encuentro.</p>
<p>Las copias se conservan a 20&nbsp;&deg;C.</p>
```

`br` provoca un salto de línea dentro del mismo contenido —por ejemplo, una dirección—. No debe utilizarse para crear márgenes. `hr` representa un cambio temático, no una simple línea decorativa.

## 2.2. Citas y código

```html
<blockquote cite="https://ejemplo.org/entrevista">
  <p>Una fotografía no se toma, se construye.</p>
</blockquote>
<p><cite>Entrevista a la comisaria de la exposición</cite></p>

<p>El archivo principal se llama <code>index.html</code>.</p>
<pre><code>&lt;h1&gt;Archivo fotográfico&lt;/h1&gt;</code></pre>
```

`blockquote` se reserva para citas extensas; `q`, para citas breves dentro de un párrafo; `cite`, para el título o referencia de una obra.

## 2.3. Enlaces

```html
<a href="programacion.html">Consultar la programación</a>
<a href="https://www.w3.org/" hreflang="en">Sitio del W3C</a>
<a href="mailto:archivo@ejemplo.org">Escribir al archivo</a>
<a href="tel:+34922000000">Llamar al 922 000 000</a>
<a href="docs/programa.pdf" download>Descargar el programa</a>
```

El texto del enlace debe explicar su destino. Es preferible «Consulta las tarifas» a «Haz clic aquí».

Si un enlace se abre en otra pestaña:

```html
<a href="https://ejemplo.org" target="_blank" rel="noopener noreferrer">
  Archivo externo (abre en una pestaña nueva)
</a>
```

### Enlaces internos a fragmentos

```html
<nav aria-label="Índice de la página">
  <a href="#autoras">Autoras</a>
  <a href="#horarios">Horarios</a>
</nav>

<section id="autoras">
  <h2>Autoras</h2>
</section>
```

Cada `id` debe ser único en el documento.

## 2.4. Imágenes y texto alternativo

```html
<figure>
  <img
    src="img/retrato-taller.jpg"
    alt="Dos participantes revelan una fotografía en un cuarto oscuro"
    width="900"
    height="600">
  <figcaption>Taller de revelado analógico de 2026.</figcaption>
</figure>
```

- `src` indica el recurso.
- `alt` comunica el propósito de la imagen cuando no puede verse.
- `width` y `height` ayudan al navegador a reservar espacio.
- `figure` agrupa contenido autónomo y `figcaption` aporta su leyenda.

El texto alternativo depende del contexto:

- Imagen informativa: describe la información relevante.
- Imagen que funciona como enlace: indica la función del enlace.
- Imagen puramente decorativa: `alt=""`.
- No comenzar por «imagen de», salvo que el tipo de imagen sea relevante.

## 2.5. Imágenes adaptables

```html
<picture>
  <source media="(min-width: 900px)" srcset="img/sala-grande.webp">
  <source type="image/webp" srcset="img/sala.webp">
  <img src="img/sala.jpg" alt="Sala principal de la exposición">
</picture>
```

`picture` permite ofrecer distintos formatos o composiciones. Para resoluciones diferentes de una misma imagen también se puede usar `srcset` y `sizes` en `img`.

## 2.6. Audio y vídeo

```html
<audio controls>
  <source src="media/entrevista.ogg" type="audio/ogg">
  <source src="media/entrevista.mp3" type="audio/mpeg">
  Tu navegador no puede reproducir este audio.
</audio>
```

```html
<video controls width="720" poster="img/portada-documental.jpg">
  <source src="media/documental.webm" type="video/webm">
  <source src="media/documental.mp4" type="video/mp4">
  <track src="media/subtitulos-es.vtt" kind="subtitles" srclang="es" label="Español" default>
  Tu navegador no puede reproducir este vídeo.
</video>
```

No se recomienda reproducir sonido automáticamente. Un vídeo con voz necesita subtítulos y, cuando la información visual sea esencial, audiodescripción o una alternativa textual.

## 2.7. Contenido incrustado

```html
<iframe
  src="https://www.openstreetmap.org/export/embed.html"
  title="Mapa de ubicación de la exposición"
  loading="lazy">
</iframe>
```

Un `iframe` debe tener un `title` útil. Solo deben incrustarse fuentes fiables y respetando sus condiciones de uso.

## 2.8. Actividad

Crea una página para una exposición fotográfica que incluya:

- Encabezados y dos párrafos con `strong`, `em`, `abbr` y `time`.
- Un índice con enlaces a fragmentos.
- Una imagen con leyenda y texto alternativo adecuado.
- Un enlace interno, uno externo y uno de correo.
- Un audio o vídeo con contenido alternativo.

