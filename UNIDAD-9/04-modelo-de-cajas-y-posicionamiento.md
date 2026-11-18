# 4. Modelo de cajas, visualización y posicionamiento

## 4.1. El modelo de cajas

Cada elemento se representa como una caja formada por:

1. Contenido.
2. `padding` o relleno interior.
3. `border` o borde.
4. `margin` o espacio exterior.

```css
.entrada {
  width: 20rem;
  padding: 1.5rem;
  border: 2px solid #4b6584;
  margin: 1rem;
}
```

Con el modelo inicial `content-box`, `width` solo mide el contenido. El tamaño total horizontal suma contenido, relleno y bordes.

## 4.2. `box-sizing`

```css
*,
*::before,
*::after {
  box-sizing: border-box;
}
```

Con `border-box`, el ancho declarado incluye contenido, relleno y borde. Los márgenes siguen quedando fuera.

## 4.3. Propiedades lógicas

```css
.entrada {
  margin-block: 1rem;
  margin-inline: auto;
  padding-block: 1.5rem;
  padding-inline: 2rem;
}
```

Las propiedades lógicas se adaptan a la dirección de escritura:

- `inline`: eje por el que avanza el texto.
- `block`: eje en el que se apilan los bloques.

Son preferibles cuando no se desea ligar el diseño a izquierda/derecha.

## 4.4. Colapso de márgenes

Los márgenes verticales de ciertos elementos de bloque pueden colapsar: en lugar de sumarse, se conserva normalmente el mayor. `padding`, `border`, Flexbox y Grid cambian estas condiciones. Si un espacio parece inesperado, conviene inspeccionar las cajas antes de añadir márgenes al azar.

## 4.5. `display`

```css
.enlace-boton { display: inline-block; }
.tarjetas { display: flex; }
.galeria { display: grid; }
.oculto { display: none; }
```

- `block`: ocupa normalmente todo el espacio disponible en el eje en línea.
- `inline`: participa en la línea y no acepta todas las dimensiones de la misma forma.
- `inline-block`: fluye en línea, pero conserva una caja dimensionable.
- `flex`: activa Flexbox para los hijos directos.
- `grid`: activa Grid para los hijos directos.
- `none`: elimina la caja y también la oculta a tecnologías de apoyo.

## 4.6. Desbordamiento

```css
.tabla-contenedor {
  overflow-x: auto;
}

.resumen {
  overflow-wrap: anywhere;
}
```

`overflow` puede ser `visible`, `hidden`, `auto` o `scroll`. No conviene ocultar contenido solo para que «quepa».

## 4.7. Posicionamiento

### Flujo normal

Es el comportamiento predeterminado. Antes de usar `position`, Flexbox o Grid, conviene comprobar si el flujo normal ya resuelve el diseño.

### `relative`

```css
.ficha {
  position: relative;
}
```

El elemento mantiene su espacio original y puede servir como referencia para descendientes absolutos.

### `absolute`

```css
.ficha__etiqueta {
  position: absolute;
  inset-block-start: 1rem;
  inset-inline-end: 1rem;
}
```

Sale del flujo normal y se posiciona respecto al ancestro posicionado más próximo. No debe utilizarse para construir toda una página.

### `fixed`

```css
.volver-arriba {
  position: fixed;
  inset-inline-end: 1rem;
  inset-block-end: 1rem;
}
```

Se posiciona respecto al viewport. Puede tapar contenido o dificultar el zoom, por lo que debe usarse con cuidado.

### `sticky`

```css
.indice {
  position: sticky;
  inset-block-start: 1rem;
}
```

Se comporta como parte del flujo hasta alcanzar el límite indicado. Su funcionamiento depende también de los contenedores y del desbordamiento de sus ancestros.

## 4.8. `z-index` y contextos de apilamiento

```css
.menu {
  position: relative;
  z-index: 10;
}
```

`z-index` no es una puntuación global. Los elementos se comparan dentro de contextos de apilamiento. Propiedades como `position` con `z-index`, `opacity` inferior a 1 o ciertas transformaciones pueden crear contextos nuevos.

## 4.9. Centrado de contenido

Bloque con ancho limitado:

```css
.contenedor {
  width: min(100% - 2rem, 70rem);
  margin-inline: auto;
}
```

Centrado en ambos ejes mediante Grid:

```css
.portada {
  min-height: 60vh;
  display: grid;
  place-items: center;
}
```

## 4.10. Actividades

1. Calcula el tamaño total de una caja con `content-box`.
2. Repite el cálculo con `border-box`.
3. Crea un contenedor centrado con ancho máximo.
4. Añade una etiqueta absoluta dentro de una tarjeta relativa.
5. Haz que una tabla ancha pueda desplazarse sin recortar datos.

