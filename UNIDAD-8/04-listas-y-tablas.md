# 4. Listas y tablas de datos

## 4.1. Listas no ordenadas

Se emplean cuando el orden no cambia el significado.

```html
<h2>Material del equipo</h2>
<ul>
  <li>Placa programable</li>
  <li>Sensor de distancia</li>
  <li>Dos motores</li>
</ul>
```

Cada elemento directo de `ul` debe ser un `li`.

## 4.2. Listas ordenadas

```html
<h2>Montaje del prototipo</h2>
<ol>
  <li>Fijar los motores al chasis.</li>
  <li>Conectar la alimentación.</li>
  <li>Cargar el programa de prueba.</li>
</ol>
```

El atributo `start` modifica el número inicial y `reversed` invierte la numeración, aunque normalmente el orden natural es suficiente.

## 4.3. Listas anidadas

La lista interior debe estar dentro del `li` al que pertenece.

```html
<ul>
  <li>
    Categoría educativa
    <ul>
      <li>Primaria</li>
      <li>Secundaria</li>
    </ul>
  </li>
  <li>Categoría libre</li>
</ul>
```

## 4.4. Listas de descripciones

```html
<dl>
  <dt>Autonomía</dt>
  <dd>Tiempo durante el cual el robot funciona sin recarga.</dd>
  <dt>Carga útil</dt>
  <dd>Peso máximo que puede transportar.</dd>
</dl>
```

`dl` agrupa términos (`dt`) y descripciones (`dd`). Puede servir para glosarios, metadatos o pares nombre-valor.

## 4.5. Tablas

Las tablas representan relaciones entre datos organizados en filas y columnas. No deben usarse para distribuir visualmente una página.

```html
<table>
  <caption>Clasificación de la prueba de velocidad</caption>
  <thead>
    <tr>
      <th scope="col">Posición</th>
      <th scope="col">Equipo</th>
      <th scope="col">Tiempo</th>
      <th scope="col">Penalización</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Circuito Norte</td>
      <td>01:42</td>
      <td>0 s</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Vector Sur</td>
      <td>01:39</td>
      <td>5 s</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th scope="row" colspan="2">Equipos clasificados</th>
      <td colspan="2">2</td>
    </tr>
  </tfoot>
</table>
```

### Elementos importantes

- `caption`: título descriptivo de la tabla.
- `thead`, `tbody`, `tfoot`: grupos lógicos de filas.
- `tr`: fila.
- `th`: celda de encabezado.
- `td`: celda de datos.
- `scope="col"` o `scope="row"`: relación entre un encabezado y sus datos.
- `colspan` y `rowspan`: hacen que una celda abarque varias columnas o filas.

## 4.6. Accesibilidad de las tablas

- Añadir un `caption` claro.
- Identificar encabezados con `th` y `scope`.
- Evitar celdas combinadas innecesarias.
- No dejar encabezados ambiguos.
- Explicar fuera de la tabla las abreviaturas complejas.
- Para estructuras muy complejas, simplificar o dividir la información.

## 4.7. Actividades

1. Crea una lista ordenada con las fases de una competición y una lista no ordenada con sus normas.
2. Representa en una tabla cuatro equipos, su categoría, puntuación y estado de clasificación.
3. Añade `caption`, `thead`, `tbody` y encabezados accesibles.
4. Explica por qué un horario semanal sí puede ser una tabla y un menú de navegación no.

