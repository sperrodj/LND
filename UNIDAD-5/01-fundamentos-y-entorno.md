# 1. Fundamentos, estructura y entorno de trabajo

## 1.1. ¿Qué es XSLT?

**XSLT** significa *Extensible Stylesheet Language Transformations*. Es un lenguaje basado en XML que describe cómo debe transformarse un documento XML.

| Tecnología | Función |
|---|---|
| XML | Almacena y organiza los datos |
| XPath | Selecciona nodos dentro del XML |
| XSLT | Define qué se genera con esos nodos |

Una transformación no modifica el archivo XML original. El procesador lo lee junto con la hoja XSLT y construye un documento nuevo.

## 1.2. Posibles resultados

Una misma fuente XML puede convertirse en:

- Una página HTML para mostrar los datos en un navegador.
- Otro XML con distinta estructura o menos información.
- Texto plano, como un listado, una factura o un archivo CSV sencillo.

Esto permite separar los **datos** de su **presentación**.

## 1.3. Archivos de partida

```text
primera-transformacion/
├── datos/
│   └── agenda.xml
├── transformaciones/
│   └── agenda.xsl
└── salida/
```

`agenda.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<agenda fecha="2027-01-16">
  <actividad id="A01" plazas="20">
    <nombre>Taller de encuadernación</nombre>
    <hora>10:00</hora>
    <sala>Aula 2</sala>
  </actividad>
  <actividad id="A02" plazas="80">
    <nombre>Concierto de percusión</nombre>
    <hora>19:30</hora>
    <sala>Auditorio</sala>
  </actividad>
</agenda>
```

## 1.4. Estructura mínima de una hoja XSLT

`agenda.xsl`:

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
        <title>Agenda cultural</title>
      </head>
      <body>
        <h1>Agenda cultural</h1>
        <p>Documento generado mediante XSLT.</p>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
```

### `xsl:stylesheet`

Es el elemento raíz de la hoja. Como la hoja XSLT también es XML, debe existir un único elemento raíz y todo debe estar correctamente anidado.

```xml
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
```

Esta declaración asocia el prefijo `xsl` con el espacio de nombres de XSLT. Así, el procesador distingue las instrucciones XSLT de los elementos HTML que deben copiarse a la salida.

### `xsl:output`

```xml
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
```

Indica el formato deseado:

- `method="html"`: genera HTML.
- `method="xml"`: genera XML.
- `method="text"`: genera texto plano.
- `encoding`: codificación de caracteres.
- `indent="yes"`: solicita una salida indentada cuando sea posible.

### `xsl:template`

```xml
<xsl:template match="/">
```

Una plantilla indica qué debe generarse al encontrar determinados nodos. `match="/"` coincide con el **nodo documento**, es decir, el punto de entrada de la transformación.

## 1.5. Asociar XML y XSLT

Para abrir la transformación directamente en un navegador compatible, se puede añadir al XML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../transformaciones/agenda.xsl"?>
<agenda fecha="2027-01-16">
```

La ruta de `href` se calcula desde el archivo XML. Algunos navegadores restringen transformaciones cargadas directamente desde el sistema de archivos, por lo que resulta más fiable usar un servidor local o ejecutar la transformación desde la terminal.

## 1.6. Ejecutar con `xsltproc`

Comprobar primero que ambos archivos están bien formados:

```bash
xmllint --noout datos/agenda.xml
xmllint --noout transformaciones/agenda.xsl
```

Mostrar el resultado en la terminal:

```bash
xsltproc transformaciones/agenda.xsl datos/agenda.xml
```

Guardarlo en un archivo:

```bash
xsltproc -o salida/agenda.html transformaciones/agenda.xsl datos/agenda.xml
```

El orden es siempre:

```text
xsltproc [opciones] hoja.xsl datos.xml
```

## 1.7. Elementos literales e instrucciones

```xml
<h1>Agenda cultural</h1>
<xsl:value-of select="/agenda/@fecha"/>
```

- `h1` es un elemento literal: se copia al resultado.
- `xsl:value-of` es una instrucción: el procesador la ejecuta.

Las instrucciones XSLT no aparecen en el HTML final.

## 1.8. Actividades breves

1. Crea la estructura de carpetas indicada.
2. Comprueba por separado el XML y el XSLT con `xmllint`.
3. Genera `salida/agenda.html` con `xsltproc`.
4. Cambia `method="html"` por `method="xml"`, repite la transformación y compara el resultado.
5. Explica por qué una hoja XSLT debe estar bien formada aunque su salida sea HTML.

