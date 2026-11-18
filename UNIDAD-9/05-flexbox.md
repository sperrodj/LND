# 5. Diseño flexible con Flexbox

## 5.1. ¿Cuándo utilizar Flexbox?

Flexbox organiza elementos principalmente en **una dimensión**: una fila o una columna. Resulta apropiado para:

- Barras de navegación.
- Grupos de botones.
- Tarjetas alineadas.
- Centrado y distribución de elementos.
- Componentes cuyo tamaño puede crecer o reducirse.

## 5.2. Contenedor e ítems

```css
.equipo {
  display: flex;
}
```

Los hijos directos se convierten en ítems flexibles. Los descendientes más profundos no lo son, salvo que su propio contenedor también declare `display: flex`.

## 5.3. Ejes

```css
.equipo {
  display: flex;
  flex-direction: row;
}
```

- Eje principal: depende de `flex-direction`.
- Eje transversal: perpendicular al principal.

Valores:

- `row` y `row-reverse`.
- `column` y `column-reverse`.

Los valores `reverse` cambian el orden visual, no el orden del documento. No deben utilizarse para corregir un HTML desordenado, porque la lectura y el foco pueden seguir otro orden.

## 5.4. Distribución y alineación

```css
.navegacion {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
}
```

- `justify-content`: distribuye en el eje principal.
- `align-items`: alinea en el eje transversal.
- `gap`: espacio entre ítems sin añadir márgenes exteriores.

Valores frecuentes: `flex-start`, `center`, `flex-end`, `space-between`, `space-around`, `space-evenly`, `stretch`.

## 5.5. Salto de línea

```css
.ponentes {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
}
```

Sin `wrap`, Flexbox intenta mantener los ítems en una sola línea y puede reducirlos.

## 5.6. Crecimiento y reducción

```css
.ponente {
  flex: 1 1 16rem;
}
```

La abreviatura corresponde a:

```css
flex-grow: 1;
flex-shrink: 1;
flex-basis: 16rem;
```

- `grow`: capacidad de ocupar espacio sobrante.
- `shrink`: capacidad de reducirse.
- `basis`: tamaño base antes de repartir espacio.

El patrón `flex: 1 1 16rem` permite tarjetas de al menos una base aproximada que crecen y saltan de línea cuando es necesario.

## 5.7. Propiedades por ítem

```css
.ponente--destacado {
  align-self: stretch;
}

.acciones__principal {
  margin-inline-start: auto;
}
```

`align-self` modifica la alineación transversal de un ítem. Un margen automático puede absorber espacio disponible.

`order` cambia el orden visual, pero debe evitarse cuando altere el sentido o el recorrido de teclado.

## 5.8. Navegación adaptable sencilla

```css
.menu {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.5rem 1.25rem;
  padding: 0;
  list-style: none;
}

.menu a {
  display: block;
  padding: 0.75rem 0;
}
```

El `ul` sigue existiendo en HTML y mantiene su semántica; CSS cambia únicamente su presentación.

## 5.9. Patrón de tarjeta horizontal

```css
.noticia {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
  align-items: flex-start;
}

.noticia img {
  flex: 1 1 16rem;
}

.noticia__contenido {
  flex: 2 1 24rem;
}
```

La tarjeta puede pasar de disposición horizontal a apilada sin una media query, según el espacio disponible.

## 5.10. Errores frecuentes

- Aplicar propiedades de ítem al contenedor o al revés.
- Usar `justify-content` esperando actuar sobre el eje transversal.
- Olvidar `flex-wrap`.
- Fijar anchuras incompatibles con pantallas pequeñas.
- Reordenar visualmente contenido que debe leerse en otro orden.
- Usar Flexbox para una cuadrícula bidimensional compleja.

## 5.11. Actividades

1. Construye una navegación con logo, enlaces y botón final.
2. Crea tarjetas que se distribuyan con `flex: 1 1 15rem`.
3. Cambia el eje a columna y explica cómo varían `justify-content` y `align-items`.
4. Reproduce una tarjeta de imagen y texto que se apile automáticamente.
5. Identifica qué propiedades pertenecen al contenedor y cuáles a los ítems.

