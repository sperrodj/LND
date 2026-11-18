# 7. Depuración, validación y errores frecuentes

## 7.1. Tres niveles distintos de error

Una transformación puede fallar porque:

1. El XML de entrada no está bien formado.
2. La hoja XSLT no está bien formada o contiene instrucciones incorrectas.
3. La transformación se ejecuta, pero la selección XPath o la salida no son las esperadas.

Conviene comprobarlos en ese orden.

## 7.2. Procedimiento de diagnóstico

```bash
xmllint --noout datos.xml
xmllint --noout transformacion.xsl
xsltproc -o resultado.html transformacion.xsl datos.xml
```

Después:

- Leer el mensaje completo y la línea indicada.
- Abrir el resultado y revisar su estructura.
- Validar el HTML o XML generado.
- Probar expresiones XPath por separado si no devuelven lo esperado.

## 7.3. Error: espacio de nombres ausente

```xml
<!-- Incorrecto -->
<xsl:stylesheet version="1.0">
```

```xml
<!-- Correcto -->
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
```

Sin el espacio de nombres, el procesador no reconoce las instrucciones `xsl:*`.

## 7.4. Error: XPath desde un contexto equivocado

```xml
<xsl:for-each select="/inventario/producto">
  <xsl:value-of select="/nombre"/>
</xsl:for-each>
```

`/nombre` busca un elemento raíz llamado `nombre`. Dentro del producto debe usarse:

```xml
<xsl:value-of select="nombre"/>
```

## 7.5. Error: comparar texto con `==`

```xml
<!-- Incorrecto en XPath 1.0 -->
<xsl:if test="categoria == 'Audio'">
```

```xml
<!-- Correcto -->
<xsl:if test="categoria = 'Audio'">
```

XPath utiliza `=` para comparar.

## 7.6. Error: `<` dentro de un atributo

```xml
<!-- Rompe el XML -->
<xsl:if test="precio < 50">
```

```xml
<!-- Correcto -->
<xsl:if test="precio &lt; 50">
```

El problema no es XPath, sino que la hoja XSLT debe seguir siendo XML bien formado.

## 7.7. Error: ordenar como texto

```xml
<xsl:sort select="precio"/>
```

Para cantidades numéricas:

```xml
<xsl:sort select="precio" data-type="number"/>
```

## 7.8. Error: `xsl:sort` colocado demasiado tarde

```xml
<xsl:for-each select="producto">
  <h2>Productos</h2>
  <xsl:sort select="nombre"/>
</xsl:for-each>
```

`xsl:sort` debe ser el primer contenido del recorrido:

```xml
<xsl:for-each select="producto">
  <xsl:sort select="nombre"/>
  <h2><xsl:value-of select="nombre"/></h2>
</xsl:for-each>
```

## 7.9. Error: esperar que `value-of` muestre todos los nodos

```xml
<xsl:value-of select="/curso/sesion"/>
```

En XSLT 1.0 solo se obtiene el valor del primer nodo seleccionado. Para todos:

```xml
<xsl:apply-templates select="/curso/sesion"/>
```

o un `xsl:for-each`.

## 7.10. Mensajes de depuración

```xml
<xsl:message>
  Procesando producto: <xsl:value-of select="@codigo"/>
</xsl:message>
```

El mensaje aparece en la salida de diagnóstico del procesador, no en el documento generado.

Detener ante una situación grave:

```xml
<xsl:if test="count(/inventario/producto) = 0">
  <xsl:message terminate="yes">El inventario está vacío.</xsl:message>
</xsl:if>
```

## 7.11. Comprobar la salida

- Si se genera HTML, abrirlo en navegador y validarlo como HTML.
- Si se genera XML, ejecutar `xmllint --noout resultado.xml`.
- Si se genera texto, revisar separadores, codificación y saltos de línea.
- Comparar el número de registros de entrada y salida cuando corresponda.
- Probar casos límite: colección vacía, elemento opcional ausente y valores cero.

## 7.12. Lista de comprobación

- [ ] XML y XSLT están bien formados.
- [ ] El espacio de nombres XSLT está declarado correctamente.
- [ ] `match`, `select` y `test` se usan con su función adecuada.
- [ ] Las rutas tienen en cuenta el nodo de contexto.
- [ ] Los números se ordenan como números.
- [ ] Los caracteres `<` y `&` están escapados dentro de atributos.
- [ ] No se divide entre cero.
- [ ] La salida generada también es válida.
- [ ] Los nombres y rutas de archivos coinciden exactamente.

## 7.13. Actividad de corrección

Corrige esta hoja:

```xml
<xsl:stylesheet version="1.0">
  <xsl:output method="html">
  <xsl:template select="/">
    <html>
      <body>
        <xsl:for-each select="/inventario/producto">
          <h2><xsl:value-of select="/nombre"/></h2>
          <xsl:sort select="precio"/>
          <xsl:if test="precio < 50">
            Oferta
          </xsl:if>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
```

Hay errores de espacio de nombres, cierre, uso de `match`, contexto, posición y tipo de ordenación, y escape de caracteres.

