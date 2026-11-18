# 3. Colores, tipografía, unidades y fondos

## 3.1. Formatos de color

```css
.muestra {
  color: rebeccapurple;
  background-color: #f5f0ff;
  border-color: rgb(102 51 153 / 40%);
}
```

Formatos habituales:

- Palabras clave: `black`, `transparent`, `currentColor`.
- Hexadecimal: `#1f2937`, `#fff`.
- RGB moderno: `rgb(31 41 55)`.
- RGB con transparencia: `rgb(31 41 55 / 70%)`.
- HSL: `hsl(215 28% 17%)`.

La transparencia mediante `opacity` afecta a toda la caja y sus descendientes. Para transparentar solo el fondo conviene usar un color con canal alfa.

## 3.2. Variables personalizadas

```css
:root {
  --color-principal: #405d48;
  --color-acento: #d98c3f;
  --color-fondo: #faf8f3;
  --espacio: 1rem;
  --radio: 0.75rem;
}

.tarjeta {
  padding: var(--espacio);
  border-radius: var(--radio);
  color: var(--color-principal);
}
```

Las variables se heredan y permiten centralizar decisiones. También admiten valor alternativo:

```css
color: var(--color-secundario, #333);
```

## 3.3. Familias tipográficas

```css
body {
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}

h1,
h2 {
  font-family: Georgia, "Times New Roman", serif;
}
```

La lista funciona como alternativas. Debe terminar con una familia genérica como `sans-serif`, `serif` o `monospace`.

## 3.4. Propiedades de texto

```css
body {
  font-size: 1rem;
  line-height: 1.6;
}

h1 {
  font-size: clamp(2rem, 5vw, 4rem);
  line-height: 1.1;
  letter-spacing: -0.02em;
}

.metadatos {
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.08em;
}
```

Para párrafos largos suele ser cómodo limitar la longitud de línea:

```css
p {
  max-width: 70ch;
}
```

`ch` se relaciona con el ancho del carácter `0` de la fuente y resulta útil para controlar líneas de lectura.

## 3.5. Unidades

| Unidad | Referencia | Uso habitual |
|---|---|---|
| `px` | Píxel CSS | Bordes y medidas concretas |
| `rem` | Tamaño de fuente del elemento raíz | Tipografía y espacios escalables |
| `em` | Tamaño de fuente del elemento actual | Componentes que escalan consigo mismos |
| `%` | Medida relativa al contexto | Anchuras y proporciones |
| `vw`, `vh` | Porcentaje del viewport | Tamaños ligados a la ventana |
| `ch` | Ancho aproximado del carácter `0` | Longitud de texto |
| `fr` | Fracción del espacio de Grid | Columnas y filas de cuadrícula |

No existe una única unidad correcta. La elección depende de qué relación se desea expresar.

## 3.6. Funciones de tamaño

```css
.contenedor {
  width: min(100% - 2rem, 70rem);
  margin-inline: auto;
}

h1 {
  font-size: clamp(2rem, 4vw, 3.5rem);
}
```

- `min()` elige el valor menor.
- `max()` elige el mayor.
- `clamp(mínimo, preferido, máximo)` mantiene un valor dentro de límites.
- `calc()` combina operaciones compatibles: `calc(100% - 2rem)`.

## 3.7. Fondos

```css
.cabecera {
  color: white;
  background-color: #23374d;
  background-image:
    linear-gradient(rgb(0 0 0 / 55%), rgb(0 0 0 / 55%)),
    url("../img/archivo-historico.jpg");
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}
```

Una imagen de fondo es decorativa y no tiene `alt`. Si comunica información esencial, debe incorporarse mediante HTML con una alternativa textual.

## 3.8. Bordes, sombras y radios

```css
.ficha {
  border: 1px solid #d5d9dc;
  border-radius: 0.75rem;
  box-shadow: 0 0.5rem 1.5rem rgb(0 0 0 / 10%);
}
```

Las sombras suaves pueden indicar elevación, pero no deben ser el único mecanismo para distinguir límites importantes.

## 3.9. Contraste

El texto debe mantener suficiente contraste con el fondo. No basta con que una combinación «se vea bonita» en una pantalla concreta. Debe comprobarse también en estados `hover`, `focus`, `disabled` y mensajes de error.

## 3.10. Actividades

1. Define una paleta mediante variables.
2. Crea una escala tipográfica usando `rem` y `clamp()`.
3. Limita el ancho de lectura de los párrafos.
4. Añade un fondo con degradado sin ocultar el contenido.
5. Compara `opacity: .5` con un fondo `rgb(... / 50%)`.

