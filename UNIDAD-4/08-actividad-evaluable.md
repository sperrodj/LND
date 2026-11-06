# 8. Actividad evaluable: catálogo de libros actuales con XPath

## Descripción

Crearás un catálogo XML de **libros actuales** y utilizarás XPath para consultar su información.

Todos realizaréis la misma temática general, pero podrás personalizar el catálogo escogiendo libros y géneros que te interesen. Puedes incluir fantasía, misterio, terror, ciencia ficción, romance, novela histórica, thriller, juvenil, manga, ensayo u otros géneros.

Los libros deben ser reales y relativamente actuales. Utiliza preferentemente obras publicadas desde 2015 y comprueba que los datos incluidos sean coherentes.

## 1. Estructura del repositorio

```text
unidad-04/
└── actividad-evaluable-xpath/
    ├── README.md
    ├── biblioteca.xml
    └── img/
        ├── consulta-01.png
        ├── consulta-02.png
        └── consulta-03.png
```

## 2. Contenido obligatorio de `biblioteca.xml`

El documento debe contener:

- Declaración XML con codificación UTF-8.
- Un único elemento raíz llamado `<biblioteca>`.
- Un atributo `actualizado` en el elemento raíz.
- Un mínimo de **diez libros**.
- Libros pertenecientes, como mínimo, a **cuatro géneros diferentes**.
- Al menos dos libros de cada uno de los cuatro géneros principales elegidos.
- Un atributo `id` único en cada libro, con valores como `L001`, `L002`, etc.
- Un atributo `disponible` con los valores `true` o `false`.
- Una colección `<generos>` que contenga uno o varios elementos `<genero>`.
- Una colección `<formatos>` con uno o varios elementos `<formato>`, como tapa dura, tapa blanda, libro electrónico o audiolibro.
- Un elemento opcional `<saga>`, presente únicamente en los libros que pertenezcan a una saga.
- Un comentario XML antes del primer libro añadido por el alumno o alumna.
- Algún contenido textual que obligue a escribir `&amp;` correctamente.
- Indentación coherente y un documento bien formado.

Cada libro deberá seguir una estructura similar a esta:

```xml
<libro id="L001" disponible="true">
  <titulo>La asistenta</titulo>
  <autor>
    <nombre>Freida McFadden</nombre>
    <nacionalidad>Estadounidense</nacionalidad>
  </autor>
  <anio_publicacion>2022</anio_publicacion>
  <generos>
    <genero>Thriller</genero>
    <genero>Misterio</genero>
  </generos>
  <editorial>Suma</editorial>
  <formatos>
    <formato>Tapa blanda</formato>
    <formato>Libro electrónico</formato>
  </formatos>
  <precio moneda="EUR">19.90</precio>
  <valoracion>4.2</valoracion>
  <saga>La asistenta</saga>
</libro>
```

Puedes elegir libremente los libros. No es obligatorio utilizar el libro del ejemplo.

## 3. Comprobación inicial

Antes de realizar las consultas, comprueba que el XML está bien formado:

```bash
xmllint --noout biblioteca.xml
```

Si el comando no muestra ningún mensaje, el documento está bien formado. Incluye en el README una captura de esta comprobación.

## 4. Consultas XPath obligatorias

Escribe, ejecuta y documenta las siguientes **18 consultas**.

### Selecciones básicas

1. Seleccionar el elemento raíz `<biblioteca>`.
2. Seleccionar todos los libros.
3. Seleccionar los títulos de todos los libros.
4. Seleccionar todos los identificadores `id`.
5. Seleccionar todos los géneros, aunque se repitan.

### Predicados y operadores

6. Seleccionar un libro mediante un identificador concreto.
7. Seleccionar los títulos de los libros disponibles.
8. Seleccionar los libros de un género determinado que te guste.
9. Seleccionar los libros publicados desde 2020, incluido.
10. Seleccionar los libros disponibles cuyo precio sea inferior a 20 euros.
11. Seleccionar los libros pertenecientes a uno de dos géneros utilizando `or`.
12. Seleccionar los libros que no tengan el elemento opcional `<saga>`.

### Posiciones y funciones

13. Seleccionar el primer y el último libro.
14. Seleccionar los tres primeros libros del catálogo.
15. Contar el número total de libros.
16. Contar cuántos libros pertenecen a un género concreto.
17. Buscar títulos que contengan una palabra mediante `contains()`.
18. Calcular el precio medio utilizando `sum()`, `count()` y `div`.

## 5. Consultas con ejes de navegación

Además de las 18 consultas anteriores, realiza estas dos consultas:

19. Partir de un elemento `<genero>` y utilizar `ancestor::libro` para obtener el título de su libro.
20. Partir de `<titulo>` y utilizar `following-sibling` para seleccionar el elemento `<autor>` del mismo libro.

## 6. Consultas de ampliación

Puedes añadir consultas propias para demostrar un mayor dominio de XPath:

- Seleccionar libros que tengan más de un género.
- Seleccionar libros disponibles en formato audiolibro.
- Mostrar libros cuya valoración sea igual o superior a 4.
- Unir títulos y precios mediante `|`.
- Buscar un título sin distinguir mayúsculas mediante `translate()`.
- Seleccionar el libro más caro comparando precios.

## 7. Documentación en `README.md`

El README debe incluir:

1. Título de la actividad.
2. Explicación breve del catálogo y de los géneros elegidos.
3. Fuentes utilizadas para consultar los datos de los libros.
4. Árbol simplificado de la estructura XML.
5. Tabla de decisiones de diseño.
6. Código completo de `biblioteca.xml` dentro de un bloque `xml`.
7. Las veinte consultas XPath numeradas.
8. Objetivo de cada consulta.
9. Expresión XPath utilizada.
10. Resultado obtenido y una breve interpretación.
11. Captura de la comprobación inicial con `xmllint`.
12. Un mínimo de tres capturas de consultas XPath ejecutadas.
13. Apartado de problemas encontrados y soluciones aplicadas.
14. Conclusión personal sobre XPath.

Documenta cada consulta con una estructura similar:

````markdown
### Consulta 7. Libros disponibles

**Objetivo:** seleccionar los títulos de los libros disponibles.

**XPath:**

```xpath
//libro[@disponible='true']/titulo
```

**Resultado:** la consulta devuelve los títulos de los libros cuyo atributo `disponible` contiene el valor `true`.
````

## 8. Capturas obligatorias

Las capturas deben mostrar claramente el comando, la expresión XPath, el resultado y el nombre del archivo utilizado.

No es necesario capturar las veinte consultas. Incluye, como mínimo:

- Comprobación del XML con `xmllint --noout`.
- Una consulta con varios predicados.
- La consulta del precio medio.
- Una consulta que utilice un eje.

## 9. Rúbrica de evaluación

| Criterio | Peso |
|---|---:|
| XML bien formado y cumplimiento de la estructura solicitada | 20 % |
| Selecciones básicas | 15 % |
| Predicados, operadores y posiciones | 25 % |
| Funciones XPath | 15 % |
| Ejes de navegación | 15 % |
| README, evidencias, organización y expresión escrita | 10 % |

## 10. Condiciones importantes

- Un XML que no esté bien formado no permite ejecutar correctamente XPath y afectará de forma importante a la calificación.
- Las consultas deben estar ejecutadas y comprobadas; no basta con escribirlas.
- Los datos de los libros deben ser coherentes y proceder de fuentes identificadas.
- Las explicaciones deben estar redactadas con palabras propias.
- Las capturas sin explicación no sustituyen la documentación del README.
- Los archivos vacíos se consideran apartados no realizados.
- No es necesario crear un DTD ni un XSD para esta actividad.
- No publiques datos personales ni información sensible.

## 11. Lista de comprobación

- [ ] Mi XML tiene un único elemento raíz llamado `<biblioteca>`.
- [ ] He incluido al menos diez libros.
- [ ] He utilizado como mínimo cuatro géneros diferentes.
- [ ] Todos los identificadores son únicos.
- [ ] Todos los libros contienen los elementos obligatorios.
- [ ] Algunos libros contienen `<saga>` y otros no.
- [ ] He utilizado correctamente `&amp;`.
- [ ] He comprobado el XML con `xmllint --noout`.
- [ ] He realizado y documentado las veinte consultas.
- [ ] He utilizado predicados, funciones y ejes.
- [ ] Las imágenes utilizan rutas relativas.
- [ ] He realizado varios commits con mensajes descriptivos.
- [ ] El enlace entregado abre directamente la carpeta de la actividad.
