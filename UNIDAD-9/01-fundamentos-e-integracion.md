# 1. Fundamentos e integración de CSS

## 1.1. ¿Qué es CSS?

**CSS** significa *Cascading Style Sheets* o «hojas de estilo en cascada». Es el lenguaje utilizado para describir cómo se presenta un documento HTML o XML.

CSS permite definir, entre otras cosas:

- Colores y fondos.
- Tipografías y tamaños de texto.
- Márgenes, rellenos y bordes.
- Distribución en filas, columnas y cuadrículas.
- Adaptación a distintos anchos de pantalla.
- Estados visuales, transiciones y animaciones.

## 1.2. Anatomía de una regla

```css
.aviso {
  color: #7a1f1f;
  background-color: #fff1f1;
  border: 1px solid #d98282;
}
```

- `.aviso` es el **selector**.
- Cada pareja `propiedad: valor` es una **declaración**.
- Las declaraciones se agrupan dentro de `{ }`.
- Cada declaración termina normalmente en `;`.

CSS ignora espacios y saltos de línea innecesarios, pero una presentación consistente facilita la lectura.

## 1.3. Tres formas de incluir CSS

### Hoja externa

```html
<head>
  <link rel="stylesheet" href="css/estilos.css">
</head>
```

Es la opción habitual porque permite reutilizar los estilos, mantener separado el contenido y aprovechar la caché del navegador.

### Bloque interno

```html
<head>
  <style>
    body {
      background-color: #f7f4ef;
    }
  </style>
</head>
```

Puede ser útil en demostraciones o documentos aislados, pero resulta difícil de reutilizar.

### Estilo en línea

```html
<p style="color: darkred;">Mensaje urgente</p>
```

Mezcla contenido y presentación, aumenta la especificidad y complica el mantenimiento. Debe evitarse salvo casos muy concretos.

## 1.4. Estructura de proyecto

```text
radio-comunitaria/
├── index.html
├── programas.html
├── css/
│   └── estilos.css
└── img/
    └── estudio.jpg
```

Desde `index.html`:

```html
<link rel="stylesheet" href="css/estilos.css">
```

Desde el archivo CSS, la ruta de una imagen se calcula respecto al propio CSS:

```css
.portada {
  background-image: url("../img/estudio.jpg");
}
```

## 1.5. Primeros estilos

```css
body {
  margin: 0;
  font-family: Arial, sans-serif;
  color: #242424;
  background-color: #f6f3ed;
}

h1 {
  color: #5c214d;
}

a {
  color: #245b8a;
}
```

Los nombres de propiedades se escriben normalmente en minúsculas y con guiones.

## 1.6. Comentarios

```css
/* Navegación principal */
nav {
  background-color: #1f2933;
}
```

CSS utiliza `/* ... */`. Los comentarios `//` no son válidos en CSS convencional.

## 1.7. Normalización básica

Los navegadores aplican estilos iniciales. Una base frecuente es:

```css
*,
*::before,
*::after {
  box-sizing: border-box;
}

body {
  margin: 0;
}

img,
video {
  display: block;
  max-width: 100%;
  height: auto;
}
```

Esto no «borra» todos los estilos del navegador, pero hace más predecibles las cajas y evita que imágenes grandes desborden su contenedor.

## 1.8. Organización de una hoja

Una estructura sencilla:

```css
/* 1. Variables */
/* 2. Base y tipografía */
/* 3. Estructura general */
/* 4. Componentes */
/* 5. Utilidades */
/* 6. Media queries */
```

Conviene agrupar reglas relacionadas y evitar repetir declaraciones sin necesidad.

## 1.9. Actividades

1. Crea la estructura de carpetas del ejemplo.
2. Vincula una hoja externa y comprueba que se carga.
3. Cambia fondo, color y tipografía general.
4. Añade una imagen adaptable.
5. Provoca un error en la ruta del CSS y localízalo desde las herramientas del navegador.

