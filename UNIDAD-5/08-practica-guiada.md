# 8. Práctica guiada: catálogo de un vivero

## 8.1. Objetivo

Construir una transformación XSLT que convierta un catálogo XML de plantas en una página HTML. La página mostrará un resumen, permitirá generar distintas selecciones mediante parámetros y organizará cada planta mediante plantillas.

## 8.2. Estructura del proyecto

Crea las carpetas antes de escribir código:

```text
vivero-xslt/
├── datos/
│   └── plantas.xml
├── transformaciones/
│   └── catalogo.xsl
├── salida/
│   └── catalogo.html
└── README.md
```

## 8.3. Paso 1: documento XML

Guarda en `datos/plantas.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<vivero actualizado="2027-01-20">
  <planta id="PL01" disponible="true">
    <nombre-comun>Lavanda</nombre-comun>
    <nombre-cientifico>Lavandula angustifolia</nombre-cientifico>
    <tipo>Aromática</tipo>
    <origen>Mediterráneo</origen>
    <cuidados>
      <luz>Sol directo</luz>
      <riego>Bajo</riego>
    </cuidados>
    <precio moneda="EUR">6.50</precio>
    <stock>18</stock>
  </planta>

  <planta id="PL02" disponible="true">
    <nombre-comun>Calathea</nombre-comun>
    <nombre-cientifico>Goeppertia orbifolia</nombre-cientifico>
    <tipo>Interior</tipo>
    <origen>Bolivia</origen>
    <cuidados>
      <luz>Indirecta</luz>
      <riego>Moderado</riego>
    </cuidados>
    <precio moneda="EUR">17.90</precio>
    <stock>4</stock>
    <observaciones>Necesita humedad ambiental alta.</observaciones>
  </planta>

  <planta id="PL03" disponible="false">
    <nombre-comun>Arce japonés</nombre-comun>
    <nombre-cientifico>Acer palmatum</nombre-cientifico>
    <tipo>Exterior</tipo>
    <origen>Japón</origen>
    <cuidados>
      <luz>Semisombra</luz>
      <riego>Moderado</riego>
    </cuidados>
    <precio moneda="EUR">34.00</precio>
    <stock>0</stock>
  </planta>

  <planta id="PL04" disponible="true">
    <nombre-comun>Monstera</nombre-comun>
    <nombre-cientifico>Monstera deliciosa</nombre-cientifico>
    <tipo>Interior</tipo>
    <origen>México</origen>
    <cuidados>
      <luz>Indirecta</luz>
      <riego>Moderado</riego>
    </cuidados>
    <precio moneda="EUR">22.75</precio>
    <stock>9</stock>
  </planta>

  <planta id="PL05" disponible="true">
    <nombre-comun>Romero</nombre-comun>
    <nombre-cientifico>Salvia rosmarinus</nombre-cientifico>
    <tipo>Aromática</tipo>
    <origen>Mediterráneo</origen>
    <cuidados>
      <luz>Sol directo</luz>
      <riego>Bajo</riego>
    </cuidados>
    <precio moneda="EUR">5.25</precio>
    <stock>25</stock>
  </planta>
</vivero>
```

Comprueba el archivo:

```bash
xmllint --noout datos/plantas.xml
```

## 8.4. Paso 2: cabecera de la transformación

Guarda en `transformaciones/catalogo.xsl`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:param name="tipo" select="''"/>
  <xsl:variable name="plantas" select="/vivero/planta"/>

  <!-- Las plantillas se añadirán aquí -->

</xsl:stylesheet>
```

El parámetro `tipo` permitirá mostrar todas las plantas o filtrar una categoría desde la terminal.

## 8.5. Paso 3: plantilla principal

```xml
<xsl:template match="/">
  <html lang="es">
    <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>Catálogo del vivero</title>
    </head>
    <body>
      <header>
        <h1>Vivero Raíces</h1>
        <p>
          Catálogo actualizado el
          <xsl:value-of select="vivero/@actualizado"/>.
        </p>
      </header>

      <main>
        <xsl:call-template name="resumen"/>

        <section>
          <h2>Plantas del catálogo</h2>
          <xsl:apply-templates
            select="$plantas[$tipo = '' or tipo = $tipo]">
            <xsl:sort select="precio" data-type="number"/>
          </xsl:apply-templates>
        </section>
      </main>

      <footer>
        <p>Información generada mediante XML y XSLT.</p>
      </footer>
    </body>
  </html>
</xsl:template>
```

La condición del `select` significa: seleccionar todas cuando el parámetro esté vacío o solo las que coincidan con el tipo indicado.

## 8.6. Paso 4: resumen mediante plantilla nombrada

```xml
<xsl:template name="resumen">
  <section>
    <h2>Resumen</h2>
    <ul>
      <li>Total: <xsl:value-of select="count($plantas)"/></li>
      <li>
        Disponibles:
        <xsl:value-of select="count($plantas[@disponible='true'])"/>
      </li>
      <li>
        Precio medio:
        <xsl:choose>
          <xsl:when test="count($plantas) > 0">
            <xsl:value-of
              select="format-number(sum($plantas/precio) div count($plantas), '0.00')"/>
            <xsl:text> €</xsl:text>
          </xsl:when>
          <xsl:otherwise>No disponible</xsl:otherwise>
        </xsl:choose>
      </li>
    </ul>
  </section>
</xsl:template>
```

La condición evita dividir entre cero si el catálogo estuviera vacío.

## 8.7. Paso 5: plantilla para cada planta

```xml
<xsl:template match="planta">
  <article data-id="{@id}">
    <header>
      <h3><xsl:value-of select="nombre-comun"/></h3>
      <p><em><xsl:value-of select="nombre-cientifico"/></em></p>
    </header>

    <dl>
      <dt>Tipo</dt>
      <dd><xsl:value-of select="tipo"/></dd>
      <dt>Origen</dt>
      <dd><xsl:value-of select="origen"/></dd>
      <dt>Luz</dt>
      <dd><xsl:value-of select="cuidados/luz"/></dd>
      <dt>Riego</dt>
      <dd><xsl:value-of select="cuidados/riego"/></dd>
    </dl>

    <p>
      <strong>Precio:</strong>
      <xsl:value-of select="format-number(precio, '0.00')"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="precio/@moneda"/>
    </p>

    <p>
      <strong>Estado:</strong>
      <xsl:choose>
        <xsl:when test="@disponible='false' or stock=0">Agotada</xsl:when>
        <xsl:when test="stock &lt;= 5">Últimas unidades</xsl:when>
        <xsl:otherwise>Disponible</xsl:otherwise>
      </xsl:choose>
    </p>

    <xsl:if test="observaciones">
      <p>
        <strong>Observaciones:</strong>
        <xsl:value-of select="observaciones"/>
      </p>
    </xsl:if>
  </article>
</xsl:template>
```

## 8.8. Paso 6: ejecutar

Todas las plantas:

```bash
xsltproc \
  -o salida/catalogo.html \
  transformaciones/catalogo.xsl \
  datos/plantas.xml
```

Solo las de Interior:

```bash
xsltproc \
  --stringparam tipo Interior \
  -o salida/interior.html \
  transformaciones/catalogo.xsl \
  datos/plantas.xml
```

Solo las Aromáticas:

```bash
xsltproc \
  --stringparam tipo Aromática \
  -o salida/aromaticas.html \
  transformaciones/catalogo.xsl \
  datos/plantas.xml
```

## 8.9. Paso 7: validación

```bash
xmllint --noout datos/plantas.xml
xmllint --noout transformaciones/catalogo.xsl
xsltproc -o salida/catalogo.html transformaciones/catalogo.xsl datos/plantas.xml
```

Además:

1. Abre `catalogo.html` en el navegador.
2. Comprueba que aparecen cinco plantas ordenadas por precio.
3. Comprueba que Calathea muestra «Últimas unidades».
4. Comprueba que Arce japonés muestra «Agotada».
5. Comprueba que las observaciones solo aparecen cuando existen.
6. Ejecuta los filtros y revisa sus resultados.

## 8.10. README

Documenta:

- Objetivo del proyecto.
- Estructura de carpetas.
- Comandos de validación y transformación.
- Instrucciones XSLT utilizadas.
- Explicación del parámetro `tipo`.
- Capturas de la salida general y una filtrada.
- Errores encontrados y solución aplicada.

## 8.11. Ampliaciones

- Añadir al menos tres plantas nuevas.
- Crear una tabla resumen ordenada alfabéticamente mediante un modo distinto.
- Añadir un parámetro `precio-maximo`.
- Generar un segundo resultado XML con las plantas disponibles.
- Generar un archivo de texto con `id;nombre;precio;stock`.

## 8.12. Lista de comprobación

- [ ] La estructura de carpetas es correcta.
- [ ] XML y XSLT están bien formados.
- [ ] La salida se genera mediante `xsltproc`.
- [ ] Se usan `value-of`, `if`, `choose`, `sort` y funciones XPath.
- [ ] La transformación utiliza plantillas y no un único bloque enorme.
- [ ] El parámetro filtra correctamente.
- [ ] Se controla el catálogo vacío antes de calcular la media.
- [ ] La salida HTML tiene una estructura semántica básica.
- [ ] El README explica cómo reproducir el resultado.

## 8.13. Propuesta de evaluación

| Criterio | Peso orientativo |
|---|---:|
| XML de entrada y organización | 15 % |
| Selecciones XPath y tratamiento de datos | 20 % |
| Recorridos, filtros, ordenación y condiciones | 20 % |
| Plantillas, variables y parámetros | 20 % |
| Calidad y validez de la salida | 15 % |
| README, pruebas y presentación | 10 % |

