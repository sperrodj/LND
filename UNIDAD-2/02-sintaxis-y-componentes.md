# Bloque 2. Sintaxis y componentes de XML

[← Fundamentos](01-fundamentos-xml.md) · [Siguiente: estructura y diseño →](03-estructura-y-diseno.md)

## Objetivos del bloque

- Reconocer las partes de un documento XML.
- Escribir elementos, atributos y contenido correctamente.
- Aplicar las reglas de nombres de XML.
- Utilizar comentarios, entidades, CDATA e instrucciones de procesamiento.

## 1. Documento XML mínimo

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo />
```

Contiene dos partes:

1. La **declaración XML**, que informa al procesador.
2. El **elemento raíz**, que contiene conceptualmente todo el documento.

## 2. Declaración XML

La declaración suele aparecer en la primera línea:

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

### Atributos habituales

- `version`: versión de XML utilizada. Habitualmente será `1.0`.
- `encoding`: codificación de caracteres, normalmente `UTF-8`.
- `standalone`: indica si el documento depende de declaraciones externas.

Ejemplo:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
```

> [!IMPORTANT]
> Si aparece, la declaración debe situarse al comienzo. No debe haber espacios ni líneas en blanco antes de ella.

La declaración es recomendable, aunque puede omitirse en determinadas condiciones. En las prácticas la incluiremos para hacer explícitas la versión y la codificación.

## 3. Elementos

Un elemento suele estar formado por etiqueta de apertura, contenido y etiqueta de cierre:

```xml
<titulo>Celeste</titulo>
```

- Etiqueta inicial: `<titulo>`
- Contenido: `Celeste`
- Etiqueta final: `</titulo>`
- Elemento completo: `<titulo>Celeste</titulo>`

### 3.1. Elementos vacíos

Si un elemento no contiene texto ni hijos, puede escribirse de dos formas equivalentes:

```xml
<agotado></agotado>
```

```xml
<agotado />
```

La segunda forma se denomina **elemento vacío autocerrado**.

### 3.2. Contenido de un elemento

Un elemento puede contener:

- Texto.
- Otros elementos.
- Texto y elementos mezclados.
- Nada.

```xml
<descripcion>Una aventura de plataformas.</descripcion>
```

```xml
<videojuego>
  <titulo>Celeste</titulo>
  <precio>19.99</precio>
</videojuego>
```

```xml
<descripcion>Una aventura <destacado>muy exigente</destacado>.</descripcion>
```

El último caso contiene **contenido mixto**.

## 4. Reglas para los nombres

Los nombres de elementos y atributos:

- Distinguen mayúsculas y minúsculas.
- Deben comenzar por una letra o guion bajo.
- Pueden contener letras, números, guiones, guiones bajos y puntos.
- No pueden contener espacios.
- No deben comenzar por la secuencia `xml`, en ninguna combinación de mayúsculas y minúsculas.
- No deben utilizar `:` salvo para trabajar correctamente con espacios de nombres.

| Nombre | ¿Recomendable/válido? | Motivo |
|---|---|---|
| `titulo` | Sí | Nombre sencillo y descriptivo |
| `precio-final` | Sí | El guion está permitido |
| `_codigo` | Sí | Puede comenzar por guion bajo |
| `2jugadores` | No | Comienza por número |
| `precio final` | No | Contiene un espacio |
| `xmlDatos` | No | Comienza por `xml` |

Conviene usar nombres significativos y una convención coherente:

```xml
<fecha_lanzamiento>...</fecha_lanzamiento>
```

o bien:

```xml
<fecha-lanzamiento>...</fecha-lanzamiento>
```

## 5. Atributos

Los atributos proporcionan información asociada a un elemento:

```xml
<videojuego id="V001" disponible="true">
  <titulo>Celeste</titulo>
</videojuego>
```

- `id` y `disponible` son atributos.
- `V001` y `true` son sus valores.

### Reglas básicas

- Se escriben en la etiqueta de apertura o en un elemento vacío.
- Su valor debe ir entre comillas simples o dobles.
- Un elemento no puede repetir dos atributos con el mismo nombre.
- El orden de los atributos no debería aportar significado.

```xml
<!-- Correcto -->
<precio moneda="EUR">19.99</precio>

<!-- Incorrecto: valor sin comillas -->
<precio moneda=EUR>19.99</precio>
```

## 6. ¿Elemento o atributo?

No existe una única regla universal. Una decisión razonable consiste en utilizar:

- **Elementos** para la información principal que puede crecer o estructurarse.
- **Atributos** para identificadores, propiedades breves o metadatos del elemento.

```xml
<videojuego id="V001">
  <titulo>Celeste</titulo>
  <desarrolladora>Extremely OK Games</desarrolladora>
</videojuego>
```

Podríamos representar el título como atributo, pero limitaríamos su capacidad para incorporar estructura.

### Comparación

```xml
<persona nombre="Alex" />
```

```xml
<persona>
  <nombre>Alex</nombre>
</persona>
```

La segunda opción permite añadir después apellidos, idioma u otras marcas dentro de `nombre`. La primera es más compacta. La elección debe documentarse y mantenerse de manera consistente.

## 7. Comentarios

```xml
<!-- Catálogo actualizado semanalmente -->
```

Reglas principales:

- Comienzan por `<!--` y terminan en `-->`.
- No pueden contener la secuencia `--` en su interior.
- No pueden aparecer antes de la declaración XML.
- No deben guardar información sensible.

```xml
<!-- Incorrecto -- comentario interno -->
```

## 8. Caracteres reservados y entidades predefinidas

Algunos caracteres se reservan para la sintaxis:

| Carácter | Referencia | Uso |
|---|---|---|
| `<` | `&lt;` | Menor que |
| `>` | `&gt;` | Mayor que |
| `&` | `&amp;` | Ampersand |
| `"` | `&quot;` | Comillas dobles |
| `'` | `&apos;` | Apóstrofo/comilla simple |

Ejemplo:

```xml
<condicion>edad &gt;= 18 &amp;&amp; activo</condicion>
```

El carácter `<` no puede escribirse directamente como texto porque el analizador podría interpretarlo como inicio de una etiqueta.

## 9. Referencias numéricas de caracteres

También se puede indicar un carácter mediante su código Unicode:

```xml
<simbolo>&#169;</simbolo>
<simbolo>&#x00A9;</simbolo>
```

Ambas referencias representan `©`: la primera utiliza decimal y la segunda hexadecimal.

## 10. Secciones CDATA

Una sección CDATA permite incluir texto con caracteres como `<` o `&` sin interpretarlos como marcas:

```xml
<codigo><![CDATA[
if (edad < 18 && permiso) {
  console.log("Acceso limitado");
}
]]></codigo>
```

Comienza por `<![CDATA[` y termina en `]]>`.

> [!CAUTION]
> CDATA no sirve para “arreglar” cualquier contenido ni puede contener la secuencia de cierre `]]>`. Se utiliza cuando facilita incluir fragmentos con muchos caracteres reservados.

## 11. Instrucciones de procesamiento

Una instrucción de procesamiento transmite información a una aplicación:

```xml
<?xml-stylesheet type="text/xsl" href="catalogo.xsl"?>
```

Su forma general es:

```text
<?destino datos?>
```

No debe confundirse con un elemento. La declaración XML posee una apariencia parecida, pero tiene un papel especial.

## 12. Espacios en blanco

La indentación facilita la lectura:

```xml
<catalogo>
  <videojuego>
    <titulo>Celeste</titulo>
  </videojuego>
</catalogo>
```

Los espacios incluidos en el contenido de texto pueden ser significativos para la aplicación. No debemos suponer que todos serán eliminados.

## Ejercicio de comprobación

Analiza este fragmento:

```xml
<libro isbn="978-84-0000-000-0" disponible="true">
  <titulo>Aprender XML</titulo>
  <precio moneda="EUR">24.50</precio>
  <!-- Próxima revisión: diciembre -->
</libro>
```

1. Identifica los elementos.
2. Identifica los atributos y sus valores.
3. Señala el contenido textual.
4. Explica por qué `isbn` puede ser un atributo razonable.
5. Convierte `disponible` en un elemento.

---

[← Fundamentos](01-fundamentos-xml.md) [Siguiente: estructura y diseño →](03-estructura-y-diseno.md)
