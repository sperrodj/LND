# 6. Diseño bidimensional con Grid

## 6.1. ¿Cuándo utilizar Grid?

CSS Grid organiza contenido en **filas y columnas**. Es apropiado para:

- Galerías.
- Paneles y cuadros de datos.
- Distribuciones generales de página.
- Componentes que necesitan alinear elementos en dos ejes.

Flexbox y Grid no compiten: pueden combinarse. Grid puede distribuir las zonas principales y Flexbox alinear elementos dentro de cada zona.

## 6.2. Cuadrícula básica

```css
.galeria {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.5rem;
}
```

`1fr` representa una fracción del espacio disponible después de considerar tamaños fijos y espacios.

## 6.3. Columnas adaptables

```css
.galeria {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 16rem), 1fr));
  gap: 1.5rem;
}
```

- `repeat()` repite una definición.
- `auto-fit` crea tantas columnas como puedan caber y contrae las vacías.
- `minmax()` define mínimo y máximo.
- `min(100%, 16rem)` evita que el mínimo desborde una pantalla más estrecha.

## 6.4. Filas y cuadrícula implícita

```css
.panel {
  display: grid;
  grid-template-columns: 2fr 1fr;
  grid-auto-rows: minmax(8rem, auto);
}
```

Las pistas declaradas son explícitas. Si aparecen más elementos de los previstos, Grid puede crear filas o columnas implícitas controladas con `grid-auto-rows` y `grid-auto-columns`.

## 6.5. Colocación mediante líneas

```css
.destacada {
  grid-column: 1 / 3;
  grid-row: 1 / 2;
}
```

Otra forma:

```css
.destacada {
  grid-column: span 2;
}
```

Debe comprobarse qué ocurre cuando el número de columnas disminuye. Un `span` demasiado grande puede producir resultados inesperados en pantallas estrechas.

## 6.6. Áreas con nombre

```css
.pagina {
  display: grid;
  grid-template-columns: 16rem 1fr;
  grid-template-areas:
    "cabecera cabecera"
    "lateral contenido"
    "pie pie";
  gap: 1.5rem;
}

.cabecera { grid-area: cabecera; }
.lateral { grid-area: lateral; }
.contenido { grid-area: contenido; }
.pie { grid-area: pie; }
```

Las áreas facilitan visualizar la distribución. Cada fila debe tener el mismo número de celdas y las áreas deben formar regiones rectangulares.

## 6.7. Alineación

```css
.galeria {
  align-items: stretch;
  justify-items: start;
  align-content: start;
  justify-content: center;
}
```

- `align-items` y `justify-items`: alinean contenido dentro de cada celda.
- `align-content` y `justify-content`: distribuyen la cuadrícula completa cuando sobra espacio.
- `place-items` y `place-content`: abreviaturas para ambos ejes.

## 6.8. Ejemplo: programación de talleres

```css
.programacion {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(min(100%, 18rem), 1fr));
  gap: 1rem;
}

.taller {
  display: grid;
  grid-template-rows: auto 1fr auto;
  padding: 1.25rem;
  border: 1px solid #ccd3d8;
  border-radius: 0.75rem;
}
```

La cuadrícula exterior distribuye tarjetas; cada tarjeta utiliza otra cuadrícula para alinear cabecera, contenido y acciones.

## 6.9. Cambio de distribución

```css
.pagina {
  display: grid;
  grid-template-areas:
    "cabecera"
    "contenido"
    "lateral"
    "pie";
}

@media (min-width: 50rem) {
  .pagina {
    grid-template-columns: 1fr 18rem;
    grid-template-areas:
      "cabecera cabecera"
      "contenido lateral"
      "pie pie";
  }
}
```

El orden del HTML debe seguir siendo lógico sin CSS. Las áreas cambian la presentación, no el orden de lectura del documento.

## 6.10. Flexbox o Grid

| Situación | Herramienta inicial |
|---|---|
| Alinear elementos en una fila | Flexbox |
| Navegación que puede saltar de línea | Flexbox |
| Galería en filas y columnas | Grid |
| Estructura principal con zonas | Grid |
| Centrar un único elemento | Cualquiera de las dos |
| Componentes dentro de celdas | Flexbox o Grid según necesidad |

## 6.11. Actividades

1. Crea una galería de columnas adaptables.
2. Haz que la primera tarjeta ocupe dos columnas solo cuando existan al menos tres.
3. Construye una página con áreas de cabecera, contenido, lateral y pie.
4. Cambia las áreas mediante una media query.
5. Resuelve un componente con Flexbox y Grid y compara ambas soluciones.

