# 2. Selección de datos y nodo de contexto

## 2.1. XPath dentro de XSLT

Las instrucciones XSLT utilizan XPath en atributos como `select`, `match` y `test`.

```xml
<xsl:value-of select="/agenda/@fecha"/>
```

La ruta comienza en el nodo documento `/`, accede al elemento raíz `agenda` y selecciona su atributo `fecha`.

## 2.2. Mostrar valores con `xsl:value-of`

```xml
<p>
  Fecha:
  <xsl:value-of select="/agenda/@fecha"/>
</p>
```

Primer nombre de actividad:

```xml
<xsl:value-of select="/agenda/actividad[1]/nombre"/>
```

Número de plazas de la segunda actividad:

```xml
<xsl:value-of select="/agenda/actividad[2]/@plazas"/>
```

En XSLT 1.0, `xsl:value-of` convierte la selección en texto. Si la expresión selecciona varios nodos, muestra únicamente el valor textual del primero. Para procesarlos todos se necesita un recorrido o plantillas.

## 2.3. Rutas absolutas y relativas

```xml
<!-- Ruta absoluta -->
<xsl:value-of select="/agenda/actividad[1]/nombre"/>

<!-- Ruta relativa, si el contexto ya es actividad -->
<xsl:value-of select="nombre"/>
```

Una ruta absoluta comienza en `/`. Una ruta relativa comienza en el nodo actual.

## 2.4. El nodo de contexto

El **contexto** es el nodo respecto al que se evalúa una expresión XPath. Cambia cuando XSLT entra en un recorrido o aplica una plantilla.

```xml
<xsl:for-each select="/agenda/actividad">
  <p>
    <xsl:value-of select="nombre"/>
    —
    <xsl:value-of select="@plazas"/>
    plazas
  </p>
</xsl:for-each>
```

Dentro del `for-each`, el contexto es una `actividad`. Por eso:

- `nombre` busca un hijo del nodo actual.
- `@plazas` busca un atributo del nodo actual.
- `.` representa el propio nodo actual.
- `..` representa su padre.

## 2.5. Seleccionar texto, elementos y atributos

```xml
<xsl:value-of select="nombre"/>          <!-- elemento hijo -->
<xsl:value-of select="@id"/>             <!-- atributo -->
<xsl:value-of select="nombre/text()"/>   <!-- nodo de texto -->
<xsl:value-of select="."/>               <!-- valor del nodo actual -->
```

Normalmente `nombre` resulta más claro que `nombre/text()` cuando solo se quiere mostrar el contenido.

## 2.6. Insertar texto de forma controlada

```xml
<p>
  <xsl:value-of select="nombre"/>
  <xsl:text> — </xsl:text>
  <xsl:value-of select="hora"/>
</p>
```

`xsl:text` resulta útil para conservar espacios, separadores o saltos concretos que podrían perderse por la indentación de la hoja.

```xml
<xsl:text>&#10;</xsl:text>
```

`&#10;` representa un salto de línea, especialmente útil en salidas de texto.

## 2.7. Copiar contenido

```xml
<xsl:copy-of select="/agenda/actividad[1]"/>
```

`xsl:copy-of` copia el nodo seleccionado con sus atributos y descendientes. En cambio, `xsl:value-of` obtiene únicamente su valor textual.

| Instrucción | Resultado |
|---|---|
| `xsl:value-of` | Valor convertido en texto |
| `xsl:copy-of` | Nodo completo con su estructura |

## 2.8. Posición y tamaño del conjunto

Dentro de un recorrido:

```xml
<xsl:for-each select="/agenda/actividad">
  <p>
    Actividad <xsl:value-of select="position()"/>
    de <xsl:value-of select="last()"/>:
    <xsl:value-of select="nombre"/>
  </p>
</xsl:for-each>
```

- `position()` devuelve la posición actual.
- `last()` devuelve el número de nodos del conjunto procesado.

## 2.9. Actividades

Usando `agenda.xml`, muestra:

1. La fecha de la agenda.
2. El identificador y nombre de la primera actividad.
3. La sala de la última actividad mediante `last()`.
4. Todas las actividades numeradas con `position()`.
5. La primera actividad completa mediante `xsl:copy-of` y explica la diferencia respecto a `xsl:value-of`.

