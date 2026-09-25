# Bloque 1. Fundamentos de XML

[← Índice](README.md) · [Siguiente: sintaxis y componentes →](02-sintaxis-y-componentes.md)

## Objetivos del bloque

- Definir XML y explicar su relación con los lenguajes de marcas.
- Identificar sus características, ventajas y limitaciones.
- Reconocer aplicaciones actuales de XML.
- Comparar XML con HTML, JSON y CSV.

## 1. ¿Qué es XML?

**XML** son las siglas de *eXtensible Markup Language*, es decir, **lenguaje de marcas extensible**. Es un conjunto de reglas para representar información estructurada mediante texto.

XML no proporciona etiquetas concretas para libros, videojuegos o facturas. Permite que una organización o comunidad defina su propio vocabulario:

```xml
<videojuego>
  <titulo>Celeste</titulo>
  <plataforma>PC</plataforma>
</videojuego>
```

Los nombres `videojuego`, `titulo` y `plataforma` han sido elegidos para ese dominio.

> [!NOTE]
> XML es un **metalenguaje**: proporciona reglas para crear lenguajes o vocabularios de marcas especializados.

## 2. Objetivos de diseño de XML

XML fue diseñado para facilitar el intercambio y procesamiento de documentos estructurados. Entre sus ideas principales destacan:

- Ser utilizable a través de Internet.
- Permitir diferentes tipos de aplicaciones.
- Ser compatible con estándares relacionados.
- Facilitar la creación de programas que procesen documentos.
- Mantener los documentos comprensibles para personas.
- Evitar características innecesariamente complejas.
- Permitir que los documentos se creen con herramientas sencillas.

Esto no significa que XML sea siempre la opción más breve, sino que prioriza la claridad estructural y la interoperabilidad.

## 3. Características principales

### 3.1. Extensible

Los vocabularios pueden adaptarse a diferentes ámbitos:

```xml
<receta>
  <nombre>Potaje</nombre>
</receta>
```

```xml
<incidencia>
  <prioridad>alta</prioridad>
</incidencia>
```

Ambos documentos siguen reglas XML aunque utilicen etiquetas distintas.

### 3.2. Autodescriptivo

Los nombres aportan contexto:

```xml
<precio moneda="EUR">29.95</precio>
```

El documento indica que `29.95` es un precio y que está expresado en euros. No obstante, la interpretación exacta sigue dependiendo del acuerdo entre emisor y receptor.

### 3.3. Jerárquico

Los elementos se anidan formando un árbol:

```xml
<catalogo>
  <videojuego>
    <titulo>Hades</titulo>
  </videojuego>
</catalogo>
```

`catalogo` contiene a `videojuego`, que contiene a `titulo`.

### 3.4. Basado en texto

Un documento XML puede abrirse con cualquier editor de texto. Esto facilita su transporte, revisión y control de versiones.

### 3.5. Independiente de plataforma

Puede intercambiarse entre aplicaciones desarrolladas con distintos lenguajes y sistemas operativos, siempre que compartan las reglas del vocabulario.

### 3.6. Estricto

XML no permite ignorar libremente los errores de sintaxis. Si las etiquetas están mal cerradas o anidadas, el procesador debe informar del problema.

```xml
<!-- Incorrecto -->
<titulo>Celeste</Titulo>
```

XML distingue mayúsculas y minúsculas, por lo que `titulo` y `Titulo` son nombres diferentes.

## 4. XML no es una base de datos

XML puede almacenar información, pero no es por sí mismo un sistema gestor de bases de datos. Un archivo XML:

- No gestiona automáticamente usuarios ni permisos.
- No proporciona transacciones por sí solo.
- No resuelve concurrencia.
- No ofrece necesariamente consultas eficientes sobre grandes volúmenes.

Puede ser adecuado para intercambiar o conservar un conjunto de datos, mientras que una base de datos suele ser preferible para información cambiante, relacionada y consultada con frecuencia.

## 5. Aplicaciones de XML

XML continúa utilizándose en numerosos entornos:

- Intercambio de información entre organizaciones.
- Facturación electrónica y documentos administrativos.
- Servicios web SOAP.
- Configuración de aplicaciones y herramientas.
- Formatos ofimáticos como `.docx`, `.xlsx` y `.odt`.
- Gráficos SVG.
- Sindicación mediante RSS y Atom.
- Construcción de proyectos, como algunos archivos de Maven.
- Documentación técnica.
- Mapas de sitios web (`sitemap.xml`).

### Ejemplo: mapa de un sitio web

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://ejemplo.com/</loc>
  </url>
</urlset>
```

Los buscadores pueden utilizar este documento para conocer direcciones del sitio.

## 6. Ventajas y limitaciones

| Ventajas | Limitaciones |
|---|---|
| Estructura explícita y jerárquica | Puede resultar verboso |
| Legible por personas y programas | Normalmente ocupa más que JSON o CSV |
| Vocabularios extensibles | Requiere respetar reglas estrictas |
| Amplio ecosistema de validación y transformación | El procesamiento puede consumir más recursos |
| Admite contenido documental y datos | No es la mejor opción para todos los casos |
| Espacios de nombres para combinar vocabularios | Su ecosistema puede parecer complejo al comenzar |

## 7. XML frente a HTML

| Aspecto | XML | HTML |
|---|---|---|
| Finalidad | Representar información estructurada | Estructurar contenido web |
| Etiquetas | Las define el vocabulario | Están definidas por el estándar HTML |
| Errores | Procesamiento estricto | El navegador intenta recuperarse |
| Mayúsculas | Distingue mayúsculas y minúsculas | Los nombres HTML no suelen distinguirlas en documentos HTML |
| Presentación | No define una presentación visual predeterminada | El navegador aplica estilos predeterminados |

```xml
<titulo>Mi catálogo</titulo>
```

En XML, `titulo` solo posee el significado acordado por el vocabulario. El navegador no sabe automáticamente cómo presentarlo.

## 8. XML frente a JSON y CSV

### XML

```xml
<videojuego id="V001">
  <titulo>Celeste</titulo>
  <precio>19.99</precio>
</videojuego>
```

### JSON

```json
{
  "id": "V001",
  "titulo": "Celeste",
  "precio": 19.99
}
```

### CSV

```csv
id,titulo,precio
V001,Celeste,19.99
```

| Necesidad | XML | JSON | CSV |
|---|---:|---:|---:|
| Jerarquías complejas | Muy adecuado | Adecuado | Poco adecuado |
| Contenido documental mixto | Muy adecuado | Poco natural | No adecuado |
| API web moderna | Posible | Muy habitual | Poco habitual |
| Datos tabulares simples | Posible | Posible | Muy adecuado |
| Atributos y espacios de nombres | Sí | No de forma nativa | No |
| Ecosistema de esquemas y transformaciones | Muy amplio | Disponible | Limitado |

La elección debe basarse en los requisitos y estándares del proyecto.

## 9. Tecnologías de la familia XML

Durante el módulo aparecerán varias tecnologías relacionadas:

| Tecnología | Finalidad |
|---|---|
| DTD | Definir reglas estructurales básicas |
| XML Schema (XSD) | Definir estructura y tipos de datos |
| XPath | Seleccionar partes de un documento |
| XSLT | Transformar documentos XML |
| XQuery | Consultar y construir información XML |
| SVG | Representar gráficos vectoriales |
| RSS y Atom | Sindicar contenidos |

En esta unidad solo necesitamos conocer su propósito general.

## Comprueba tu aprendizaje

1. Explica por qué XML se considera extensible.
2. Indica tres aplicaciones actuales de XML.
3. ¿Por qué no debemos considerar XML una base de datos?
4. Señala una situación adecuada para XML, otra para JSON y otra para CSV.
5. Explica dos diferencias entre HTML y XML.

---

[← Índice](README.md) · [Siguiente: sintaxis y componentes →](02-sintaxis-y-componentes.md)
