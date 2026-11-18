# 2. Formatos de intercambio

## 2.1. Interoperabilidad

La interoperabilidad es la capacidad de sistemas diferentes para intercambiar y utilizar información.

Un formato de intercambio debe definir:

- Cómo se organizan los datos.
- Cómo se representan los tipos.
- Qué codificación se utiliza.
- Cómo se interpretan los campos.

## 2.2. Conjunto de datos

Utilizaremos mediciones de sensores ambientales:

| estación | fecha | temperatura | humedad |
|---|---|---:|---:|
| TF-NORTE-01 | 2026-11-18 | 21.4 | 68 |
| TF-SUR-02 | 2026-11-18 | 24.8 | 51 |

## 2.3. XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mediciones fecha="2026-11-18">
  <medicion estacion="TF-NORTE-01">
    <temperatura unidad="C">21.4</temperatura>
    <humedad unidad="porcentaje">68</humedad>
  </medicion>
  <medicion estacion="TF-SUR-02">
    <temperatura unidad="C">24.8</temperatura>
    <humedad unidad="porcentaje">51</humedad>
  </medicion>
</mediciones>
```

Ventajas:

- Permite estructuras jerárquicas.
- Admite espacios de nombres.
- Puede validarse con DTD o XSD.
- Diferencia elementos y atributos.
- Incluye comentarios.

Inconvenientes:

- Es más verboso.
- Requiere escapar caracteres.
- Puede ocupar más espacio.

## 2.4. JSON

```json
{
  "fecha": "2026-11-18",
  "mediciones": [
    {
      "estacion": "TF-NORTE-01",
      "temperatura": 21.4,
      "humedad": 68
    },
    {
      "estacion": "TF-SUR-02",
      "temperatura": 24.8,
      "humedad": 51
    }
  ]
}
```

Ventajas:

- Sintaxis compacta.
- Integración directa con JavaScript.
- Tipos básicos claros.
- Muy habitual en API web.

Inconvenientes:

- No tiene atributos separados de los campos.
- Los comentarios no forman parte del JSON estándar.
- La validación requiere mecanismos adicionales.

## 2.5. CSV

```csv
estacion,fecha,temperatura,humedad
TF-NORTE-01,2026-11-18,21.4,68
TF-SUR-02,2026-11-18,24.8,51
```

Ventajas:

- Muy sencillo.
- Adecuado para tablas.
- Compatible con hojas de cálculo.
- Ocupa poco espacio.

Inconvenientes:

- No representa bien jerarquías.
- Los tipos no están explícitos.
- Hay variantes de separador y escape.
- Puede haber problemas con comas y saltos de línea.

## 2.6. YAML

```yaml
fecha: 2026-11-18
mediciones:
  - estacion: TF-NORTE-01
    temperatura: 21.4
    humedad: 68
  - estacion: TF-SUR-02
    temperatura: 24.8
    humedad: 51
```

Ventajas:

- Resulta legible.
- Admite comentarios.
- Es frecuente en configuración.
- Representa colecciones y objetos.

Inconvenientes:

- La indentación es significativa.
- Tiene una sintaxis más amplia.
- Un error de espacios puede cambiar la estructura.

## 2.7. Comparación

| Característica | XML | JSON | CSV | YAML |
|---|---|---|---|---|
| Jerarquías | Excelente | Excelente | Limitada | Excelente |
| Atributos | Sí | No diferenciados | No | No diferenciados |
| Validación formal | DTD/XSD | JSON Schema | Externa | Externa |
| Comentarios | Sí | No estándar | No estándar | Sí |
| Uso habitual | Documentos e intercambio | API web | Datos tabulares | Configuración |
| Verbosidad | Alta | Media | Baja | Media |

## 2.8. Conversión y pérdida de información

Convertir formatos no siempre es reversible.

XML:

```xml
<temperatura unidad="C">21.4</temperatura>
```

Posible JSON:

```json
{
  "temperatura": {
    "valor": 21.4,
    "unidad": "C"
  }
}
```

La conversión debe decidir cómo representar el atributo y el texto. Diferentes herramientas pueden tomar decisiones distintas.

## 2.9. Tipos de datos

XML sin esquema trata normalmente el contenido como texto:

```xml
<temperatura>21.4</temperatura>
```

JSON distingue:

```json
{
  "temperatura": 21.4,
  "activa": true,
  "observacion": null
}
```

En XML Schema pueden declararse tipos:

```xml
<xs:element name="temperatura" type="xs:decimal"/>
```

## 2.10. Codificación

Se recomienda UTF-8:

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

Una codificación incoherente puede producir caracteres incorrectos:

```text
precipitación → precipitaciÃ³n
```

## 2.11. Elegir formato

- XML: documentos jerárquicos, validación y estándares.
- JSON: API y aplicaciones web.
- CSV: tablas sencillas y exportaciones.
- YAML: configuración legible.

La elección debe basarse en los requisitos, no en preferencias personales.

## 2.12. Actividades

1. Representa tres estaciones meteorológicas en XML y JSON.
2. Explica qué formato elegirías para una hoja de cálculo.
3. Indica información que podría perderse al convertir XML a CSV.
4. Propón un caso apropiado para YAML.
5. Compara la representación de valores nulos en XML y JSON.

