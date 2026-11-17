# Unidad 5. XSLT: transformación de documentos XML

## 1. Finalidad de la unidad

Imagina que tienes el catálogo de videojuegos en XML y necesitas publicarlo como una página web. Quieres mostrar el título y el precio de cada juego, indicar cuáles están disponibles y ordenarlos por puntuación. Podrías escribir las fichas a mano, pero tendrías que revisarlas cada vez que cambie el catálogo. **Con XSLT describes una vez cómo construir la salida y ejecutas de nuevo la transformación cuando cambian los datos.**

La finalidad de esta unidad es aprender a **generar documentos a partir de datos XML de forma reproducible**. Al terminar, podrás:

1. Identificar el XML de entrada, la hoja XSLT, el procesador y el documento de salida.
2. Escribir una plantilla que genere HTML y usar XPath para insertar datos del catálogo.
3. Recorrer, filtrar y ordenar videojuegos, y mostrar contenido según una condición.
4. Ejecutar la transformación y comprobar que la salida coincide con los datos y las reglas.
5. Reconocer cuándo conviene generar HTML, otro XML o texto plano.

### 1.1. ¿Cuándo se usa XSLT?

Se usa cuando los datos de partida están en XML y deben presentarse o reorganizarse para otro uso.

| Situación | Salida que interesa | Ejemplo con el catálogo |
|---|---|---|
| Publicar datos para que una persona los consulte | HTML | Una página con las fichas de los videojuegos |
| Intercambiar datos con un programa que espera otra estructura | XML | Una selección con elementos `<juego>` y `<nota>` |
| Exportar datos a un formato sencillo de leer o procesar | Texto plano | Una línea por juego con su título y su precio |

La transformación puede ejecutarse en tu equipo para generar un archivo, como haremos con `xsltproc`, o como parte de un proceso automático de publicación o intercambio de datos. Del mismo catálogo puedes generar varias salidas usando hojas distintas. El archivo XML de origen conserva sus datos.

---

## 2. Qué es XSLT y cómo funciona

**XSLT** significa *Extensible Stylesheet Language Transformations*. Es un lenguaje de transformación escrito con sintaxis XML. En una hoja XSLT declaras qué construir y qué datos tomar de la entrada. Un procesador ejecuta esas reglas y crea el resultado. En esta unidad usamos **XSLT 1.0**.

`xsltproc` lee `catalogo-videojuegos.xml` y `catalogo-videojuegos.xsl` para generar `catalogo-videojuegos.html`.

| Concepto | Definición |
|---|---|
| Documento de origen | XML que aporta los datos. En esta unidad es el catálogo |
| Hoja de transformación | Archivo `.xsl` que contiene las reglas para producir el resultado |
| Procesador XSLT | Programa que lee la hoja y el XML y aplica las reglas. Usaremos `xsltproc` |
| Documento de salida | Resultado de la transformación. Puede ser HTML, XML o texto |
| Nodo | Parte del documento que XPath puede identificar, como el elemento `titulo` o el atributo `id` |
| Plantilla | Regla que contiene lo que debe generarse para los nodos que coincidan con su patrón `match` |
| Nodo de contexto | Nodo desde el que se evalúa una expresión XPath. Si el contexto es un `videojuego`, la expresión `titulo` selecciona el título de ese juego |

### 2.1. Qué papel tiene cada lenguaje

| Lenguaje | Pregunta que responde | Ejemplo |
|---|---|---|
| XML | ¿Qué datos tenemos? | El título y la puntuación de Hollow Knight |
| XPath | ¿Qué datos seleccionamos? | `/catalogo/videojuego[puntuacion >= 8]` selecciona los juegos con nota de 8 o más |
| XSLT | ¿Cómo construimos la salida con esos datos? | Genera una fila por cada juego seleccionado |
| HTML | ¿Cómo se estructura la página resultante? | Una tabla con filas y celdas |
| CSS | ¿Qué aspecto tiene la página? | Color de los encabezados y espaciado de las celdas |

### 2.2. Cómo leer las instrucciones

En los apuntes llamaremos **instrucciones** a elementos como `xsl:value-of` o `xsl:for-each`. Están escritos como etiquetas XML. En una plantilla que genera HTML verás también etiquetas como `<p>` y `<h2>`, que indican qué elementos crear en la salida. La hoja completa debe respetar las reglas de XML, incluidas las comillas en los atributos y el cierre de las etiquetas.

| Si quieres… | Escribes… | En qué debes fijarte |
|---|---|---|
| Definir una regla para determinados nodos | `xsl:template` | `match` indica con qué nodos coincide la plantilla. `/` coincide con el nodo documento |
| Mostrar un dato | `xsl:value-of` | `select` contiene el XPath que obtiene el dato |
| Repetir un bloque por cada nodo seleccionado | `xsl:for-each` | `select` indica qué nodos se recorren |
| Ordenar los nodos antes de generar su salida | `xsl:sort` | `select` indica el dato por el que se ordena |
| Generar un bloque si se cumple una condición | `xsl:if` | `test` contiene la condición |
| Elegir entre varias salidas | `xsl:choose` | Cada `xsl:when` lleva un `test`. `xsl:otherwise` recoge el caso restante |
| Dejar que otra plantilla procese los nodos seleccionados | `xsl:apply-templates` | `select` elige los nodos. El `match` de cada plantilla indica a cuáles puede aplicarse |

### 2.3. Sigue una transformación pequeña

Supón que dentro de la plantilla inicial escribes este fragmento.

```xml
<p><xsl:value-of select="/catalogo/videojuego[1]/titulo"/></p>
```

1. El procesador encuentra `<p>` y crea un párrafo en la salida.
2. La instrucción `xsl:value-of` evalúa el XPath de `select`. La ruta empieza en el documento, entra en `catalogo`, toma el primer `videojuego` y selecciona su `titulo`.
3. El procesador escribe el valor de ese título dentro del párrafo. El resultado es `<p>Hollow Knight</p>`.

Si el título cambia en el XML, al ejecutar de nuevo la misma hoja aparecerá el nuevo título. Si quieres mostrar una fila o un párrafo por cada juego, necesitarás recorrer los nodos, como verás en el apartado 8.

---

## 3. Documento XML de partida

Guarda el archivo como `catalogo-videojuegos.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo actualizado="2026-11-06">
  <videojuego id="V001" disponible="true">
    <titulo>Hollow Knight</titulo>
    <desarrolladora pais="Australia">Team Cherry</desarrolladora>
    <generos>
      <genero>Metroidvania</genero>
      <genero>Acción</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>Switch</plataforma>
    </plataformas>
    <precio moneda="EUR">14.99</precio>
    <puntuacion>9.2</puntuacion>
  </videojuego>

  <videojuego id="V002" disponible="true">
    <titulo>League of Legends</titulo>
    <desarrolladora pais="Estados Unidos">Riot Games</desarrolladora>
    <generos>
      <genero>MOBA</genero>
      <genero>Estrategia</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
    </plataformas>
    <precio moneda="EUR">0</precio>
    <puntuacion>8.1</puntuacion>
  </videojuego>

  <videojuego id="V003" disponible="false">
    <titulo>Marvel's Spider-Man 2</titulo>
    <desarrolladora pais="Estados Unidos">Insomniac Games</desarrolladora>
    <generos>
      <genero>Acción</genero>
      <genero>Aventura</genero>
    </generos>
    <plataformas>
      <plataforma>PS5</plataforma>
      <plataforma>PC</plataforma>
    </plataformas>
    <precio moneda="EUR">59.99</precio>
    <puntuacion>8.8</puntuacion>
  </videojuego>

  <videojuego id="V004" disponible="true">
    <titulo>EA Sports FC 27</titulo>
    <desarrolladora pais="Canadá">EA Sports</desarrolladora>
    <generos>
      <genero>Deportes</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>PS5</plataforma>
      <plataforma>Xbox Series</plataforma>
    </plataformas>
    <precio moneda="EUR">79.99</precio>
    <puntuacion>7.4</puntuacion>
  </videojuego>

  <videojuego id="V005" disponible="true">
    <titulo>Jujutsu Kaisen Cursed Clash</titulo>
    <desarrolladora pais="Japón">Byking</desarrolladora>
    <generos>
      <genero>Lucha</genero>
      <genero>Anime</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>PS5</plataforma>
      <plataforma>Switch</plataforma>
    </plataformas>
    <precio moneda="EUR">49.99</precio>
    <puntuacion>6.2</puntuacion>
    <observaciones>Basado en el manga y el anime.</observaciones>
  </videojuego>
</catalogo>
```

Comprueba que está bien formado:

```bash
xmllint --noout catalogo-videojuegos.xml
```

---

## 3.1. HTML y CSS desde cero

En esta unidad vamos a generar una página que muestra los videojuegos del catálogo. **HTML** define la estructura de la página (encabezados, párrafos, listas y tablas). **CSS** define su aspecto (colores, bordes y espaciado). **XSLT** construye el HTML a partir de los datos del XML.

### Abre tu primera página HTML

Crea un archivo llamado `prueba.html` en VS Code, copia este código y guarda el archivo. Ábrelo con el navegador haciendo doble clic. Cuando cambies algo, guarda y recarga la página.

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>Catálogo de videojuegos</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background: #f1f5f9;
      }

      .videojuego {
        background: white;
        padding: 16px;
        margin-bottom: 12px;
        border: 1px solid #cbd5e1;
        border-radius: 8px;
      }

      .disponible {
        color: #166534;
      }
    </style>
  </head>
  <body>
    <h1>Catálogo de videojuegos</h1>
    <article class="videojuego">
      <h2>Hollow Knight</h2>
      <p><strong>Desarrolladora:</strong> Team Cherry</p>
      <p>Estado: <span class="disponible">Disponible</span></p>
      <h3>Plataformas</h3>
      <ul>
        <li>PC</li>
        <li>Switch</li>
      </ul>
    </article>
  </body>
</html>
```

Un elemento como `<h2>Hollow Knight</h2>` tiene una etiqueta de apertura (`<h2>`), contenido y una etiqueta de cierre (`</h2>`). Como en XML, puedes colocar un elemento dentro de otro. Los atributos se escriben en la etiqueta de apertura. Por ejemplo, `lang="es"` indica el idioma de la página y `class="videojuego"` identifica el artículo para poder darle estilo. Puedes usar la misma clase en varias tarjetas.

| Código | Qué hace en la página |
|---|---|
| `<!DOCTYPE html>` | Indica al navegador que interprete el archivo como HTML moderno |
| `<html>` | Contiene toda la página |
| `<head>` | Agrupa la configuración y los estilos |
| `<meta charset="UTF-8">` | Indica la codificación que permite leer correctamente las tildes y otros caracteres |
| `<title>` | Define el nombre que aparece en la pestaña |
| `<style>` | Contiene reglas CSS para la página |
| `<body>` | Contiene lo que se muestra en la página |
| `<h1>`, `<h2>`, `<h3>` | Definen el encabezado principal, el de cada ficha y el de una subsección |
| `<p>` y `<strong>` | Crean un párrafo y marcan texto importante, que suele verse en negrita |
| `<article>` y `<span>` | Agrupan una ficha completa y un fragmento de texto dentro de una línea, respectivamente |
| `<ul>` y `<li>` | Crean una lista con viñetas y cada elemento de esa lista |

### Lee y modifica una regla CSS

En `.disponible { color: #166534; }`, `.disponible` es el **selector**. Selecciona los elementos con `class="disponible"`. Dentro de las llaves va la declaración, con una **propiedad** (`color`), dos puntos y un **valor** (`#166534`, un código de color). El punto y coma cierra la declaración. Un selector sin punto, como `body`, selecciona elementos por su etiqueta.

| Propiedad | Qué controla |
|---|---|
| `color` y `background` | Color del texto y fondo |
| `font-family` | Tipo de letra. Si Arial no está disponible, el navegador usa una fuente sin remates |
| `padding` | Espacio interior entre el contenido y el borde |
| `margin-bottom` | Espacio exterior debajo del elemento |
| `border` | Borde. `1px solid #cbd5e1` indica grosor, línea continua y color |
| `border-radius` | Redondeo de las esquinas |

Prueba a cambiar `color: #166534;` por `color: #1d4ed8;` y `padding: 16px;` por `padding: 24px;`. Al recargar, «Disponible» aparecerá en azul y habrá más espacio dentro de la tarjeta. La unidad `px` expresa una medida en píxeles CSS.

### Del HTML escrito a mano al HTML generado

En tu archivo de prueba has escrito `<h2>Hollow Knight</h2>` a mano. Dentro de una plantilla XSLT cuyo nodo actual sea el primer `videojuego`, puedes escribir lo siguiente para leer el título del XML.

```xml
<h2><xsl:value-of select="titulo"/></h2>
```

El procesador copia el elemento `h2` al HTML e inserta el valor de `titulo` dentro. El navegador recibe `<h2>Hollow Knight</h2>`. En la hoja XSLT, escribe `<meta charset="UTF-8"/>` con la barra final porque la hoja sigue las reglas de XML.

---

## 4. Primera hoja XSLT

Crea `catalogo-videojuegos.xsl`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <title>Catálogo de videojuegos</title>
      </head>
      <body>
        <h1>Catálogo de videojuegos</h1>
        <p>Primera transformación con XSLT.</p>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
```

### Elemento raíz

`xsl:stylesheet` es el elemento raíz. El atributo `version` indica la versión y `xmlns:xsl` declara el espacio de nombres de XSLT:

```text
http://www.w3.org/1999/XSL/Transform
```

El prefijo `xsl:` identifica las instrucciones que debe interpretar el procesador.

### Formato de salida

```xml
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
```

El resultado será HTML, usará UTF-8 y se intentará indentar. `method` también puede valer `xml` o `text`.

### Plantilla principal

```xml
<xsl:template match="/">
  ...
</xsl:template>
```

El patrón `match="/"` aplica esta plantilla al nodo documento, que contiene el elemento raíz `<catalogo>`. Al ejecutar esta primera hoja, verás un título y un párrafo con texto fijo. En el apartado 7 insertarás valores del XML mediante `xsl:value-of`.

---

## 5. Asociar XML y XSLT

Añade al XML, después de su declaración:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="catalogo-videojuegos.xsl"?>
<catalogo actualizado="2026-11-06">
```

Los dos archivos deben estar en la misma carpeta:

```text
sesion-xslt/
├── catalogo-videojuegos.xml
└── catalogo-videojuegos.xsl
```

---

## 6. Ejecutar la transformación

```bash
xsltproc catalogo-videojuegos.xsl catalogo-videojuegos.xml
```

Para guardar el resultado:

```bash
xsltproc -o catalogo-videojuegos.html catalogo-videojuegos.xsl catalogo-videojuegos.xml
```

El orden es:

```text
xsltproc hoja.xsl datos.xml
```

---

## 7. Mostrar valores con `xsl:value-of`

`xsl:value-of` obtiene el valor del primer nodo seleccionado.

```xml
<p>
  Última actualización:
  <xsl:value-of select="/catalogo/@actualizado"/>
</p>
```

Primer título:

```xml
<p>
  Primer videojuego:
  <xsl:value-of select="/catalogo/videojuego[1]/titulo"/>
</p>
```

Resultado: `Primer videojuego: Hollow Knight`.

El atributo `select` contiene una expresión XPath:

```xml
<xsl:value-of select="expresión XPath"/>
```

---

## 8. Recorrer nodos con `xsl:for-each`

`xsl:for-each` repite un bloque por cada nodo seleccionado:

```xml
<ul>
  <xsl:for-each select="/catalogo/videojuego">
    <li><xsl:value-of select="titulo"/></li>
  </xsl:for-each>
</ul>
```

Dentro del bucle, el nodo actual es un `videojuego`. Por eso usamos `titulo` en vez de repetir la ruta completa. Este nodo actual se denomina **nodo de contexto**.

También podemos seleccionar sus atributos:

```xml
<xsl:value-of select="@id"/>
```

---

## 9. Generar una tabla HTML

Una tabla presenta datos en filas y columnas. En el catálogo, cada fila del cuerpo representa un videojuego.

| Etiqueta | Función |
|---|---|
| `<table>` | Contiene la tabla completa |
| `<thead>` | Agrupa las filas de encabezado |
| `<tbody>` | Agrupa las filas de datos |
| `<tr>` | Crea una fila |
| `<th>` | Crea una celda de encabezado |
| `<td>` | Crea una celda de datos |

La fila de encabezados se escribe una vez en `thead`. El recorrido de XSLT va dentro de `tbody` y genera un `tr` con sus celdas por cada videojuego.

```xml
<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Título</th>
      <th>Desarrolladora</th>
      <th>Precio</th>
      <th>Puntuación</th>
    </tr>
  </thead>
  <tbody>
    <xsl:for-each select="/catalogo/videojuego">
      <tr>
        <td><xsl:value-of select="@id"/></td>
        <td><xsl:value-of select="titulo"/></td>
        <td><xsl:value-of select="desarrolladora"/></td>
        <td>
          <xsl:value-of select="precio"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="precio/@moneda"/>
        </td>
        <td><xsl:value-of select="puntuacion"/></td>
      </tr>
    </xsl:for-each>
  </tbody>
</table>
```

`xsl:text` inserta texto literal de manera controlada.

---

## 10. Filtrar información con XPath

### Videojuegos disponibles

```xml
<xsl:for-each select="/catalogo/videojuego[@disponible='true']">
  <p><xsl:value-of select="titulo"/></p>
</xsl:for-each>
```

### Puntuación mínima de 8

```xml
<xsl:for-each select="/catalogo/videojuego[puntuacion >= 8]">
  <p>
    <xsl:value-of select="titulo"/>
    —
    <xsl:value-of select="puntuacion"/>
  </p>
</xsl:for-each>
```

### Género Acción

```xml
<xsl:for-each select="/catalogo/videojuego[generos/genero='Acción']">
  <p><xsl:value-of select="titulo"/></p>
</xsl:for-each>
```

### Disponibles en Switch

```xml
<xsl:for-each
  select="/catalogo/videojuego[plataformas/plataforma='Switch']">
  <p><xsl:value-of select="titulo"/></p>
</xsl:for-each>
```

---

## 11. Ordenar con `xsl:sort`

`xsl:sort` debe aparecer al principio del recorrido.

### Orden alfabético

```xml
<xsl:for-each select="/catalogo/videojuego">
  <xsl:sort select="titulo" order="ascending" data-type="text"/>
  <p><xsl:value-of select="titulo"/></p>
</xsl:for-each>
```

### Orden descendente por puntuación

```xml
<xsl:for-each select="/catalogo/videojuego">
  <xsl:sort
    select="puntuacion"
    order="descending"
    data-type="number"/>
  <p>
    <xsl:value-of select="titulo"/>
    —
    <xsl:value-of select="puntuacion"/>
  </p>
</xsl:for-each>
```

| Atributo | Función | Valores habituales |
|---|---|---|
| `select` | Dato usado para ordenar | Expresión XPath |
| `order` | Dirección | `ascending`, `descending` |
| `data-type` | Tipo de comparación | `text`, `number` |

---

## 12. Condiciones con `xsl:if`

`xsl:if` genera contenido si la condición es verdadera:

```xml
<xsl:if test="@disponible='true'">
  <span>Disponible</span>
</xsl:if>
```

Mostrar las observaciones solo cuando existan:

```xml
<xsl:if test="observaciones">
  <p>
    <strong>Observaciones:</strong>
    <xsl:value-of select="observaciones"/>
  </p>
</xsl:if>
```

`xsl:if` no tiene una rama `else`.

---

## 13. Alternativas con `xsl:choose`

```xml
<xsl:choose>
  <xsl:when test="@disponible='true'">
    <span class="disponible">Disponible</span>
  </xsl:when>
  <xsl:otherwise>
    <span class="no-disponible">No disponible</span>
  </xsl:otherwise>
</xsl:choose>
```

- `xsl:choose` agrupa las alternativas.
- `xsl:when` define una condición.
- `xsl:otherwise` se utiliza si ninguna condición anterior se cumple.

Varias categorías:

```xml
<xsl:choose>
  <xsl:when test="puntuacion >= 9">Excelente</xsl:when>
  <xsl:when test="puntuacion >= 8">Muy recomendable</xsl:when>
  <xsl:when test="puntuacion >= 7">Recomendable</xsl:when>
  <xsl:otherwise>Mejorable</xsl:otherwise>
</xsl:choose>
```

Solo se ejecuta la primera alternativa verdadera.

---

## 14. Recorrer colecciones anidadas

### Géneros

```xml
<ul>
  <xsl:for-each select="generos/genero">
    <li><xsl:value-of select="."/></li>
  </xsl:for-each>
</ul>
```

### Plataformas

```xml
<ul>
  <xsl:for-each select="plataformas/plataforma">
    <li><xsl:value-of select="."/></li>
  </xsl:for-each>
</ul>
```

El punto `.` representa el nodo de contexto actual.

---

## 15. Contar nodos

La función XPath `count()` devuelve el número de nodos seleccionados:

```xml
<p>
  Número de videojuegos:
  <xsl:value-of select="count(/catalogo/videojuego)"/>
</p>
```

```xml
<xsl:value-of
  select="count(/catalogo/videojuego[@disponible='true'])"/>
```

En este catálogo hay:

- 5 videojuegos.
- 4 disponibles.
- 3 con puntuación igual o superior a 8.

---

## 16. Plantillas y `xsl:apply-templates`

`xsl:for-each` es directo para ejemplos sencillos. Sin embargo, XSLT está diseñado para organizar el trabajo mediante plantillas.

### Plantilla principal

`<section>` agrupa contenido relacionado, como todas las fichas del catálogo. Cada ficha usa su propio `<article>` y tiene un encabezado `<h2>`.

```xml
<xsl:template match="/">
  <html lang="es">
    <body>
      <h1>Catálogo de videojuegos</h1>
      <section class="catalogo">
        <xsl:apply-templates select="catalogo/videojuego"/>
      </section>
    </body>
  </html>
</xsl:template>
```

### Plantilla para cada videojuego

```xml
<xsl:template match="videojuego">
  <article class="videojuego">
    <h2><xsl:value-of select="titulo"/></h2>
    <p>
      <strong>Desarrolladora:</strong>
      <xsl:value-of select="desarrolladora"/>
    </p>
    <p>
      <strong>Puntuación:</strong>
      <xsl:value-of select="puntuacion"/>
    </p>
  </article>
</xsl:template>
```

`xsl:apply-templates` pide al procesador que busque una plantilla adecuada para cada nodo seleccionado.

| `xsl:for-each` | `xsl:apply-templates` |
|---|---|
| Escribe el recorrido en un bloque | Distribuye el trabajo entre plantillas |
| Adecuado para ejemplos sencillos | Facilita transformaciones grandes |
| Cambia el contexto en cada vuelta | Busca una plantilla cuyo `match` coincida |

---

## 17. Variables

```xml
<xsl:variable
  name="total"
  select="count(/catalogo/videojuego)"/>

<p>
  Total:
  <xsl:value-of select="$total"/>
</p>
```

Las variables se consultan anteponiendo `$`. En XSLT 1.0 no se modifica su valor después de asignarlo.

---

## 18. Atributos dinámicos

```xml
<article>
  <xsl:attribute name="data-id">
    <xsl:value-of select="@id"/>
  </xsl:attribute>
  <h2><xsl:value-of select="titulo"/></h2>
</article>
```

También puede utilizarse una **plantilla de valor de atributo**:

```xml
<article data-id="{@id}">
  <h2><xsl:value-of select="titulo"/></h2>
</article>
```

El contenido entre llaves se evalúa como XPath.

---

## 19. Hoja XSLT completa

El elemento `<header>` agrupa el título y la fecha de la página. `<main>` contiene la información principal, con una sección para el resumen y otra para las fichas. La etiqueta `meta` con `name="viewport"` ayuda a ajustar la página al ancho de la pantalla del móvil. Cada ficha lleva un atributo `data-id` que conserva su identificador del XML en el HTML generado.

Lee el CSS del ejemplo con estas equivalencias.

| Código | Efecto en el catálogo |
|---|---|
| `.resumen, .videojuego` | Aplica las mismas declaraciones al resumen y a cada ficha |
| `.videojuego h2` y `.etiquetas li` | Seleccionan los encabezados dentro de una ficha y los elementos de las listas con clase `etiquetas`, respectivamente |
| `text-align: center` | Centra el texto de la cabecera |
| `width: min(1100px, 92%)` | Usa el menor ancho entre 1100 píxeles y el 92 % del espacio disponible |
| `margin: 2rem auto` | Da espacio exterior arriba y abajo y centra el bloque horizontalmente |
| `border-left` | Añade un borde solo a la izquierda del resumen |
| `display: grid` y `grid-template-columns` | Colocan las fichas en columnas que se ajustan al ancho disponible |
| `display: flex` y `flex-wrap: wrap` | Colocan las plataformas y géneros en línea y permiten que salten a otra fila si hace falta |
| `gap` y `list-style: none` | Dejan espacio entre fichas o etiquetas y eliminan las viñetas de las listas, respectivamente |

La unidad `rem` toma como referencia el tamaño de letra del elemento raíz de la página. Para personalizar el resultado, puedes empezar por cambiar el color de un título, el fondo de las tarjetas o el espacio interior de una ficha.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Catálogo de videojuegos</title>
        <style>
          body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #f5f5f5;
            background: #111827;
          }
          header {
            padding: 2rem;
            text-align: center;
            background: #1f2937;
          }
          main {
            width: min(1100px, 92%);
            margin: 2rem auto;
          }
          .resumen, .videojuego {
            padding: 1rem;
            background: #1f2937;
          }
          .resumen {
            margin-bottom: 1.5rem;
            border-left: 4px solid #8b5cf6;
          }
          .catalogo {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 1rem;
          }
          .videojuego {
            border: 1px solid #374151;
            border-radius: 12px;
          }
          .videojuego h2 { color: #c4b5fd; }
          .disponible { color: #86efac; }
          .no-disponible { color: #fca5a5; }
          .etiquetas {
            display: flex;
            flex-wrap: wrap;
            gap: .4rem;
            padding: 0;
            list-style: none;
          }
          .etiquetas li {
            padding: .25rem .55rem;
            border-radius: 999px;
            background: #374151;
          }
        </style>
      </head>
      <body>
        <header>
          <h1>Catálogo de videojuegos</h1>
          <p>
            Actualizado:
            <xsl:value-of select="/catalogo/@actualizado"/>
          </p>
        </header>

        <main>
          <section class="resumen">
            <p>
              Total:
              <xsl:value-of select="count(/catalogo/videojuego)"/>
            </p>
            <p>
              Disponibles:
              <xsl:value-of
                select="count(/catalogo/videojuego[@disponible='true'])"/>
            </p>
          </section>

          <section class="catalogo">
            <xsl:apply-templates select="/catalogo/videojuego">
              <xsl:sort
                select="puntuacion"
                data-type="number"
                order="descending"/>
            </xsl:apply-templates>
          </section>
        </main>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="videojuego">
    <article class="videojuego" data-id="{@id}">
      <h2><xsl:value-of select="titulo"/></h2>

      <p>
        <strong>Desarrolladora:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="desarrolladora"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="desarrolladora/@pais"/>
        <xsl:text>)</xsl:text>
      </p>

      <p>
        <strong>Precio:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="precio"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="precio/@moneda"/>
      </p>

      <p>
        <strong>Puntuación:</strong>
        <xsl:text> </xsl:text>
        <xsl:value-of select="puntuacion"/>
      </p>

      <p>
        <strong>Estado:</strong>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <xsl:when test="@disponible='true'">
            <span class="disponible">Disponible</span>
          </xsl:when>
          <xsl:otherwise>
            <span class="no-disponible">No disponible</span>
          </xsl:otherwise>
        </xsl:choose>
      </p>

      <h3>Géneros</h3>
      <ul class="etiquetas">
        <xsl:for-each select="generos/genero">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>

      <h3>Plataformas</h3>
      <ul class="etiquetas">
        <xsl:for-each select="plataformas/plataforma">
          <li><xsl:value-of select="."/></li>
        </xsl:for-each>
      </ul>

      <xsl:if test="observaciones">
        <p>
          <strong>Observaciones:</strong>
          <xsl:text> </xsl:text>
          <xsl:value-of select="observaciones"/>
        </p>
      </xsl:if>
    </article>
  </xsl:template>

</xsl:stylesheet>
```

Ejecuta:

```bash
xsltproc -o catalogo-videojuegos.html catalogo-videojuegos.xsl catalogo-videojuegos.xml
```

---

## 20. Transformar XML en otro XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <seleccion>
      <xsl:for-each select="/catalogo/videojuego[puntuacion >= 8]">
        <juego id="{@id}">
          <nombre><xsl:value-of select="titulo"/></nombre>
          <nota><xsl:value-of select="puntuacion"/></nota>
        </juego>
      </xsl:for-each>
    </seleccion>
  </xsl:template>

</xsl:stylesheet>
```

El resultado contendrá `V001`, `V002` y `V003`, pues tienen una puntuación igual o superior a 8.

---

## 21. Generar texto plano

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:text>CATÁLOGO DE VIDEOJUEGOS&#10;</xsl:text>
    <xsl:for-each select="/catalogo/videojuego">
      <xsl:value-of select="titulo"/>
      <xsl:text> | </xsl:text>
      <xsl:value-of select="precio"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="precio/@moneda"/>
      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
```

`&#10;` representa un salto de línea.

---

## 22. Caracteres reservados en XPath

Como XSLT está escrito en XML, el signo `<` debe escaparse cuando aparece dentro de un atributo.

| Expresión XPath | En un atributo XSLT |
|---|---|
| `precio < 50` | `precio &lt; 50` |
| `precio <= 50` | `precio &lt;= 50` |
| `puntuacion > 8` | `puntuacion &gt; 8` o `puntuacion > 8` |
| `puntuacion >= 8` | `puntuacion &gt;= 8` o `puntuacion >= 8` |

Ejemplo:

```xml
<xsl:for-each select="/catalogo/videojuego[precio &lt; 50]">
  ...
</xsl:for-each>
```

---

## 23. Errores frecuentes

### Olvidar el espacio de nombres

```xml
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
```

### Confundir `match` y `select`

- `match` indica cuándo se aplica una plantilla.
- `select` elige nodos o valores.

### Usar rutas absolutas innecesarias

Dentro de una plantilla que coincide con `videojuego`:

```xml
<xsl:value-of select="titulo"/>
```

### Pensar que `xsl:value-of` recorre todos los nodos

En XSLT 1.0 muestra el valor del primer nodo seleccionado. Para procesarlos todos se utiliza `xsl:for-each` o `xsl:apply-templates`.

### Colocar `xsl:sort` después del contenido

Debe ser la primera instrucción del recorrido.

### Utilizar `==`

XPath utiliza un único signo igual:

```xpath
@disponible='true'
```

### No escapar `<`

```xml
<xsl:if test="precio &lt; 50">
```

### No obtener la transformación al abrir el XML

Comprueba la ruta de `xml-stylesheet`, los nombres de archivo, la sintaxis de ambos documentos y prueba a generar el HTML con `xsltproc`.

---

## 24. Comprobación y depuración

```bash
xmllint --noout catalogo-videojuegos.xml
xmllint --noout catalogo-videojuegos.xsl
xsltproc -o catalogo-videojuegos.html catalogo-videojuegos.xsl catalogo-videojuegos.xml
```

Para abrir un servidor local:

```bash
python3 -m http.server 8000
```

Después visita `http://localhost:8000`.

---

## 25. Resumen de instrucciones

| Instrucción | Finalidad |
|---|---|
| `xsl:stylesheet` | Elemento raíz de la hoja |
| `xsl:output` | Define el formato de salida |
| `xsl:template` | Declara una plantilla |
| `xsl:value-of` | Obtiene el valor de un nodo |
| `xsl:text` | Inserta texto literal |
| `xsl:for-each` | Recorre nodos |
| `xsl:sort` | Ordena nodos |
| `xsl:if` | Aplica una condición simple |
| `xsl:choose` | Agrupa alternativas |
| `xsl:when` | Define una alternativa condicionada |
| `xsl:otherwise` | Define la alternativa final |
| `xsl:apply-templates` | Aplica plantillas a nodos |
| `xsl:variable` | Guarda un valor reutilizable |
| `xsl:attribute` | Genera un atributo |

---

## 26. Resumen final

- XML contiene los datos.
- XPath selecciona los datos.
- XSLT transforma los datos.
- Las hojas XSLT deben ser XML bien formado.
- `match` decide cuándo se aplica una plantilla.
- `select` elige nodos o valores.
- `xsl:value-of` muestra un valor.
- `xsl:for-each` recorre nodos.
- `xsl:sort` los ordena.
- `xsl:if` y `xsl:choose` permiten tomar decisiones.
- `xsl:apply-templates` organiza transformaciones grandes.
- XSLT puede generar HTML, XML o texto.
