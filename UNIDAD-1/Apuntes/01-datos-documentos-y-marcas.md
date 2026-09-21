# Bloque 1. Datos, documentos y lenguajes de marcas

## 1. De los datos a la información

Un **dato** es la representación de un hecho, una medida o un valor. Sin contexto puede resultar ambiguo:

```text
18
```

¿Es una edad, una temperatura, una cantidad o un identificador?

La **información** aparece cuando los datos se organizan y se interpretan dentro de un contexto:

```text
Temperatura del servidor: 18 °C
```

En una aplicación web, el contexto es imprescindible. Un navegador o un servidor no deben “adivinar” qué significa cada valor.

El **conocimiento** aparece cuando una persona o un sistema relaciona la información disponible y la utiliza para tomar decisiones. Por ejemplo:

```text
Dato: 18
Información: el servidor está a 18 °C
Conocimiento: la temperatura está dentro del intervalo de funcionamiento seguro
```

| Concepto | Definición breve | Ejemplo |
|---|---|---|
| Dato | Representación elemental de un valor | `18` |
| Información | Dato interpretado en un contexto | `18 °C en el servidor` |
| Conocimiento | Interpretación utilizada para decidir | `No es necesario activar refrigeración adicional` |

### 1.1. Metadatos

Los **metadatos** son datos que describen otros datos o recursos. Pueden indicar su autoría, formato, idioma, fecha, versión o significado.

```html
<meta name="author" content="Equipo DAW">
<meta name="description" content="Catálogo de videojuegos">
```

Otros ejemplos:

- La fecha de publicación de una noticia.
- El texto alternativo de una imagen.
- El tipo de contenido de una respuesta HTTP.
- El título y el idioma de una página.
- La versión de un archivo de configuración.

Los metadatos pueden cumplir distintas funciones:

- **Descriptiva:** título, autor, palabras clave o resumen.
- **Técnica:** formato, tamaño, codificación o resolución.
- **Administrativa:** permisos, licencia o fecha de conservación.
- **Estructural:** relación entre capítulos, páginas o recursos.

Por ejemplo, el atributo `alt` aporta una alternativa textual a una imagen:

```html
<img src="aula.jpg" alt="Alumnado trabajando en el aula de informática">
```

El texto alternativo no es un adorno: permite comprender el contenido cuando la imagen no se ve o se utiliza un lector de pantalla.

## 2. ¿Qué es un documento digital?

Un **documento digital** es una unidad de información que puede almacenarse, transmitirse y procesarse. No tiene que parecerse a una hoja de papel.

Son documentos digitales:

- Una página HTML.
- Una factura electrónica en XML.
- Un icono SVG.
- Un canal RSS.
- Un archivo Markdown con la documentación de un proyecto.
- Un archivo JSON enviado por una API.

Un documento puede estar pensado principalmente para personas, para programas o para ambos.

### 2.1. Texto plano y formatos binarios

Un archivo de **texto plano** guarda caracteres que pueden leerse con un editor sencillo. HTML, XML, CSS, JavaScript, JSON y Markdown suelen almacenarse así.

Un archivo **binario** utiliza una representación que necesita un programa específico para interpretarse correctamente. Una imagen JPEG o un archivo ejecutable son ejemplos habituales.

```text
Texto plano: README.md → puede abrirse y leerse con un editor
Binario: foto.jpg → necesita un visor o programa que interprete sus bytes
```

Que un formato sea de texto no significa que carezca de reglas. Un documento XML sigue siendo incorrecto si incumple su sintaxis.

### 2.2. Codificación de caracteres

Los ordenadores almacenan números, por lo que necesitan una **codificación** que relacione esos números con caracteres. Actualmente, **UTF-8** es la opción más habitual en la web porque representa caracteres de numerosos idiomas y mantiene compatibilidad con ASCII.

Si un documento se guarda con una codificación y se interpreta con otra, pueden aparecer caracteres extraños:

```text
Correcto: programación
Problema de codificación: programaciÃ³n
```

> [!TIP]
> En los proyectos del módulo utilizaremos UTF-8 salvo indicación contraria.

## 3. Documentos estructurados

Un documento está **estructurado** cuando sus partes y relaciones pueden reconocerse mediante reglas explícitas.

Compárense estas dos representaciones:

```text
Ada;19;DAW
```

```xml
<estudiante>
  <nombre>Ada</nombre>
  <edad>19</edad>
  <ciclo>DAW</ciclo>
</estudiante>
```

La primera es más breve, pero exige conocer previamente el orden de los campos. La segunda incorpora marcas que hacen explícito el significado de cada dato.

### 3.1. Información estructurada, semiestructurada y no estructurada

| Tipo | Característica | Ejemplo |
|---|---|---|
| Estructurada | Sigue un esquema estable de campos y relaciones | Tabla de una base de datos |
| Semiestructurada | Incluye marcas o claves, pero su estructura puede variar | XML, JSON o HTML |
| No estructurada | No presenta campos explícitos fácilmente procesables | Texto libre, audio o fotografía |

La clasificación depende del punto de vista. Una página HTML posee estructura documental, aunque su contenido textual pueda ser muy flexible.

### Ventajas de la estructura explícita

- Reduce ambigüedades.
- Facilita la lectura automática.
- Permite buscar y transformar partes concretas.
- Ayuda a validar el documento.
- Favorece el intercambio entre sistemas diferentes.
- Hace posible separar el contenido de su presentación.

### Costes o limitaciones

- Las marcas aumentan el tamaño del documento.
- Hay que respetar una sintaxis.
- Algunas representaciones son más verbosas.
- Es necesario acordar vocabularios y reglas.

> [!NOTE]
> Que un formato sea más corto no significa que sea más claro, y que sea más explícito no significa que sea siempre la mejor opción.

## 4. ¿Qué es un lenguaje de marcas?

Un **lenguaje de marcas** es un sistema que incorpora marcas a un documento para describir su estructura, significado, presentación o forma de procesamiento.

```html
<h1>Lenguajes de marcas</h1>
<p>Este texto forma un párrafo.</p>
```

El contenido visible es el texto. Las expresiones `<h1>`, `</h1>`, `<p>` y `</p>` son marcas que indican la función de cada fragmento.

### 4.1. Origen del concepto

Antes de la edición digital, se añadían anotaciones a los manuscritos para indicar al impresor cómo debía organizar o presentar el texto. Los sistemas informáticos convirtieron esas indicaciones en códigos que una máquina puede interpretar.

Una evolución muy resumida sería:

1. Marcas editoriales escritas sobre documentos.
2. Sistemas informáticos de composición tipográfica.
3. SGML como marco para definir lenguajes de marcas.
4. HTML para publicar documentos enlazados en la Web.
5. XML como conjunto de reglas simplificado para crear vocabularios.
6. Lenguajes y formatos actuales especializados en web, documentación, gráficos e intercambio.

### 4.2. Características habituales

Los lenguajes de marcas suelen:

- Combinar contenido con información descriptiva.
- Utilizar una sintaxis definida.
- Organizar documentos en partes relacionadas.
- Ser legibles tanto por personas como por programas.
- Guardarse como texto y ser independientes de una plataforma concreta.
- Facilitar el intercambio y la transformación de información.
- Disponer de analizadores, validadores o procesadores.

No todos emplean etiquetas con `<` y `>`. Markdown utiliza símbolos sencillos:

```markdown
# Título

Texto con **importancia** y un [enlace](https://example.com).
```

### 4.3. Ventajas de los lenguajes de marcas

- **Legibilidad:** muchos documentos pueden ser revisados por personas.
- **Interoperabilidad:** distintas aplicaciones pueden compartir información.
- **Portabilidad:** el texto no depende de un sistema operativo concreto.
- **Extensibilidad:** algunos lenguajes permiten crear vocabularios especializados.
- **Procesamiento automático:** se pueden buscar, validar, transformar o presentar datos.
- **Separación de responsabilidades:** el contenido puede mantenerse independiente de su apariencia.
- **Control de versiones:** las diferencias entre archivos de texto se comparan con facilidad.

### 4.4. Limitaciones

- Algunas sintaxis generan documentos extensos.
- Un error de estructura puede impedir el procesamiento.
- Dos sistemas deben compartir las mismas reglas o vocabulario.
- Un documento legible no tiene por qué estar correctamente diseñado.
- No todos los lenguajes sirven para todas las necesidades.

### 4.5. Lenguaje, formato y estándar

Aunque se relacionan, no significan exactamente lo mismo:

- Un **lenguaje** proporciona símbolos y reglas para expresar información.
- Un **formato** define cómo se representa o almacena esa información.
- Un **estándar** es una especificación acordada y publicada para favorecer un uso común.

HTML es un lenguaje normalizado para documentos web; JPEG es un formato de imagen; UTF-8 es una codificación de caracteres.

## 5. ¿Es lo mismo marcar que programar?

No. Un lenguaje de programación expresa algoritmos, decisiones y operaciones. Un lenguaje de marcas describe principalmente un documento y sus partes.

```html
<button>Guardar</button>
```

El fragmento declara que existe un botón, pero no define qué sucede al pulsarlo. El comportamiento podría programarse con JavaScript:

```javascript
console.log("Guardando...");
```

La diferencia no implica que uno sea más importante. En una web colaboran tecnologías con responsabilidades distintas.

| Aspecto | Lenguaje de marcas | Lenguaje de programación |
|---|---|---|
| Finalidad principal | Describir contenido y estructura | Expresar algoritmos y comportamiento |
| Construcciones típicas | Elementos, atributos, marcas | Variables, condiciones, bucles, funciones |
| Ejemplo | HTML, XML, Markdown | JavaScript, Java, Python |
| Resultado | Documento interpretable | Instrucciones ejecutables por un intérprete o compilador |

Un documento de marcas puede ser creado o procesado por un programa, pero eso no lo convierte en un programa.

## Ideas clave

- Los datos necesitan contexto para convertirse en información útil.
- Las marcas hacen explícita la estructura o el significado.
- Un documento estructurado puede ser procesado automáticamente.
- Un lenguaje de marcas describe; un lenguaje de programación ejecuta lógica.

