# 4. XML Schema: fundamentos

[← Anterior](03-dtd-atributos-y-entidades.md) · [Volver al índice](README.md) · [Siguiente →](05-xsd-restricciones.md)

## 4.1. ¿Qué es XML Schema?

**XML Schema Definition (XSD)** es un lenguaje para describir y validar documentos XML.

A diferencia de DTD:

- XSD se escribe utilizando sintaxis XML.
- Ofrece tipos para texto, números, fechas, booleanos y otros valores.
- Permite crear tipos propios.
- Puede limitar valores, longitudes y rangos.
- Integra espacios de nombres.
- Facilita la reutilización de estructuras.

## 4.2. Estructura mínima de un esquema

Archivo `carta.xsd`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- Declaraciones del esquema -->

</xs:schema>
```

- `xs:schema` es la raíz.
- `xmlns:xs` asocia el prefijo `xs` con el vocabulario oficial de XML Schema.
- `xs` podría sustituirse por otro prefijo, pero es la convención más utilizada.

## 4.3. Asociar XML y XSD

En un XML sin espacio de nombres propio:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<carta
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="carta.xsd"
  nombre="El Caldero del Teide">
  ...
</carta>
```

- `xmlns:xsi` declara el vocabulario de instancias de XML Schema.
- `xsi:noNamespaceSchemaLocation` indica la ubicación del XSD cuando el documento validado no usa un espacio de nombres propio.

No debe confundirse:

- `xs`: se utiliza al escribir el esquema.
- `xsi`: se utiliza en el documento XML para indicar información relacionada con el esquema.

## 4.4. Elementos simples

Un elemento simple contiene un valor, pero no hijos ni atributos.

```xml
<xs:element name="nombre" type="xs:string"/>
```

XML válido:

```xml
<nombre>Papas arrugadas</nombre>
```

Tipos predefinidos frecuentes:

| Tipo XSD | Ejemplo |
|---|---|
| `xs:string` | `Papas arrugadas` |
| `xs:decimal` | `6.50` |
| `xs:integer` | `12` |
| `xs:positiveInteger` | `3` |
| `xs:boolean` | `true` o `false` |
| `xs:date` | `2026-10-12` |
| `xs:time` | `13:30:00` |
| `xs:dateTime` | `2026-10-12T13:30:00` |
| `xs:anyURI` | `https://ejemplo.com` |

## 4.5. Elementos complejos

Un elemento es complejo cuando contiene elementos hijos o atributos.

```xml
<xs:element name="plato">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="nombre" type="xs:string"/>
      <xs:element name="descripcion" type="xs:string"/>
      <xs:element name="precio" type="xs:decimal"/>
    </xs:sequence>
    <xs:attribute name="id" type="xs:ID" use="required"/>
  </xs:complexType>
</xs:element>
```

`xs:sequence` exige el orden declarado.

## 4.6. Cardinalidades

XSD utiliza `minOccurs` y `maxOccurs`:

```xml
<xs:element name="descripcion"
            type="xs:string"
            minOccurs="0"
            maxOccurs="1"/>
```

La descripción es opcional.

```xml
<xs:element name="plato"
            minOccurs="1"
            maxOccurs="unbounded"/>
```

Debe existir al menos un plato y no se fija un máximo.

Valores predeterminados si no se escriben:

```text
minOccurs="1"
maxOccurs="1"
```

Equivalencia aproximada:

| DTD | XSD |
|---|---|
| Sin símbolo | `minOccurs="1" maxOccurs="1"` |
| `?` | `minOccurs="0" maxOccurs="1"` |
| `*` | `minOccurs="0" maxOccurs="unbounded"` |
| `+` | `minOccurs="1" maxOccurs="unbounded"` |

## 4.7. Secuencia, elección y todos

### `xs:sequence`

Los elementos aparecen en el orden declarado:

```xml
<xs:sequence>
  <xs:element name="nombre" type="xs:string"/>
  <xs:element name="precio" type="xs:decimal"/>
</xs:sequence>
```

### `xs:choice`

Permite elegir entre alternativas:

```xml
<xs:choice>
  <xs:element name="telefono" type="xs:string"/>
  <xs:element name="correo" type="xs:string"/>
</xs:choice>
```

### `xs:all`

Permite que los elementos aparezcan en cualquier orden, con restricciones de cardinalidad:

```xml
<xs:all>
  <xs:element name="nombre" type="xs:string"/>
  <xs:element name="ubicacion" type="xs:string"/>
</xs:all>
```

En un `xs:all`, cada hijo aparece como máximo una vez en XSD 1.0.

## 4.8. Atributos

```xml
<xs:attribute name="id" type="xs:ID" use="required"/>
```

Condiciones habituales:

```xml
use="required"
use="optional"
use="prohibited"
```

Valor predeterminado:

```xml
<xs:attribute name="moneda" type="xs:string" default="EUR"/>
```

Valor fijo:

```xml
<xs:attribute name="moneda" type="xs:string" fixed="EUR"/>
```

## 4.9. Esquema XSD inicial de la carta

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xs:element name="carta">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="seccion"
                    minOccurs="1"
                    maxOccurs="unbounded">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="titulo" type="xs:string"/>
              <xs:element name="plato"
                          minOccurs="1"
                          maxOccurs="unbounded">
                <xs:complexType>
                  <xs:sequence>
                    <xs:element name="nombre" type="xs:string"/>
                    <xs:element name="descripcion"
                                type="xs:string"
                                minOccurs="0"/>
                    <xs:element name="precio" type="xs:decimal"/>
                  </xs:sequence>
                  <xs:attribute name="id"
                                type="xs:ID"
                                use="required"/>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
            <xs:attribute name="tipo"
                          type="xs:string"
                          use="required"/>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
      <xs:attribute name="nombre"
                    type="xs:string"
                    use="required"/>
    </xs:complexType>
  </xs:element>

</xs:schema>
```

Este estilo, con declaraciones anidadas, se denomina diseño local o anónimo. Funciona bien en ejemplos pequeños, pero puede resultar difícil de reutilizar. En el siguiente bloque crearemos tipos con nombre.

## 4.10. Errores frecuentes

- Utilizar `xsd:` en unas líneas y `xs:` en otras sin declarar ambos prefijos.
- Colocar atributos dentro de `xs:sequence`.
- Olvidar `maxOccurs="unbounded"` en elementos repetibles.
- Usar `xs:decimal` con una coma: debe escribirse `6.50`, no `6,50`.
- Confundir el XSD con el XML que se valida.
- Escribir `required="true"` en lugar de `use="required"`.
- Asociar el XML con una ruta de esquema incorrecta.

---

[← Anterior](03-dtd-atributos-y-entidades.md) · [Siguiente →](05-xsd-restricciones.md)
