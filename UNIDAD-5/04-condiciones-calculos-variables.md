# 4. Condiciones, cálculos y variables

## 4.1. Condiciones simples con `xsl:if`

```xml
<xsl:if test="@stock = 0">
  <strong>Agotado</strong>
</xsl:if>
```

`test` contiene una expresión XPath. Si el resultado se evalúa como verdadero, se genera el contenido. `xsl:if` no incluye una rama `else`.

Comprobar que un elemento existe:

```xml
<xsl:if test="descripcion">
  <p><xsl:value-of select="descripcion"/></p>
</xsl:if>
```

Comprobar que existe y no está vacío:

```xml
<xsl:if test="normalize-space(descripcion) != ''">
```

## 4.2. Alternativas con `xsl:choose`

```xml
<xsl:choose>
  <xsl:when test="@stock = 0">Sin existencias</xsl:when>
  <xsl:when test="@stock &lt;= 5">Últimas unidades</xsl:when>
  <xsl:otherwise>Disponible</xsl:otherwise>
</xsl:choose>
```

- `xsl:choose` agrupa las alternativas.
- `xsl:when` define cada condición.
- `xsl:otherwise` actúa como caso final.
- Solo se ejecuta la primera condición verdadera.

Por estar dentro de un atributo XML, `<=` se escribe `&lt;=`.

## 4.3. Operadores habituales

| Operación | XPath |
|---|---|
| Igualdad | `=` |
| Distinto | `!=` |
| Menor | `&lt;` |
| Menor o igual | `&lt;=` |
| Mayor | `>` |
| Mayor o igual | `>=` |
| Y lógico | `and` |
| O lógico | `or` |
| Negación | `not(...)` |

Ejemplo:

```xml
<xsl:if test="precio &lt; 50 and @stock > 0">
  <span>Oferta disponible</span>
</xsl:if>
```

## 4.4. Contar y sumar

```xml
<p>
  Productos registrados:
  <xsl:value-of select="count(/inventario/producto)"/>
</p>

<p>
  Productos con existencias:
  <xsl:value-of select="count(/inventario/producto[@stock > 0])"/>
</p>

<p>
  Suma de precios:
  <xsl:value-of select="sum(/inventario/producto/precio)"/>
</p>
```

En XSLT 1.0 no existe una función estándar `avg()`. La media se calcula dividiendo:

```xml
<xsl:value-of
  select="sum(/inventario/producto/precio) div count(/inventario/producto)"/>
```

Debe comprobarse antes que el divisor no sea cero.

## 4.5. Formatear números

```xml
<xsl:value-of select="format-number(precio, '0.00')"/>
```

```xml
<xsl:value-of
  select="format-number(sum(/inventario/producto/precio), '0.00')"/>
```

El patrón `'0.00'` obliga a mostrar dos decimales.

## 4.6. Variables

```xml
<xsl:variable name="productos" select="/inventario/producto"/>
<xsl:variable name="total" select="count($productos)"/>

<p>Total: <xsl:value-of select="$total"/></p>
```

Las variables se consultan con `$`. En XSLT 1.0, una variable no puede reasignarse dentro de su ámbito: se parece más a una constante.

### Ámbito

```xml
<xsl:stylesheet ...>
  <xsl:variable name="moneda" select="'EUR'"/>

  <xsl:template match="/">
    <xsl:variable name="titulo" select="'Inventario general'"/>
    ...
  </xsl:template>
</xsl:stylesheet>
```

- Una variable hija directa de `xsl:stylesheet` es global.
- Una variable declarada en una plantilla es local y solo existe dentro de su ámbito.
- Los textos literales en XPath deben escribirse entre comillas: `select="'EUR'"`.

## 4.7. Variables con contenido

```xml
<xsl:variable name="estado">
  <xsl:choose>
    <xsl:when test="@stock = 0">Agotado</xsl:when>
    <xsl:otherwise>Disponible</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<p><xsl:value-of select="$estado"/></p>
```

En XSLT 1.0 existe una diferencia técnica entre una selección de nodos y una variable construida con contenido. Para cálculos y filtros suele ser más sencillo utilizar `select` siempre que sea posible.

## 4.8. Actividades

1. Clasifica cada producto como agotado, últimas unidades o disponible.
2. Muestra el número total y el número de productos con stock.
3. Calcula el precio medio con dos decimales.
4. Guarda `/inventario/producto` en una variable y reutilízala en tres expresiones.
5. Evita una división entre cero si el inventario no contiene productos.

