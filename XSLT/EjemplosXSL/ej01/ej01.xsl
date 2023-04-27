<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="documento">
		<html>
			<head>
				<title>transformación de XML</title>
			</head>
			<body>
				<h1>
					<xsl:value-of select="parrafo"/>
				</h1>
			</body>
		</html>
	</xsl:template> 
</xsl:stylesheet>