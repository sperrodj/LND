# 6. Accesibilidad, metadatos y validación

## 6.1. Accesibilidad web

Una web accesible puede ser percibida, comprendida y utilizada por personas con distintas capacidades, dispositivos y formas de interacción. No es una mejora opcional al final del proyecto: debe integrarse desde el marcado inicial.

Cuatro principios generales:

- **Perceptible:** la información debe poder percibirse de distintas formas.
- **Operable:** la interfaz debe poder manejarse, también con teclado.
- **Comprensible:** el contenido y la interacción deben ser claros.
- **Robusto:** el marcado debe funcionar con navegadores y tecnologías de apoyo.

## 6.2. Decisiones HTML que mejoran la accesibilidad

### Idioma y título

```html
<html lang="es">
  <head>
    <title>Trámites de empadronamiento | Ayuntamiento de Valle Claro</title>
  </head>
</html>
```

Si aparece una frase en otro idioma puede indicarse localmente:

```html
<p>La sesión finaliza con una ronda de <span lang="en">feedback</span>.</p>
```

### Enlace para saltar la navegación

```html
<a href="#contenido-principal">Saltar al contenido principal</a>
<header>...</header>
<main id="contenido-principal">...</main>
```

CSS permitirá ocultarlo visualmente hasta que reciba el foco, pero debe seguir disponible para teclado.

### Controles nativos

```html
<!-- Correcto: tiene significado y comportamiento de teclado -->
<button type="button">Mostrar requisitos</button>

<!-- Incorrecto como control interactivo -->
<div onclick="mostrarRequisitos()">Mostrar requisitos</div>
```

Es preferible emplear HTML nativo antes que recrear sus funciones con `div` y atributos ARIA.

### Imágenes

```html
<img src="img/rampa-entrada.jpg" alt="La entrada de la oficina dispone de una rampa a la derecha">
<img src="img/franja-decorativa.svg" alt="">
```

### Formularios

- Etiquetas visibles asociadas.
- Instrucciones antes de los controles.
- Errores concretos que no dependan solo del color.
- Orden de lectura y de tabulación lógico.
- Agrupaciones con `fieldset` y `legend`.
- `autocomplete` cuando corresponda.

### Multimedia

- Subtítulos para diálogos y sonidos importantes.
- Transcripción para contenido de audio.
- Controles de reproducción accesibles.
- Evitar reproducción automática y destellos peligrosos.

## 6.3. ARIA: solo cuando hace falta

ARIA añade información de accesibilidad cuando HTML nativo no puede expresar una relación o estado.

```html
<nav aria-label="Trámites relacionados">...</nav>
<p id="ayuda-nif">Escribe ocho cifras y una letra.</p>
<input id="nif" name="nif" aria-describedby="ayuda-nif">
```

Regla práctica: si existe un elemento HTML nativo con la semántica y el comportamiento necesarios, úsalo antes que ARIA. ARIA no corrige por sí sola un control que no funciona con teclado.

## 6.4. Metadatos esenciales

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cita previa | Oficina de Atención Ciudadana</title>
  <meta
    name="description"
    content="Solicita cita previa y consulta los documentos necesarios para realizar trámites municipales.">
</head>
```

- El `title` debe ser específico y diferente en cada página.
- La descripción resume el contenido; un buscador puede utilizarla como fragmento, aunque no está obligado.
- El encabezado `h1` aparece en la página; `title` identifica el documento fuera de ella. Ambos son necesarios.

### Metadatos sociales básicos

```html
<meta property="og:title" content="Cita previa municipal">
<meta property="og:description" content="Consulta requisitos y reserva una cita.">
<meta property="og:image" content="https://ejemplo.org/img/oficina.jpg">
<meta property="og:url" content="https://ejemplo.org/cita-previa.html">
```

Estos metadatos ayudan a describir la página cuando se comparte en servicios compatibles.

## 6.5. HTML y posicionamiento

El marcado ayuda a interpretar el contenido, pero no garantiza una posición concreta. Son buenas prácticas:

- Títulos y descripciones precisos.
- Un `h1` claro y encabezados jerárquicos.
- Texto de enlaces descriptivo.
- Contenido útil y comprensible.
- Imágenes con alternativas adecuadas.
- HTML semántico y páginas rápidas.

No se deben repetir palabras de forma artificial ni ocultar texto para manipular resultados.

## 6.6. Validación

Un documento válido sigue las reglas sintácticas del lenguaje. La validación puede detectar:

- Etiquetas mal anidadas o sin cerrar.
- Atributos no permitidos.
- Valores incorrectos.
- Identificadores duplicados.
- Elementos colocados en lugares no admitidos.

Herramientas posibles:

1. Validador HTML del W3C mediante archivo, URL o código pegado.
2. Extensiones de edición que analicen HTML.
3. Inspector y herramientas de accesibilidad del navegador.
4. Auditorías automáticas, como Lighthouse, complementadas con revisión manual.

> Que una página sea válida no significa que sea accesible, correcta ni útil. La validación es una comprobación necesaria, pero no suficiente.

## 6.7. Revisión manual

Antes de entregar:

- Recorrer toda la página usando solo `Tab`, `Shift + Tab`, `Enter`, espacio y flechas.
- Comprobar que el foco sigue un orden lógico.
- Revisar encabezados y regiones con el árbol de accesibilidad del navegador.
- Desactivar imágenes y comprobar si el contenido conserva sentido.
- Aumentar el zoom y verificar que no se pierde información.
- Revisar los mensajes de error del formulario.
- Confirmar que ningún enlace usa textos ambiguos como «aquí» o «más» sin contexto.

## 6.8. Ejercicio de auditoría

Analiza este fragmento:

```html
<html>
<head><title>Inicio</title></head>
<body>
  <div onclick="enviar()">Enviar</div>
  <img src="oficina.jpg">
  <input type="text" placeholder="Nombre">
  <a href="requisitos.html">Pulsa aquí</a>
</body>
</html>
```

Propón al menos seis mejoras. Entre ellas: `lang`, metadatos, título específico, `button`, texto alternativo, `label`, `id`, `name` y texto de enlace descriptivo.

