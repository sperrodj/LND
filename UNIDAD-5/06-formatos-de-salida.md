# 6. Generación de HTML, XML y texto

## 6.1. Salida HTML

```xml
<xsl:output
  method="html"
  encoding="UTF-8"
  indent="yes"
  doctype-system="about:legacy-compat"/>
```

En la plantilla se pueden escribir directamente elementos HTML:

```xml
<article data-codigo="{@codigo}">
  <h2><xsl:value-of select="nombre"/></h2>
  <p><xsl:value-of select="descripcion"/></p>
</article>
```

`data-codigo="{@codigo}"` es una **plantilla de valor de atributo**. El contenido entre llaves se evalúa como XPath.

## 6.2. Atributos dinámicos

También pueden construirse con `xsl:attribute`:

```xml
<article>
  <xsl:attribute name="data-codigo">
    <xsl:value-of select="@codigo"/>
  </xsl:attribute>
  <h2><xsl:value-of select="nombre"/></h2>
</article>
```

La forma abreviada suele ser más clara:

```xml
<a href="fichas/{@codigo}.html">
  <xsl:value-of select="nombre"/>
</a>
```

## 6.3. Elementos dinámicos

```xml
<xsl:element name="h{nivel}">
  <xsl:value-of select="titulo"/>
</xsl:element>
```

`xsl:element` crea un elemento cuyo nombre se calcula. Debe usarse solo cuando el nombre realmente dependa de los datos; si es fijo, resulta más legible escribir la etiqueta literal.

## 6.4. Generar otro XML

Fuente:

```xml
<personal>
  <empleado id="E01" activo="true">
    <nombre>Lucía Ramos</nombre>
    <departamento>Administración</departamento>
    <correo>lucia@example.org</correo>
  </empleado>
  <empleado id="E02" activo="false">
    <nombre>Darío Martín</nombre>
    <departamento>Archivo</departamento>
    <correo>dario@example.org</correo>
  </empleado>
</personal>
```

Transformación:

```xml
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
  <directorio>
    <xsl:apply-templates select="personal/empleado[@activo='true']"/>
  </directorio>
</xsl:template>

<xsl:template match="empleado">
  <contacto codigo="{@id}">
    <nombre-completo><xsl:value-of select="nombre"/></nombre-completo>
    <email><xsl:value-of select="correo"/></email>
  </contacto>
</xsl:template>
```

El resultado conserva solo el personal activo y cambia la estructura y los nombres de los elementos.

## 6.5. Generar texto plano

```xml
<xsl:output method="text" encoding="UTF-8"/>

<xsl:template match="/">
  <xsl:text>NOMBRE;DEPARTAMENTO;CORREO&#10;</xsl:text>
  <xsl:for-each select="personal/empleado">
    <xsl:value-of select="nombre"/>
    <xsl:text>;</xsl:text>
    <xsl:value-of select="departamento"/>
    <xsl:text>;</xsl:text>
    <xsl:value-of select="correo"/>
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
</xsl:template>
```

Resultado:

```text
NOMBRE;DEPARTAMENTO;CORREO
Lucía Ramos;Administración;lucia@example.org
Darío Martín;Archivo;dario@example.org
```

Para un CSV real habría que tratar correctamente separadores, comillas y saltos incluidos en los datos. Este ejemplo se limita a explicar la salida de texto.

## 6.6. Escapar o interpretar marcado

Por defecto, XSLT escapa los caracteres especiales:

```xml
<xsl:value-of select="descripcion"/>
```

Si `descripcion` contiene `<strong>`, se mostrará como texto, lo que suele ser la opción segura. Existe `disable-output-escaping="yes"`, pero depende del procesador y puede introducir marcado inválido o inseguro. No debe usarse como solución habitual.

## 6.7. Espacios de nombres en la salida

Para generar SVG dentro de HTML/XML:

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 20">
  <rect x="0" y="0" width="80" height="20"/>
</svg>
```

El espacio de nombres forma parte de la identidad del elemento. No basta con que la etiqueta se llame `svg`.

## 6.8. Elegir el formato

| Necesidad | Salida apropiada |
|---|---|
| Mostrar datos en navegador | HTML |
| Intercambiar una estructura distinta | XML |
| Crear un informe simple o exportación | Texto |

## 6.9. Actividades

1. Genera HTML con un atributo `data-id` dinámico.
2. Transforma el XML de personal en un nuevo XML con solo el personal activo.
3. Genera un listado de texto con un contacto por línea.
4. Explica la diferencia entre un elemento literal y `xsl:element`.
5. Justifica por qué no conviene usar `disable-output-escaping` de manera general.

