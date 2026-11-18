# 3. Recorridos, filtros y ordenación

## 3.1. Recorrer nodos con `xsl:for-each`

Supongamos este inventario:

```xml
<inventario>
  <producto codigo="P01" stock="12">
    <nombre>Cámara instantánea</nombre>
    <categoria>Fotografía</categoria>
    <precio>89.90</precio>
  </producto>
  <producto codigo="P02" stock="0">
    <nombre>Trípode compacto</nombre>
    <categoria>Accesorios</categoria>
    <precio>34.50</precio>
  </producto>
  <producto codigo="P03" stock="7">
    <nombre>Grabadora portátil</nombre>
    <categoria>Audio</categoria>
    <precio>119.00</precio>
  </producto>
</inventario>
```

Una lista HTML:

```xml
<ul>
  <xsl:for-each select="/inventario/producto">
    <li>
      <xsl:value-of select="nombre"/>
      <xsl:text> — </xsl:text>
      <xsl:value-of select="precio"/>
      <xsl:text> €</xsl:text>
    </li>
  </xsl:for-each>
</ul>
```

## 3.2. Generar una tabla HTML

```xml
<table>
  <thead>
    <tr>
      <th>Código</th>
      <th>Producto</th>
      <th>Categoría</th>
      <th>Precio</th>
      <th>Stock</th>
    </tr>
  </thead>
  <tbody>
    <xsl:for-each select="/inventario/producto">
      <tr>
        <td><xsl:value-of select="@codigo"/></td>
        <td><xsl:value-of select="nombre"/></td>
        <td><xsl:value-of select="categoria"/></td>
        <td><xsl:value-of select="precio"/> €</td>
        <td><xsl:value-of select="@stock"/></td>
      </tr>
    </xsl:for-each>
  </tbody>
</table>
```

HTML se escribe como resultado literal y XSLT inserta las filas que dependen de los datos.

## 3.3. Filtrar con predicados XPath

Solo productos con existencias:

```xml
<xsl:for-each select="/inventario/producto[@stock > 0]">
```

Productos de Audio:

```xml
<xsl:for-each select="/inventario/producto[categoria='Audio']">
```

Productos entre 30 y 100 euros:

```xml
<xsl:for-each select="/inventario/producto[precio >= 30 and precio <= 100]">
```

Nombre que contiene «Cámara»:

```xml
<xsl:for-each select="/inventario/producto[contains(nombre, 'Cámara')]">
```

En XML y XSLT, `<` no puede escribirse directamente dentro de un atributo. Por eso se utiliza `&lt;`:

```xml
select="/inventario/producto[precio &lt; 50]"
```

`>` sí puede escribirse, aunque `&gt;` también es válido.

## 3.4. Ordenar con `xsl:sort`

`xsl:sort` debe aparecer al principio de `xsl:for-each` o `xsl:apply-templates`, antes de generar contenido.

Orden alfabético:

```xml
<xsl:for-each select="/inventario/producto">
  <xsl:sort select="nombre" data-type="text" order="ascending"/>
  <p><xsl:value-of select="nombre"/></p>
</xsl:for-each>
```

Precio de mayor a menor:

```xml
<xsl:for-each select="/inventario/producto">
  <xsl:sort select="precio" data-type="number" order="descending"/>
  <p><xsl:value-of select="nombre"/>: <xsl:value-of select="precio"/> €</p>
</xsl:for-each>
```

Si se omite `data-type="number"`, algunos procesadores podrían ordenar como texto: `119`, `34`, `89`.

## 3.5. Varios criterios de ordenación

```xml
<xsl:for-each select="/inventario/producto">
  <xsl:sort select="categoria" data-type="text"/>
  <xsl:sort select="precio" data-type="number" order="descending"/>
  <p>
    <xsl:value-of select="categoria"/> —
    <xsl:value-of select="nombre"/> —
    <xsl:value-of select="precio"/> €
  </p>
</xsl:for-each>
```

Primero se ordena por categoría y, dentro de cada categoría, por precio.

## 3.6. Recorrer colecciones anidadas

```xml
<curso>
  <sesion titulo="Primeros auxilios">
    <materiales>
      <material>Vendas</material>
      <material>Guantes</material>
      <material>Maniquí de práctica</material>
    </materiales>
  </sesion>
</curso>
```

```xml
<xsl:for-each select="/curso/sesion">
  <h2><xsl:value-of select="@titulo"/></h2>
  <ul>
    <xsl:for-each select="materiales/material">
      <li><xsl:value-of select="."/></li>
    </xsl:for-each>
  </ul>
</xsl:for-each>
```

Cada recorrido cambia el contexto. Dentro del segundo, `.` es un elemento `material`.

## 3.7. Actividades

1. Muestra en una tabla solo los productos con stock.
2. Ordénalos por precio ascendente.
3. Crea otra sección con los productos agotados.
4. Filtra los productos cuyo precio sea inferior a 100 euros.
5. Ordena primero por categoría y después por nombre.
6. Explica por qué `xsl:sort` no puede colocarse después de un `h2` dentro del recorrido.

