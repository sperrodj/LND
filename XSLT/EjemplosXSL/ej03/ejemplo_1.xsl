<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
	<xsl:template match="/"> <!--Elemento raíz-->
        <html>
            <head>
                <title>Mi primer XSLT</title>
                <style>
                    th {
                        font-size: 2em;
                    }
                    h1 {
                        font-family: "Arial";
                        color: white;
                        background-color: green;
                    }
                </style>
            </head>
            <body>
                <h1>Mis artículos</h1>
                <table border="1">
                    <tr>
                        <th>Nombre</th>
                        <th>Precio</th>
                    </tr>
                    <xsl:for-each select="articulos/articulo">
                        <tr>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="precio"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>