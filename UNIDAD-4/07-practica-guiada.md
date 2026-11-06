# 7. Práctica guiada: exploramos un catálogo con XPath

## Objetivo

Practicar XPath paso a paso y documentar cada consulta en Markdown.

## Preparación

1. Crea una carpeta llamada `unidad-04/practica-guiada-xpath/`.
2. Copia el XML de referencia como `catalogo-videojuegos.xml`.
3. Crea un archivo `README.md`.
4. Abre la terminal de VS Code.
5. Comprueba el XML:

```bash
xmllint --noout catalogo-videojuegos.xml
```

## Parte 1. Selecciones básicas

### Consulta 1. Elemento raíz

```bash
xmllint --xpath '/catalogo' catalogo-videojuegos.xml
```

Documenta:

- Qué selecciona `/`.
- Por qué `catalogo` es el elemento raíz.

### Consulta 2. Todos los títulos

```bash
xmllint --xpath '/catalogo/videojuego/titulo' catalogo-videojuegos.xml
```

Explica cada paso de la ruta.

### Consulta 3. Todos los identificadores

```bash
xmllint --xpath '//videojuego/@id' catalogo-videojuegos.xml
```

Explica por qué se utiliza `@`.

## Parte 2. Filtros

### Consulta 4. Juegos disponibles

```bash
xmllint --xpath "//videojuego[@disponible='true']/titulo" catalogo-videojuegos.xml
```

Si tu terminal interpreta de forma distinta las comillas, utiliza comillas simples para la expresión y dobles para el valor:

```bash
xmllint --xpath '//videojuego[@disponible="true"]/titulo' catalogo-videojuegos.xml
```

### Consulta 5. Juegos gratuitos

Escribe y prueba una expresión que seleccione sus títulos.

Resultado esperado: `League of Legends`.

### Consulta 6. Juegos para Switch

Escribe una consulta que filtre por el elemento repetido `plataforma`.

### Consulta 7. Precio intermedio

Selecciona juegos disponibles cuyo precio sea mayor que 10 y menor que 60.

## Parte 3. Posiciones y funciones

### Consulta 8. Primer y último registro

Prueba:

```xpath
/catalogo/videojuego[1]/titulo
/catalogo/videojuego[last()]/titulo
```

### Consulta 9. Contar registros

```xpath
count(/catalogo/videojuego)
```

### Consulta 10. Puntuación media

Construye la operación utilizando `sum()`, `count()` y `div`.

### Consulta 11. Buscar texto

Selecciona los juegos cuyo título contenga `Jujutsu`.

## Parte 4. Ejes

### Consulta 12. Del precio al título

Parte de los precios superiores a 50, sube al `videojuego` y selecciona su `titulo`:

```xpath
//precio[. > 50]/parent::videojuego/titulo
```

### Consulta 13. De la plataforma al videojuego

Desde una plataforma `Switch`, utiliza `ancestor::videojuego` para obtener su título.

### Consulta 14. Hermanos

Desde cada `titulo`, selecciona el hermano `precio` mediante `following-sibling`.

## Parte 5. Modificación y predicción

Añade un sexto videojuego inventado con:

- Identificador único.
- Dos géneros.
- Al menos dos plataformas.
- Precio y moneda.
- Puntuación.
- Elemento opcional `observaciones`.

Antes de ejecutar las consultas, predice cómo cambiarán:

- `count(//videojuego)`.
- `count(//plataforma)`.
- La suma de precios.
- El último título.

Comprueba después tus predicciones.

## Entrega en el README

Para cada consulta incluye:

````markdown
### Consulta 1. Título

**Objetivo:** explicación breve.

**XPath:**

```xpath
/ruta/de/ejemplo
```

**Resultado:** descripción del resultado.

![Evidencia](img/consulta-01.png)
````

> No es necesario capturar todas las consultas. Realiza capturas de las consultas 4, 10, 12 y 14.

## Preguntas finales

1. ¿Qué diferencia existe entre `/` y `//`?
2. ¿Qué diferencia hay entre seleccionar `titulo` y `titulo/text()`?
3. ¿Por qué las posiciones comienzan en 1?
4. ¿Qué diferencia hay entre `following` y `following-sibling`?
5. ¿Qué consulta te resultó más difícil y cómo la resolviste?
