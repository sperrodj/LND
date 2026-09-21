# Bloque 3. Clasificación y lenguajes principales

## 1. Clasificar según la finalidad

Un mismo documento puede combinar varias finalidades, pero esta clasificación ayuda a entender qué problema intenta resolver cada lenguaje.

### 1.1. Marcas de presentación

Indican principalmente cómo debe mostrarse el contenido. Históricamente fueron frecuentes en sistemas de edición y documentos tempranos.

El inconveniente de mezclar presentación y contenido es que cualquier rediseño obliga a modificar numerosos documentos. En la web moderna, la presentación se delega principalmente en CSS.

Ejemplo conceptual de marca orientada a presentación:

```text
[centrar][grande]Título[/grande][/centrar]
```

Describe cómo debe verse el texto, pero no explica que desempeña la función de título.

### 1.2. Marcas procedimentales

Incluyen instrucciones para que un procesador realice acciones de composición o tratamiento. Se centran más en el procedimiento que en el significado del contenido.

Un sistema de composición podría recibir instrucciones equivalentes a “deja un margen”, “cambia de página” o “usa este tipo de letra”. El resultado depende del procesador que ejecute esas órdenes.

### 1.3. Marcas descriptivas o semánticas

Describen qué función cumple cada parte:

```html
<article>
  <h2>Nueva versión disponible</h2>
  <p>La aplicación incorpora mejoras de accesibilidad.</p>
</article>
```

Las marcas `article`, `h2` y `p` expresan significado estructural. La apariencia se decide por separado.

La clasificación no siempre es absoluta. Un lenguaje puede incluir construcciones de varios tipos, pero normalmente existe una finalidad predominante.

## 2. Lenguajes de propósito específico y general

### Propósito específico

Están diseñados para un ámbito o tarea concreta:

- HTML describe documentos y aplicaciones web.
- SVG representa gráficos vectoriales.
- MathML representa expresiones matemáticas.
- RSS y Atom publican contenidos sindicados.

### Propósito general

Permiten definir vocabularios para diferentes ámbitos. XML es el ejemplo principal: con sus reglas pueden representarse facturas, configuraciones, catálogos o mensajes entre sistemas.

> [!NOTE]
> XML no trae un vocabulario universal para “producto” o “factura”. Proporciona la sintaxis con la que una comunidad puede definirlo.

### Lenguaje extensible

Un lenguaje es **extensible** cuando permite ampliar o definir vocabularios para nuevas necesidades. XML es extensible porque permite crear nombres de elementos adaptados al dominio:

```xml
<videojuego>
  <titulo>Hollow Knight</titulo>
  <genero>Metroidvania</genero>
</videojuego>
```

HTML no funciona de la misma forma: dispone de un vocabulario estándar que los navegadores conocen.

## 3. Lenguajes relevantes para DAW

### 3.1. HTML

**HTML** describe la estructura y la semántica del contenido web. El navegador interpreta sus elementos para construir la página.

```html
<nav aria-label="Navegación principal">
  <a href="/productos">Productos</a>
</nav>
```

HTML es imprescindible en DAW porque es la base documental de la interfaz web.

### 3.2. XML

**XML** permite crear vocabularios estructurados y extensibles. Sigue presente en intercambio empresarial, servicios, configuración, formatos ofimáticos y herramientas de construcción.

```xml
<pedido id="P-1042">
  <cliente>Alex</cliente>
  <total moneda="EUR">54.90</total>
</pedido>
```

### 3.3. SVG

**SVG** es un vocabulario basado en XML para gráficos vectoriales. Al ser vectorial, puede escalar sin perder calidad y puede integrarse en HTML.

```html
<svg viewBox="0 0 100 100" role="img" aria-label="Círculo azul">
  <circle cx="50" cy="50" r="40" fill="royalblue" />
</svg>
```

### 3.4. RSS y Atom

Son formatos basados en XML para la **sindicación de contenidos**. Permiten que una aplicación se suscriba a las novedades de blogs, medios o pódcast sin visitar manualmente cada sitio.

### 3.5. Markdown

Markdown utiliza una sintaxis ligera para escribir documentación y contenido que después puede transformarse a HTML u otros formatos.

```markdown
## Instalación

Ejecuta `npm install` y consulta la [documentación](https://example.com).
```

Es especialmente útil en archivos `README.md`, incidencias, wikis y documentación de proyectos.

### 3.6. MathML

**MathML** es un lenguaje de marcas orientado a expresar notación matemática y su significado estructural.

```html
<math>
  <msup><mi>x</mi><mn>2</mn></msup>
</math>
```

El ejemplo representa $x^2$. Su utilidad no consiste únicamente en dibujar la fórmula, sino en conservar una estructura que pueda ser interpretada por diferentes herramientas.

### 3.7. XHTML

**XHTML** reformuló HTML utilizando las reglas estrictas de XML. Fue relevante en la evolución de la web y ayuda a entender la relación histórica entre ambas tecnologías. Sin embargo, el HTML utilizado habitualmente en la web actual es HTML5 procesado como HTML, no necesariamente como XML.

### 3.8. Lenguajes para documentación técnica

Existen vocabularios especializados, como DocBook, para libros, manuales y documentación técnica. Demuestran que las marcas pueden describir capítulos, secciones, advertencias o referencias sin decidir inicialmente su apariencia final.

## 4. Tecnologías relacionadas que no son lenguajes de marcas

No conviene agrupar tecnologías solo porque utilicen texto o símbolos.

| Tecnología | Tipo | Finalidad principal |
|---|---|---|
| HTML | Lenguaje de marcas | Estructura y semántica web |
| XML | Metalenguaje de marcas | Crear vocabularios estructurados |
| SVG | Lenguaje de marcas | Gráficos vectoriales |
| Markdown | Lenguaje de marcas ligero | Documentación y contenido |
| CSS | Lenguaje de estilos | Presentación visual |
| JavaScript | Lenguaje de programación | Lógica y comportamiento |
| JSON | Formato de datos | Intercambio de datos estructurados |
| YAML | Lenguaje/formato de serialización | Datos y configuración |
| CSV | Formato tabular | Filas y columnas |
| SQL | Lenguaje de consulta | Definir y consultar bases de datos |

### Comparación breve: XML y JSON

Ambos pueden representar datos estructurados, pero poseen modelos y ecosistemas distintos:

| Aspecto | XML | JSON |
|---|---|---|
| Categoría | Metalenguaje de marcas | Formato de intercambio de datos |
| Estructura | Elementos, atributos y texto | Objetos, arrays y valores |
| Comentarios | Dependen del uso y procesador | No forman parte del estándar JSON |
| Validación | DTD, XML Schema y otras tecnologías | JSON Schema, cuando se utiliza |
| Uso habitual | Documentos, integración empresarial, estándares | API web y configuración |

```xml
<producto id="7">
  <nombre>Ratón</nombre>
  <precio>24.90</precio>
</producto>
```

```json
{
  "id": 7,
  "nombre": "Ratón",
  "precio": 24.90
}
```

No debe decidirse únicamente por cuál ocupa menos líneas. También importan la validación, las herramientas existentes y el estándar utilizado por el sector.

> [!CAUTION]
> En materiales divulgativos se llama a veces “lenguaje” a cualquier notación. Para clasificarla correctamente hay que atender a su finalidad, no solo a su aspecto.

## 5. SGML, XML y HTML: relación general

**SGML** fue un estándar para definir lenguajes de marcas. Influyó en tecnologías posteriores, pero era complejo para muchos usos cotidianos.

**XML** adoptó un conjunto más sencillo de reglas para crear vocabularios estructurados e intercambiables.

**HTML** es el lenguaje estándar de la web. Su evolución histórica estuvo relacionada con SGML; HTML5 se define actualmente mediante reglas específicas de análisis y no debe presentarse simplemente como “una aplicación de XML”.

Esta precisión importa porque HTML y XML pueden parecer similares, pero no aplican exactamente las mismas reglas.

| Tecnología | Papel principal | Situación general |
|---|---|---|
| SGML | Metalenguaje para definir lenguajes | Referente histórico y técnico |
| HTML | Lenguaje de documentos web | Tecnología fundamental de la web |
| XML | Reglas para crear vocabularios | Intercambio, documentos y configuración |
| XHTML | HTML expresado según reglas XML | Relevante histórica y conceptualmente |

## 6. ¿Cómo elegir un formato?

Antes de decidir, conviene preguntar:

- ¿Lo leerán personas, programas o ambos?
- ¿Necesitamos representar jerarquías complejas?
- ¿Existe un estándar del sector?
- ¿Hay que validar reglas estrictas?
- ¿Importa minimizar el tamaño transmitido?
- ¿Qué herramientas y bibliotecas lo procesarán?
- ¿Debe integrarse directamente en una página web?

Ejemplos razonables:

- Página web accesible → HTML.
- Icono vectorial adaptable → SVG.
- Documentación de un repositorio → Markdown.
- Respuesta habitual de una API web → JSON.
- Documento empresarial sujeto a un esquema acordado → XML.
- Exportación sencilla desde una hoja de cálculo → CSV.

### Matriz rápida de decisión

| Necesidad dominante | Opción inicial |
|---|---|
| Documento web semántico | HTML |
| Vocabulario propio validable | XML |
| Datos ligeros para una API web | JSON |
| Documentación cercana al código | Markdown |
| Gráfico vectorial manipulable | SVG |
| Datos tabulares simples | CSV |
| Distribución de novedades | RSS o Atom |

La tabla sirve como orientación, no como una regla automática. Los requisitos reales pueden cambiar la elección.

## 7. Estándares y organismos

Un **estándar abierto** publica reglas que pueden implementar distintos proveedores. Esto reduce la dependencia de una única herramienta.

En el ecosistema web destacan:

- **W3C:** publica numerosas recomendaciones relacionadas con tecnologías web.
- **WHATWG:** mantiene el estándar vivo de HTML.
- **IETF:** desarrolla estándares de Internet mediante documentos RFC; Atom es un ejemplo.
- **ECMA International:** estandariza tecnologías como ECMAScript, base de JavaScript.

El alumnado no necesita memorizar todas las organizaciones en esta unidad, pero sí comprender que HTML o XML no son invenciones particulares de un navegador.
