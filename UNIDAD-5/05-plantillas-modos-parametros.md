# 5. Plantillas, modos y parámetros

## 5.1. Por qué utilizar plantillas

`xsl:for-each` es adecuado para transformaciones pequeñas. Cuando el documento crece, las plantillas permiten repartir responsabilidades y evitar una única plantilla enorme.

```xml
<xsl:template match="/">
  <html lang="es">
    <body>
      <h1>Inventario</h1>
      <xsl:apply-templates select="inventario/producto"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="producto">
  <article>
    <h2><xsl:value-of select="nombre"/></h2>
    <p>Precio: <xsl:value-of select="precio"/> €</p>
  </article>
</xsl:template>
```

`xsl:apply-templates` selecciona nodos y pide al procesador que encuentre una plantilla cuyo `match` coincida.

## 5.2. `match` frente a `select`

| Atributo | Pregunta que responde | Ejemplo |
|---|---|---|
| `match` | ¿Para qué nodos sirve esta plantilla? | `match="producto"` |
| `select` | ¿Qué nodos quiero procesar ahora? | `select="inventario/producto"` |
| `test` | ¿Se cumple esta condición? | `test="@stock > 0"` |

No son intercambiables, aunque los tres utilizan expresiones relacionadas con XPath.

## 5.3. Plantillas más específicas

```xml
<xsl:template match="producto[@stock = 0]">
  <article>
    <h2><xsl:value-of select="nombre"/></h2>
    <p>Producto agotado.</p>
  </article>
</xsl:template>

<xsl:template match="producto">
  <article>
    <h2><xsl:value-of select="nombre"/></h2>
    <p>Disponible: <xsl:value-of select="@stock"/> unidades.</p>
  </article>
</xsl:template>
```

La plantilla específica para productos agotados tiene prioridad sobre la genérica. Conviene evitar reglas ambiguas; si dos plantillas tienen la misma prioridad, puede usarse `priority` explícitamente, aunque normalmente es mejor mejorar los patrones.

## 5.4. Ordenar al aplicar plantillas

```xml
<xsl:apply-templates select="inventario/producto">
  <xsl:sort select="precio" data-type="number" order="ascending"/>
</xsl:apply-templates>
```

`xsl:sort` se coloca dentro de `xsl:apply-templates`, antes de cualquier otra instrucción hija.

## 5.5. Modos

Un mismo nodo puede necesitar distintas representaciones. Los modos permiten disponer de varias plantillas para el mismo tipo de nodo.

```xml
<xsl:template match="/">
  <h1>Inventario</h1>
  <ul>
    <xsl:apply-templates select="inventario/producto" mode="resumen"/>
  </ul>

  <section>
    <xsl:apply-templates select="inventario/producto" mode="ficha"/>
  </section>
</xsl:template>

<xsl:template match="producto" mode="resumen">
  <li><xsl:value-of select="nombre"/></li>
</xsl:template>

<xsl:template match="producto" mode="ficha">
  <article>
    <h2><xsl:value-of select="nombre"/></h2>
    <p>Categoría: <xsl:value-of select="categoria"/></p>
    <p>Precio: <xsl:value-of select="precio"/> €</p>
  </article>
</xsl:template>
```

El modo de `apply-templates` debe coincidir con el de la plantilla.

## 5.6. Plantillas con nombre

Una plantilla nombrada se comporta como un bloque reutilizable:

```xml
<xsl:template name="cabecera">
  <header>
    <h1>Inventario técnico</h1>
    <p>Datos generados desde XML.</p>
  </header>
</xsl:template>
```

Llamada:

```xml
<xsl:call-template name="cabecera"/>
```

Las plantillas con `match` responden a nodos; las plantillas con `name` se invocan expresamente. Una plantilla puede tener ambos atributos, aunque no suele ser necesario al comenzar.

## 5.7. Parámetros

```xml
<xsl:template name="mostrar-precio">
  <xsl:param name="cantidad"/>
  <xsl:param name="moneda" select="'EUR'"/>

  <strong>
    <xsl:value-of select="format-number($cantidad, '0.00')"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="$moneda"/>
  </strong>
</xsl:template>
```

```xml
<xsl:call-template name="mostrar-precio">
  <xsl:with-param name="cantidad" select="precio"/>
  <xsl:with-param name="moneda" select="'EUR'"/>
</xsl:call-template>
```

`xsl:param` declara el parámetro y puede incluir un valor predeterminado. `xsl:with-param` envía un valor concreto.

## 5.8. Parámetros de entrada desde `xsltproc`

Parámetro global:

```xml
<xsl:param name="categoria" select="''"/>
```

Ejecución:

```bash
xsltproc --stringparam categoria Audio inventario.xsl inventario.xml
```

Uso:

```xml
<xsl:apply-templates
  select="inventario/producto[$categoria = '' or categoria = $categoria]"/>
```

Esto permite reutilizar una hoja sin modificarla cada vez.

## 5.9. Plantillas incorporadas

Si `apply-templates` procesa un nodo para el que no se ha definido una plantilla, XSLT aplica reglas incorporadas. Simplificando:

- En elementos, continúa con sus hijos.
- En texto y atributos, copia su valor textual.
- En comentarios e instrucciones de procesamiento, normalmente no genera nada.

Estas reglas explican por qué a veces aparece texto inesperado. Para controlar completamente la salida deben definirse las plantillas necesarias y limitar bien cada `select`.

## 5.10. Actividades

1. Sustituye un recorrido `for-each` por `apply-templates`.
2. Crea modos `resumen` y `detalle` para cada producto.
3. Crea una plantilla nombrada para mostrar precios.
4. Añade un parámetro global que filtre por categoría.
5. Ejecuta la transformación pasando dos categorías distintas desde la terminal.

