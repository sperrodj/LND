<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD XHTML 1.1//EN"
		doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"/>
	
	<xsl:template match="recetas">
		<html xml:lang="es">
			<head profile="http://www.w3.org/2005/11/profile">
				<title>Ejemplo XSLT - XML - HTML</title>
				<link rel="stylesheet" type="text/css" href="miestilo.css" />
			</head>
			<body>
				<div id="header" class="azul">
					<h1>transformacion con XSLT <span>XML -> HTML </span></h1>
				</div>

				<div id="container">
						<div id="content">
						<h1>Mis recetas de cocina canaria</h1>
						<p>Listado de mis recetas de cocina favoritas, caracteristicas y modo de elaboracion, ordenado alfabeticamente.</p>
						
						<xsl:for-each select="receta">
							<xsl:sort select="nombre" order="ascending"/>
							
							<h3>Nombre de la receta: <xsl:value-of select="nombre"/></h3>
							<p>Tipo de receta: <xsl:value-of select="tipo/@definicion"/></p>
							<p>Dificultad: <xsl:value-of select="dificultad"/></p>
							<p>Tiempo de elaboracion: <xsl:value-of select="tiempo"/></p>
							<p>Esta receta puedes elaborarla en un/a: <xsl:value-of select="elaboracion"/></p>
							<p>Calorias: <xsl:value-of select="calorias"/></p>
							
							<table summary="Lista de ingredientes necesarios para elaborar la receta">
								<caption>Listado de ingredientes de <xsl:value-of select="nombre"/></caption>
								<tr>
									<th id="header1" abbr="ingrediente">Nombre del ingrediente</th>
									<th id="header2" abbr="cantidad">Cantidad necesaria</th>
								</tr>
								<xsl:for-each select="ingredientes/ingrediente">
									<tr>
										<td headers="header1"><xsl:value-of select="@nombre"/></td>
										<td headers="header2"><xsl:value-of select="@cantidad"/></td>
									</tr>
								</xsl:for-each>
							</table>
							
							<h4>Pasos necesarios:</h4>
							<dl>
								<xsl:for-each select="pasos/paso">
									<dt>Paso numero <xsl:value-of select="@orden"/>:</dt>
									<dd><xsl:value-of select="."/></dd>
								</xsl:for-each>
							</dl>
						</xsl:for-each>
						
						</div>
                    </div>

			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>