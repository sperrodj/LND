# 6. Validación en VS Code y resolución de errores

[← Anterior](05-xsd-restricciones.md) · [Volver al índice](README.md) · [Siguiente →](07-resumen-y-ejercicios.md)

## 6.1. Preparar VS Code

Para trabajar cómodamente con XML conviene instalar una extensión que permita:

- Resaltado de sintaxis.
- Autocompletado.
- Asociación con DTD o XSD.
- Diagnóstico de errores.
- Formateo.

Una opción habitual es **XML**, de Red Hat. La disponibilidad y el nombre exacto pueden variar según el entorno instalado en el aula.

Después de instalarla, abre la carpeta completa del proyecto mediante **File → Open Folder**, no únicamente el archivo XML. Esto facilita resolver rutas relativas.

## 6.2. Estructura de archivos

Para DTD:

```text
ejercicio-dtd/
├── carta.xml
└── carta.dtd
```

Para XSD:

```text
ejercicio-xsd/
├── carta.xml
└── carta.xsd
```

## 6.3. Asociar una DTD

```xml
<!DOCTYPE carta SYSTEM "carta.dtd">
```

Debe aparecer antes del elemento raíz:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE carta SYSTEM "carta.dtd">
<carta>
  ...
</carta>
```

## 6.4. Asociar un XSD sin espacio de nombres

```xml
<carta
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:noNamespaceSchemaLocation="carta.xsd">
```

El prefijo `xsi` debe estar declarado para poder utilizar el atributo `xsi:noNamespaceSchemaLocation`.

## 6.5. Panel Problems

En VS Code puedes abrir el panel mediante:

```text
View → Problems
```

Atajo habitual:

```text
Ctrl + Shift + M
```

Los mensajes suelen incluir:

- Archivo.
- Línea y columna.
- Elemento o atributo problemático.
- Regla esperada.

No conviene corregir diez errores a la vez. Un error inicial puede provocar muchos mensajes posteriores.

## 6.6. Método para resolver errores

1. Guarda todos los archivos.
2. Resuelve primero los errores de buena formación.
3. Localiza el primer error de validación.
4. Lee qué se encontró y qué se esperaba.
5. Consulta la declaración correspondiente en DTD o XSD.
6. Corrige una sola causa.
7. Guarda y valida de nuevo.
8. Repite hasta que no queden errores.

## 6.7. Mensajes habituales en DTD

### Se esperaba otro elemento

DTD:

```dtd
<!ELEMENT plato (nombre, descripcion, precio)>
```

XML:

```xml
<plato>
  <nombre>Queso asado</nombre>
  <precio>8.50</precio>
</plato>
```

Falta `descripcion`, que es obligatoria.

### Atributo requerido ausente

DTD:

```dtd
<!ATTLIST plato id ID #REQUIRED>
```

XML:

```xml
<plato>
```

Debe añadirse un `id`.

### ID duplicado

```xml
<plato id="P01">...</plato>
<plato id="P01">...</plato>
```

Los valores `ID` deben ser únicos en todo el documento.

## 6.8. Mensajes habituales en XSD

### Valor no válido para el tipo

XSD:

```xml
<xs:element name="precio" type="xs:decimal"/>
```

XML incorrecto:

```xml
<precio>ocho euros</precio>
```

### Valor fuera del rango

```xml
<xs:minExclusive value="0"/>
```

XML incorrecto:

```xml
<precio>0</precio>
```

### Valor no incluido en una enumeración

Si solo se admiten `entrantes`, `principales`, `postres` y `bebidas`, el valor `tapas` será inválido aunque esté bien escrito como XML.

### Orden incorrecto

`xs:sequence` obliga a seguir el orden exacto. Si el esquema declara `nombre`, `descripcion`, `precio`, no se puede colocar `precio` primero.

## 6.9. Validación desde la terminal

Si `xmllint` está instalado:

DTD:

```bash
xmllint --noout --valid carta.xml
```

XSD:

```bash
xmllint --noout --schema carta.xsd carta.xml
```

Un comando sin salida suele indicar que no se detectaron errores. Si los hay, se mostrará el archivo, la línea y una descripción.

Formatear el documento:

```bash
xmllint --format carta.xml
```

No debe confundirse formatear con validar: un archivo puede verse bien indentado y continuar siendo inválido.

## 6.10. Validar no significa diseñar bien

Un esquema puede permitir estructuras poco convenientes. La validación solo comprueba las reglas que alguien definió.

Por ejemplo, si XSD permite un nombre vacío o un precio máximo de un millón, el validador lo aceptará. Crear un buen esquema exige analizar correctamente los requisitos.

## 6.11. Estrategia de pruebas

No basta con probar un único XML válido. Conviene preparar:

### Casos válidos

- Documento mínimo permitido.
- Documento completo.
- Valores situados en los límites permitidos.

### Casos inválidos

- Falta un elemento obligatorio.
- Sobra un elemento no declarado.
- Orden incorrecto.
- Atributo obligatorio ausente.
- Identificador duplicado.
- Enumeración incorrecta.
- Número fuera del rango.
- Texto demasiado corto o largo.

Una buena prueba confirma que el esquema acepta lo correcto y rechaza lo incorrecto.

## 6.12. Lista de diagnóstico

Si no funciona la validación:

- [ ] ¿El XML está bien formado?
- [ ] ¿La raíz coincide con la declaración?
- [ ] ¿La ruta de DTD o XSD es correcta?
- [ ] ¿Los archivos están guardados?
- [ ] ¿La extensión XML está activa?
- [ ] ¿Los prefijos y espacios de nombres están declarados?
- [ ] ¿El orden coincide con `sequence`?
- [ ] ¿Las repeticiones cumplen los límites?
- [ ] ¿Los valores cumplen sus tipos?
- [ ] ¿Los identificadores son únicos?

---

[← Anterior](05-xsd-restricciones.md) · [Siguiente: resumen y ejercicios →](07-resumen-y-ejercicios.md)
