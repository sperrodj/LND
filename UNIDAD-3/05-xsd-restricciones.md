# 5. XML Schema: tipos, restricciones y reutilización

[← Anterior](04-xsd-fundamentos.md) · [Volver al índice](README.md) · [Siguiente →](06-validacion-y-errores.md)

## 5.1. Tipos simples propios

Un tipo simple personalizado restringe un tipo existente:

```xml
<xs:simpleType name="tipoMoneda">
  <xs:restriction base="xs:string">
    <xs:enumeration value="EUR"/>
    <xs:enumeration value="USD"/>
    <xs:enumeration value="GBP"/>
  </xs:restriction>
</xs:simpleType>
```

Uso:

```xml
<xs:attribute name="moneda" type="tipoMoneda"/>
```

## 5.2. Enumeraciones

Permiten limitar un valor a una lista cerrada:

```xml
<xs:simpleType name="tipoSeccion">
  <xs:restriction base="xs:string">
    <xs:enumeration value="entrantes"/>
    <xs:enumeration value="principales"/>
    <xs:enumeration value="postres"/>
    <xs:enumeration value="bebidas"/>
  </xs:restriction>
</xs:simpleType>
```

## 5.3. Restricciones numéricas

```xml
<xs:simpleType name="tipoPrecio">
  <xs:restriction base="xs:decimal">
    <xs:minExclusive value="0"/>
    <xs:maxInclusive value="500"/>
    <xs:fractionDigits value="2"/>
  </xs:restriction>
</xs:simpleType>
```

El precio debe ser mayor que 0, menor o igual que 500 y tener como máximo dos cifras decimales.

Facetas numéricas habituales:

| Faceta | Significado |
|---|---|
| `minInclusive` | Mínimo incluido |
| `minExclusive` | Mínimo excluido |
| `maxInclusive` | Máximo incluido |
| `maxExclusive` | Máximo excluido |
| `totalDigits` | Número total máximo de cifras |
| `fractionDigits` | Máximo de cifras decimales |

## 5.4. Longitud del texto

```xml
<xs:simpleType name="tipoNombrePlato">
  <xs:restriction base="xs:string">
    <xs:minLength value="3"/>
    <xs:maxLength value="60"/>
  </xs:restriction>
</xs:simpleType>
```

Facetas:

- `length`: longitud exacta.
- `minLength`: longitud mínima.
- `maxLength`: longitud máxima.

## 5.5. Patrones

`xs:pattern` utiliza expresiones regulares de XML Schema:

```xml
<xs:simpleType name="tipoCodigoPlato">
  <xs:restriction base="xs:string">
    <xs:pattern value="[A-Z]{1,2}[0-9]{2}"/>
  </xs:restriction>
</xs:simpleType>
```

Valores válidos: `P01`, `EN12`. Valor inválido: `plato-1`.

Las expresiones regulares de XSD no son idénticas a las de JavaScript. Conviene probar cada patrón con el validador utilizado.

## 5.6. Espacios en blanco

```xml
<xs:whiteSpace value="collapse"/>
```

Valores posibles:

- `preserve`: conserva los espacios.
- `replace`: sustituye tabulaciones y saltos por espacios.
- `collapse`: además elimina extremos y agrupa espacios consecutivos.

## 5.7. Tipos complejos con nombre

En lugar de anidar toda la estructura, podemos crear tipos reutilizables:

```xml
<xs:complexType name="tipoPlato">
  <xs:sequence>
    <xs:element name="nombre" type="tipoNombrePlato"/>
    <xs:element name="descripcion"
                type="xs:string"
                minOccurs="0"/>
    <xs:element name="precio" type="tipoPrecio"/>
  </xs:sequence>
  <xs:attribute name="id"
                type="tipoCodigoPlato"
                use="required"/>
  <xs:attribute name="vegetariano"
                type="xs:boolean"
                default="false"/>
</xs:complexType>
```

Uso:

```xml
<xs:element name="plato" type="tipoPlato"/>
```

## 5.8. Extensión de tipos

Un tipo puede ampliar otro:

```xml
<xs:complexType name="tipoPlatoDestacado">
  <xs:complexContent>
    <xs:extension base="tipoPlato">
      <xs:attribute name="mensaje" type="xs:string"/>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```

La extensión hereda la estructura de `tipoPlato` y añade un atributo.

## 5.9. Elemento con texto y atributos

`precio` contiene texto decimal y además un atributo `moneda`. Necesitamos `simpleContent`:

```xml
<xs:complexType name="tipoPrecioConMoneda">
  <xs:simpleContent>
    <xs:extension base="tipoPrecio">
      <xs:attribute name="moneda"
                    type="tipoMoneda"
                    default="EUR"/>
    </xs:extension>
  </xs:simpleContent>
</xs:complexType>
```

Uso:

```xml
<xs:element name="precio" type="tipoPrecioConMoneda"/>
```

## 5.10. Valores únicos y referencias

`xs:ID` ya obliga a que los identificadores sean únicos. XSD también posee mecanismos más generales:

- `xs:unique`: exige valores únicos.
- `xs:key`: define una clave obligatoria.
- `xs:keyref`: referencia una clave.

Ejemplo conceptual:

```xml
<xs:key name="clavePlato">
  <xs:selector xpath="seccion/plato"/>
  <xs:field xpath="@codigo"/>
</xs:key>
```

Estos XPath son una versión restringida utilizada por XSD. Se estudiará XPath con mayor profundidad en una unidad posterior.

## 5.11. `nillable` y ausencia

No es lo mismo que un elemento no aparezca a que aparezca sin valor:

```xml
<xs:element name="descripcion"
            type="xs:string"
            minOccurs="0"
            nillable="true"/>
```

- `minOccurs="0"`: el elemento puede faltar.
- `nillable="true"`: puede aparecer indicando ausencia mediante `xsi:nil="true"`.

```xml
<descripcion xsi:nil="true"/>
```

No conviene utilizar `nil` si simplemente puede omitirse el elemento.

## 5.12. XSD modular

Un esquema grande puede dividirse:

```xml
<xs:include schemaLocation="tipos-comunes.xsd"/>
```

`xs:include` incorpora otro esquema del mismo espacio de nombres. `xs:import` se utiliza normalmente para esquemas de espacios de nombres diferentes.

## 5.13. Fragmento mejorado para la carta

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xs:simpleType name="tipoSeccion">
    <xs:restriction base="xs:string">
      <xs:enumeration value="entrantes"/>
      <xs:enumeration value="principales"/>
      <xs:enumeration value="postres"/>
      <xs:enumeration value="bebidas"/>
    </xs:restriction>
  </xs:simpleType>

  <xs:simpleType name="tipoPrecio">
    <xs:restriction base="xs:decimal">
      <xs:minExclusive value="0"/>
      <xs:fractionDigits value="2"/>
    </xs:restriction>
  </xs:simpleType>

  <xs:complexType name="tipoPrecioConMoneda">
    <xs:simpleContent>
      <xs:extension base="tipoPrecio">
        <xs:attribute name="moneda" default="EUR">
          <xs:simpleType>
            <xs:restriction base="xs:string">
              <xs:enumeration value="EUR"/>
              <xs:enumeration value="USD"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:attribute>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>

</xs:schema>
```

## 5.14. DTD o XSD

Utiliza DTD cuando:

- Necesites una regla estructural pequeña y sencilla.
- Mantengas documentos antiguos que ya la utilicen.
- Quieras aprender modelos de contenido de forma compacta.

Utiliza XSD cuando:

- Necesites tipos de datos.
- Debas restringir rangos, longitudes o patrones.
- Trabajes con espacios de nombres.
- Quieras reutilizar y ampliar tipos.
- Necesites una validación más precisa.

## 5.15. Errores frecuentes

- Definir `precio` como elemento simple y después intentar añadirle atributos.
- Usar `minInclusive` cuando el límite no debe aceptarse.
- Pensar que `fractionDigits="2"` obliga a mostrar siempre dos decimales; marca un máximo, no un formato visual.
- Confundir `minOccurs` con el valor mínimo numérico.
- Aplicar una restricción a un tipo base incompatible.
- Declarar un tipo después o antes pensando que el orden siempre importa: las declaraciones globales pueden referenciarse por nombre.

---

[← Anterior](04-xsd-fundamentos.md) · [Siguiente: validación y errores →](06-validacion-y-errores.md)
