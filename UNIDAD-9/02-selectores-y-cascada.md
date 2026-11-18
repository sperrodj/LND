# 2. Selectores, cascada, herencia y especificidad

## 2.1. Selectores básicos

```css
/* Elemento */
p { line-height: 1.6; }

/* Clase */
.destacado { background-color: #fff4b8; }

/* Identificador */
#programacion { padding-block: 2rem; }

/* Selector universal */
* { box-sizing: border-box; }
```

Las clases son reutilizables. Un `id` debe ser único en el HTML y suele reservarse para fragmentos, formularios o relaciones de accesibilidad; no es necesario usarlo habitualmente para estilos.

## 2.2. Agrupación

```css
h1,
h2,
h3 {
  font-family: Georgia, serif;
  line-height: 1.2;
}
```

La coma significa «aplicar a cada selector».

## 2.3. Combinadores

```css
/* Descendientes en cualquier nivel */
article p { color: #343434; }

/* Hijo directo */
nav > ul { list-style: none; }

/* Hermano inmediatamente posterior */
h2 + p { font-size: 1.1rem; }

/* Hermanos posteriores */
h2 ~ p { max-width: 70ch; }
```

No es lo mismo `nav ul` que `nav > ul`: el primero selecciona listas a cualquier profundidad; el segundo solo las hijas directas.

## 2.4. Selectores de atributos

```css
input[required] {
  border-left: 4px solid #b84949;
}

input[type="email"] {
  background-color: #f4f9ff;
}

a[href^="https://"] {
  text-decoration-thickness: 2px;
}

a[href$=".pdf"]::after {
  content: " (PDF)";
}
```

- `[atributo]`: el atributo existe.
- `[atributo="valor"]`: coincide exactamente.
- `^=`: empieza por.
- `$=`: termina en.
- `*=`: contiene.

El contenido generado con `::before` o `::after` no debe contener información imprescindible, porque puede no llegar de la misma forma a todas las tecnologías de apoyo.

## 2.5. Pseudoclases

```css
a:hover { color: #8a2459; }
a:focus-visible { outline: 3px solid #f2b705; }
button:active { transform: translateY(1px); }
input:required { border-color: #b84949; }
input:valid { border-color: #327a48; }
li:first-child { font-weight: bold; }
tr:nth-child(even) { background-color: #f3f5f7; }
```

Una pseudoclase describe un estado o posición. `:focus-visible` permite mostrar un indicador claro cuando el navegador considera que el foco debe hacerse visible, especialmente durante navegación por teclado.

## 2.6. Pseudoelementos

```css
p::first-line {
  font-weight: bold;
}

.etiqueta::before {
  content: "★ ";
}
```

Los pseudoelementos seleccionan una parte conceptual de un elemento o crean una caja generada.

## 2.7. La cascada

Cuando varias reglas afectan a la misma propiedad, el navegador decide mediante:

1. Origen e importancia de la declaración.
2. Capa de cascada, si se utilizan capas.
3. Especificidad del selector.
4. Orden de aparición si lo anterior empata.

Ejemplo:

```css
p { color: #333; }
.introduccion { color: #375a7f; }
```

Un párrafo con `class="introduccion"` recibe el segundo color porque la clase es más específica.

## 2.8. Especificidad

Como modelo inicial:

- Estilos en línea: muy alta especificidad.
- Selectores de ID.
- Clases, atributos y pseudoclases.
- Elementos y pseudoelementos.

```css
#principal .tarjeta p { color: red; }
.tarjeta p { color: blue; }
p { color: black; }
```

Es preferible mantener selectores sencillos antes que competir con reglas cada vez más específicas.

## 2.9. `!important`

```css
.mensaje {
  color: red !important;
}
```

Altera el orden normal de la cascada y dificulta sobrescribir reglas. No debe utilizarse como arreglo rápido. Antes conviene revisar selector, orden, herencia y arquitectura de la hoja.

## 2.10. Herencia

Algunas propiedades, como `color` y `font-family`, suelen heredarse. Otras, como `margin`, `border` o `background`, no.

```css
body {
  color: #252525;
  font-family: system-ui, sans-serif;
}
```

Los descendientes heredarán estas propiedades salvo que se indique otra cosa.

Valores útiles:

```css
color: inherit;
all: initial;
all: unset;
```

`inherit` obliga a heredar; `initial` usa el valor inicial de la especificación; `unset` actúa como `inherit` en propiedades heredables y como `initial` en las demás.

## 2.11. Capas de cascada

```css
@layer base, componentes, utilidades;

@layer base {
  body { font-family: system-ui, sans-serif; }
}

@layer componentes {
  .boton { background: navy; color: white; }
}
```

Las capas permiten declarar de forma explícita qué grupos de reglas deben tener prioridad, reduciendo conflictos de especificidad. Para un proyecto pequeño son opcionales, pero conviene conocer su propósito.

## 2.12. Actividades

1. Selecciona los enlaces externos, campos obligatorios y filas pares de una tabla.
2. Compara `section p` con `section > p` usando HTML anidado.
3. Predice el color final de un elemento afectado por tres reglas.
4. Elimina un `!important` resolviendo correctamente la cascada.
5. Añade un foco visible sin eliminar el `outline` del navegador antes de sustituirlo.

