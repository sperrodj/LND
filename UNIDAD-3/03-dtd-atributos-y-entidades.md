# 3. DTD: atributos, entidades y modularización

[← Anterior](02-dtd-elementos.md) · [Volver al índice](README.md) · [Siguiente →](04-xsd-fundamentos.md)

## 3.1. Declaración de atributos

Los atributos se declaran mediante `ATTLIST`:

```dtd
<!ATTLIST elemento atributo tipo condición>
```

Ejemplo:

```dtd
<!ATTLIST plato id ID #REQUIRED>
```

Esto indica que cada `plato` debe tener un atributo `id`, cuyo valor actúa como identificador.

Una declaración puede incluir varios atributos:

```dtd
<!ATTLIST plato
  id ID #REQUIRED
  recomendado (si | no) "no"
  vegetariano (si | no) "no">
```

## 3.2. Condiciones de los atributos

### Atributo obligatorio

```dtd
<!ATTLIST plato id ID #REQUIRED>
```

Debe aparecer en todos los elementos `plato`.

### Atributo opcional

```dtd
<!ATTLIST plato picante CDATA #IMPLIED>
```

Puede aparecer o no.

### Valor predeterminado

```dtd
<!ATTLIST plato disponible (si | no) "si">
```

Si no se especifica, el procesador puede considerar `si` como valor predeterminado.

### Valor fijo

```dtd
<!ATTLIST precio moneda CDATA #FIXED "EUR">
```

Si aparece, debe utilizar `EUR`; un procesador validador también puede aportar el valor cuando se omite.

## 3.3. Tipos de atributos habituales

| Tipo | Uso |
|---|---|
| `CDATA` | Texto sin restricciones específicas de DTD |
| `ID` | Identificador único dentro del documento |
| `IDREF` | Referencia a un valor declarado como `ID` |
| `IDREFS` | Lista de referencias a identificadores |
| `NMTOKEN` | Palabra compatible con las reglas de nombres XML |
| Enumeración | Un valor entre varias opciones |

### `CDATA`

```dtd
<!ATTLIST seccion tipo CDATA #REQUIRED>
```

No debe confundirse el tipo de atributo `CDATA` con una sección `<![CDATA[...]]>` del documento XML.

### Enumeraciones

```dtd
<!ATTLIST seccion tipo (entrantes | principales | postres | bebidas) #REQUIRED>
```

Solo se aceptan esos cuatro valores.

### `ID`

```dtd
<!ATTLIST plato id ID #REQUIRED>
```

Reglas importantes:

- No puede repetirse en el documento.
- Su valor debe cumplir las reglas de nombre XML.
- Un elemento solo puede tener un atributo de tipo `ID`.
- Valores como `P01` son adecuados; un valor que comience por número puede no ser válido como `ID`.

### `IDREF`

Permite relacionar un elemento con otro:

```dtd
<!ELEMENT recomendacion EMPTY>
<!ATTLIST recomendacion plato IDREF #REQUIRED>
```

```xml
<plato id="P01">
  ...
</plato>
<recomendacion plato="P01"/>
```

El valor de `plato` debe coincidir con algún `ID` existente.

## 3.4. DTD completa de la carta

```dtd
<!ELEMENT carta (informacion, seccion+, pie?)>
<!ATTLIST carta nombre CDATA #REQUIRED>

<!ELEMENT informacion (eslogan, ubicacion, horario?, telefono?)>
<!ELEMENT eslogan (#PCDATA)>
<!ELEMENT ubicacion (#PCDATA)>
<!ELEMENT horario (#PCDATA)>
<!ELEMENT telefono (#PCDATA)>

<!ELEMENT seccion (titulo, plato+)>
<!ATTLIST seccion
  tipo (entrantes | principales | postres | bebidas) #REQUIRED>

<!ELEMENT titulo (#PCDATA)>
<!ELEMENT plato (nombre, descripcion?, precio)>
<!ATTLIST plato
  id ID #REQUIRED
  recomendado (si | no) "no"
  vegetariano (si | no) "no"
  picante (si | no) "no">

<!ELEMENT nombre (#PCDATA)>
<!ELEMENT descripcion (#PCDATA)>
<!ELEMENT precio (#PCDATA)>
<!ATTLIST precio moneda (EUR | USD | GBP) "EUR">

<!ELEMENT pie (aviso+)>
<!ELEMENT aviso (#PCDATA)>
```

DTD puede asegurar que `precio` contenga texto, pero no puede exigir que ese texto sea un decimal positivo. Esta limitación se resolverá con XSD.

## 3.5. Entidades generales

Una entidad permite asignar un nombre a un texto reutilizable:

```dtd
<!ENTITY restaurante "El Caldero del Teide">
```

Uso en XML:

```xml
<nombre>&restaurante;</nombre>
```

El procesador sustituye `&restaurante;` por el contenido declarado.

XML ya proporciona cinco entidades predefinidas:

| Entidad | Carácter |
|---|---|
| `&lt;` | `<` |
| `&gt;` | `>` |
| `&amp;` | `&` |
| `&quot;` | `"` |
| `&apos;` | `'` |

## 3.6. Entidades externas

Pueden referenciar contenido externo:

```dtd
<!ENTITY aviso SYSTEM "aviso.txt">
```

```xml
<pie>&aviso;</pie>
```

Actualmente, muchas aplicaciones restringen las entidades externas por razones de seguridad. No deben utilizarse para cargar recursos no confiables.

## 3.7. Entidades parámetro

Las entidades parámetro se usan dentro de la DTD y comienzan con `%`:

```dtd
<!ENTITY % estados "(si | no)">

<!ATTLIST plato
  recomendado %estados; "no"
  vegetariano %estados; "no">
```

Ayudan a reutilizar fragmentos de declaraciones.

## 3.8. DTD pública y DTD de sistema

Referencia de sistema:

```xml
<!DOCTYPE carta SYSTEM "carta.dtd">
```

Referencia pública:

```xml
<!DOCTYPE documento PUBLIC "identificador-publico" "ubicacion.dtd">
```

`PUBLIC` utiliza un identificador público y una ubicación alternativa. Para vocabularios propios y ejercicios locales utilizaremos normalmente `SYSTEM`.

## 3.9. Limitaciones de DTD

- No está escrita en XML.
- Posee pocos tipos de datos.
- No distingue adecuadamente números, fechas o booleanos.
- No permite restricciones como precio mínimo o longitud máxima.
- Su soporte para espacios de nombres es limitado.
- Algunos modelos de contenido complejos son difíciles de mantener.

DTD sigue siendo útil para comprender estructuras, cardinalidades, atributos e identificadores, además de aparecer en tecnologías y documentos existentes.

## 3.10. Errores frecuentes

- Declarar dos valores iguales de tipo `ID`.
- Usar un `IDREF` cuyo destino no existe.
- Escribir una enumeración separada por comas en vez de `|`.
- Confundir `#REQUIRED`, `#IMPLIED` y `#FIXED`.
- Declarar como `ID` valores que empiezan por números.
- Suponer que `CDATA` valida números o fechas.
- Olvidar declarar un atributo presente en el XML.

## 3.11. Lista de comprobación DTD

- [ ] `DOCTYPE` coincide con la raíz.
- [ ] Todos los elementos están declarados.
- [ ] El orden coincide con el XML.
- [ ] Las cardinalidades reflejan los requisitos.
- [ ] Los atributos obligatorios usan `#REQUIRED`.
- [ ] Los valores cerrados usan enumeraciones.
- [ ] Los identificadores usan `ID` y no se repiten.
- [ ] Las referencias apuntan a identificadores existentes.

---

[← Anterior](02-dtd-elementos.md) · [Siguiente: XML Schema →](04-xsd-fundamentos.md)
