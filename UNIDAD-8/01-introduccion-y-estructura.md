# 1. Introducción y estructura de un documento HTML5

## 1.1. ¿Qué es HTML?

**HTML** significa *HyperText Markup Language* o lenguaje de marcado de hipertexto. Describe la estructura y el significado del contenido de una página mediante **elementos**.

HTML no es un lenguaje de programación: no contiene por sí mismo instrucciones, decisiones o bucles. Tampoco se ocupa principalmente del aspecto visual.

| Tecnología | Responsabilidad principal |
|---|---|
| HTML | Contenido y estructura |
| CSS | Presentación y distribución visual |
| JavaScript | Comportamiento e interacción |

## 1.2. Etiquetas, elementos y atributos

```html
<p class="aviso">La observación comienza a las 21:30.</p>
```

- `<p>` es la etiqueta de apertura.
- `</p>` es la etiqueta de cierre.
- Todo el conjunto es un elemento.
- `class` es un atributo y `aviso` es su valor.
- El texto situado entre las etiquetas es el contenido.

Algunos elementos, como `img`, `meta`, `input`, `br` o `hr`, son **elementos vacíos**: no envuelven contenido y no llevan etiqueta de cierre.

```html
<img src="img/luna.jpg" alt="La Luna en cuarto creciente">
```

## 1.3. Estructura mínima

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Observatorio del Teide</title>
  </head>
  <body>
    <h1>Observatorio del Teide</h1>
    <p>Agenda de observaciones astronómicas.</p>
  </body>
</html>
```

### Función de cada parte

- `<!DOCTYPE html>` activa el modo estándar de HTML actual.
- `<html lang="es">` es el elemento raíz e informa del idioma principal.
- `<head>` contiene datos sobre el documento que normalmente no se muestran como contenido.
- `charset="UTF-8"` permite representar correctamente tildes, eñes y otros caracteres.
- `viewport` adapta el ancho inicial a dispositivos móviles.
- `<title>` identifica la pestaña, los marcadores y el resultado de búsqueda.
- `<body>` contiene todo lo visible o interactivo.

## 1.4. Anidamiento correcto

Los elementos deben cerrarse en orden inverso al de apertura.

```html
<!-- Correcto -->
<p>Visita la exposición <strong>antes del domingo</strong>.</p>

<!-- Incorrecto -->
<p>Visita la exposición <strong>antes del domingo</p></strong>
```

También debe existir un único `html`, un solo `head` y un solo `body`.

## 1.5. Comentarios y entidades

```html
<!-- Este comentario no aparece en la página -->
<p>Entrada: 8 &euro;</p>
<p>Investigación &amp; divulgación</p>
```

Las entidades permiten escribir caracteres que tienen un significado especial en HTML, como `&amp;` para `&` o `&lt;` para `<`.

## 1.6. Jerarquía de encabezados

Los encabezados van de `h1` a `h6`. No indican un tamaño, sino el nivel jerárquico de una sección.

```html
<h1>Planetario municipal</h1>

<h2>Programación</h2>
<h3>Sesiones infantiles</h3>
<h3>Sesiones para adultos</h3>

<h2>Cómo llegar</h2>
```

Buenas prácticas:

- Usar un `h1` que identifique claramente el contenido principal.
- No elegir un nivel solo por su apariencia.
- No saltar de `h2` a `h4` sin motivo estructural.
- Mantener una jerarquía coherente.

## 1.7. Rutas y organización del proyecto

```text
observatorio/
├── index.html
├── paginas/
│   └── visitas.html
├── img/
│   └── telescopio.jpg
└── media/
    └── presentacion.mp4
```

- Ruta relativa desde `index.html`: `img/telescopio.jpg`.
- Desde `paginas/visitas.html` a la portada: `../index.html`.
- Ruta absoluta web: `https://ejemplo.org/visitas`.

Conviene usar nombres en minúsculas, sin espacios ni tildes: `visita-nocturna.html`.

## 1.8. Actividades breves

1. Crea `index.html` con la estructura mínima y cambia el idioma a español.
2. Añade una jerarquía con un título principal, dos secciones y dos subsecciones.
3. Detecta los errores:

```html
<html>
  <head>
    <title>Radio del barrio</title>
  <body>
    <h1>Programación semanal</h2>
    <p>Emisión en directo.
  </body>
</html>
```

La solución debe añadir `DOCTYPE`, `lang`, metadatos, cerrar `head`, hacer coincidir el encabezado y cerrar el párrafo.

