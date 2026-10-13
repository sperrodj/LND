# 1. Documentos bien formados y documentos válidos

[← Volver al índice](README.md) · [Siguiente: DTD y elementos →](02-dtd-elementos.md)

## 1.1. ¿Por qué necesitamos validar?

XML permite crear etiquetas propias. Esta flexibilidad resulta útil, pero introduce un problema: dos personas pueden representar la misma información de maneras incompatibles.

```xml
<plato>
  <nombre>Papas arrugadas</nombre>
  <precio>6.50</precio>
</plato>
```

```xml
<producto nombre="Papas arrugadas" coste="seis euros y medio"/>
```

Los dos fragmentos pueden estar bien formados, pero una aplicación preparada para leer `plato`, `nombre` y `precio` no entenderá el segundo.

La validación permite acordar un **contrato**:

- Qué elementos pueden aparecer.
- En qué orden deben aparecer.
- Cuántas veces pueden repetirse.
- Qué atributos están permitidos u obligados.
- Qué tipos de valores pueden almacenarse.

## 1.2. Documento bien formado

Un documento está **bien formado** cuando cumple las reglas sintácticas de XML.

Entre otras condiciones:

1. Posee un único elemento raíz.
2. Todas las etiquetas abiertas se cierran.
3. Los elementos están correctamente anidados.
4. Las etiquetas distinguen mayúsculas y minúsculas.
5. Los atributos tienen valores entre comillas.
6. Un atributo no se repite dentro del mismo elemento.
7. Los caracteres reservados se escriben mediante entidades cuando es necesario.

Ejemplo bien formado:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<plato disponible="true">
  <nombre>Queso asado</nombre>
  <precio>8.50</precio>
</plato>
```

Ejemplo no bien formado:

```xml
<plato disponible=true>
  <nombre>Queso asado</Nombre>
  <precio>8.50
</plato>
```

Presenta tres problemas: el atributo no tiene comillas, el cierre de `nombre` no coincide y `precio` no se cierra.

## 1.3. Documento válido

Un documento XML es **válido** cuando:

1. Está bien formado.
2. Está asociado a una DTD o a un esquema XSD.
3. Cumple todas las reglas definidas en esa DTD o XSD.

Por tanto:

> Todo documento válido debe estar bien formado, pero un documento bien formado no tiene por qué ser válido.

Supongamos que el esquema exige el orden `nombre`, `descripcion`, `precio`:

```xml
<plato>
  <precio>8.50</precio>
  <nombre>Queso asado</nombre>
</plato>
```

El fragmento está bien formado, pero no sería válido porque:

- El orden es incorrecto.
- Falta `descripcion`.

## 1.4. Validador XML

Un **validador** es una herramienta que compara un documento XML con sus reglas.

El proceso tiene dos fases:

1. El analizador comprueba la buena formación.
2. Si la sintaxis es correcta, comprueba las reglas de la DTD o XSD.

Un validador no decide si los datos son verdaderos. Puede comprobar que un precio sea decimal y positivo, pero no que coincida con el precio real del restaurante.

## 1.5. Vocabulario XML

Un **vocabulario XML** es un conjunto de nombres y reglas utilizados para representar información de un ámbito concreto.

Ejemplos:

- SVG representa gráficos vectoriales.
- RSS y Atom representan canales de contenidos.
- XHTML representa páginas web mediante sintaxis XML.
- Un vocabulario propio puede representar facturas, videojuegos, recetas o cartas de restaurante.

DTD y XSD permiten documentar formalmente ese vocabulario.

## 1.6. DTD frente a XSD: primera comparación

| Característica | DTD | XSD |
|---|---|---|
| Sintaxis | Propia, distinta de XML | Escrita en XML |
| Facilidad inicial | Más sencilla y compacta | Más extensa |
| Tipos de datos | Muy limitados | Numerosos tipos |
| Restricciones numéricas | No | Sí |
| Espacios de nombres | Soporte limitado | Soporte completo |
| Reutilización | Básica | Tipos y grupos reutilizables |
| Uso didáctico | Comprender estructura y cardinalidad | Validación precisa y profesional |

No son dos pasos obligatorios para cada proyecto. Normalmente se elige una tecnología. En esta unidad utilizaremos DTD para introducir la lógica de validación y XSD para aplicar reglas más precisas.

## 1.7. Errores sintácticos y errores de validación

### Error sintáctico

```xml
<nombre>Queso asado</plato>
```

El analizador no puede construir el árbol XML.

### Error de validación

```xml
<precio>gratis</precio>
```

Puede estar bien formado, pero será inválido si XSD exige un número decimal.

Esta diferencia es importante al interpretar mensajes de VS Code: primero debemos resolver los errores de sintaxis y después los de validación.

## 1.8. Comprobación rápida

Indica si cada afirmación es verdadera o falsa:

1. Un XML válido puede tener dos elementos raíz.
2. Un XML bien formado siempre es válido.
3. XSD puede limitar un valor a un tipo numérico.
4. Un validador puede comprobar que una fecha realmente ocurrió.
5. DTD y XSD describen reglas para documentos XML.

Respuestas: 1 falsa, 2 falsa, 3 verdadera, 4 falsa, 5 verdadera.

---

[← Volver al índice](README.md) · [Siguiente: DTD y elementos →](02-dtd-elementos.md)
