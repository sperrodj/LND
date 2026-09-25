# Bloque 4. Documentos XML bien formados

[← Estructura](03-estructura-y-diseno.md) · [Índice](README.md) · [Siguiente: espacios de nombres →](05-espacios-de-nombres.md)

## Objetivos del bloque

- Definir documento XML bien formado.
- Aplicar todas las reglas básicas de buena formación.
- Localizar errores a partir de mensajes del analizador.
- Diferenciar buena formación y validez.

## 1. ¿Qué significa «bien formado»?

Un documento XML está **bien formado** cuando cumple las reglas sintácticas fundamentales de XML. Todos los documentos XML deben estar bien formados para poder procesarse como XML.

La buena formación no garantiza que los datos sean correctos ni que el documento cumpla las reglas de un negocio.

```xml
<videojuego>
  <precio>-900</precio>
</videojuego>
```

Puede estar bien formado aunque el precio carezca de sentido.

## 2. Reglas fundamentales

### 2.1. Debe existir un único elemento raíz

```xml
<!-- Incorrecto -->
<videojuego />
<videojuego />
```

```xml
<!-- Correcto -->
<catalogo>
  <videojuego />
  <videojuego />
</catalogo>
```

### 2.2. Todo elemento debe cerrarse

```xml
<!-- Incorrecto -->
<titulo>Celeste
```

```xml
<!-- Correcto -->
<titulo>Celeste</titulo>
```

Los elementos vacíos también deben cerrarse:

```xml
<agotado />
```

### 2.3. Las etiquetas deben respetar mayúsculas y minúsculas

```xml
<!-- Incorrecto -->
<titulo>Celeste</Titulo>
```

```xml
<!-- Correcto -->
<titulo>Celeste</titulo>
```

### 2.4. Los elementos deben anidarse correctamente

```xml
<!-- Incorrecto -->
<descripcion><destacado>Difícil</descripcion></destacado>
```

```xml
<!-- Correcto -->
<descripcion><destacado>Difícil</destacado></descripcion>
```

La última etiqueta abierta debe ser la primera en cerrarse.

### 2.5. Los valores de atributos deben ir entre comillas

```xml
<!-- Incorrecto -->
<videojuego id=V001 />
```

```xml
<!-- Correcto -->
<videojuego id="V001" />
```

### 2.6. Un atributo no puede repetirse en el mismo elemento

```xml
<!-- Incorrecto -->
<videojuego id="V001" id="V002" />
```

### 2.7. Los nombres deben cumplir las reglas de XML

```xml
<!-- Incorrecto -->
<2jugadores>sí</2jugadores>
```

```xml
<!-- Correcto -->
<modo-dos-jugadores>sí</modo-dos-jugadores>
```

### 2.8. Los caracteres reservados deben escaparse

```xml
<!-- Incorrecto -->
<condicion>precio < 20 & disponible</condicion>
```

```xml
<!-- Correcto -->
<condicion>precio &lt; 20 &amp; disponible</condicion>
```

### 2.9. Los comentarios deben ser correctos

```xml
<!-- Incorrecto -- contiene doble guion -->
```

```xml
<!-- Comentario correcto -->
```

### 2.10. La declaración, si existe, debe ocupar la primera posición

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo />
```

No debe aparecer contenido antes de ella.

## 3. Bien formado no significa válido

Un documento **válido** cumple además las reglas definidas por un vocabulario formal, normalmente mediante una DTD o un esquema.

Supongamos esta regla:

```text
Todo videojuego debe contener título y precio, en ese orden.
```

El siguiente documento está bien formado, pero no cumpliría esa regla:

```xml
<videojuego>
  <titulo>Celeste</titulo>
</videojuego>
```

La relación puede resumirse así:

```text
Documento válido → debe estar bien formado
Documento bien formado → no necesariamente es válido
```

La validación formal se estudiará en la Unidad 3.

## 4. Errores sintácticos y errores semánticos

### Error sintáctico

Incumple las reglas de escritura:

```xml
<precio moneda=EUR>19.99</precio>
```

### Error estructural respecto del vocabulario

El documento está bien formado, pero falta una parte exigida:

```xml
<videojuego>
  <precio>19.99</precio>
</videojuego>
```

### Error semántico o de negocio

El valor no tiene sentido para la aplicación:

```xml
<precio moneda="EUR">diecinueve euros</precio>
```

La buena formación solo detecta el primer tipo. Para los demás se necesitan esquemas, validaciones o lógica de aplicación.

## 5. Leer mensajes de error

Los editores y analizadores suelen indicar:

- Línea y columna aproximadas.
- Etiqueta esperada.
- Carácter no permitido.
- Final inesperado del archivo.
- Atributo sin cerrar.
- Prefijo de espacio de nombres no declarado.

El error real puede encontrarse antes de la posición señalada. Si aparece “fin inesperado”, revisa etiquetas o comillas que hayan quedado abiertas.

### Estrategia de depuración

1. Lee el primer error, no todos a la vez.
2. Revisa la línea indicada y la anterior.
3. Comprueba comillas, cierre y mayúsculas.
4. Corrige un error.
5. Vuelve a analizar el documento.
6. Repite hasta que no queden errores.

Un único fallo puede provocar muchos mensajes posteriores.

## 6. Herramientas para comprobar XML

Puedes utilizar:

- El resaltado y diagnóstico de Visual Studio Code.
- Extensiones específicas para XML.
- Un navegador, que mostrará un error si el documento no puede analizarse.
- Validadores en línea, evitando subir información privada.
- Herramientas de terminal como `xmllint`.

Ejemplo en Linux:

```bash
xmllint --noout catalogo.xml
```

Si el documento está bien formado, normalmente no produce salida. Si existe un error, muestra su localización.

Para mostrarlo con indentación:

```bash
xmllint --format catalogo.xml
```

> [!NOTE]
> Formatear no sustituye validar. Un formateador puede fallar si el XML no está bien formado.

## 7. Ejercicio de corrección

Localiza y corrige todos los errores:

```xml
 
<?xml version="1.0" encoding="UTF-8"?>
<catalogo>
  <videojuego id=V001>
    <Titulo>Celeste</titulo>
    <precio moneda="EUR">19.99</precio>
    <descripcion>Plataformas & aventura</descripcion>
  </videojuego>
  <videojuego id="V002">
    <titulo>Hades</titulo>
    <plataforma>PC
  </videojuego>
</catalogo>
<actualizado>sí</actualizado>
```

### Pistas

- Posición de la declaración.
- Comillas de atributos.
- Mayúsculas y minúsculas.
- Caracteres reservados.
- Cierre de elementos.
- Número de raíces.

<details>
<summary>Ver una posible solución</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo actualizado="sí">
  <videojuego id="V001">
    <titulo>Celeste</titulo>
    <precio moneda="EUR">19.99</precio>
    <descripcion>Plataformas &amp; aventura</descripcion>
  </videojuego>
  <videojuego id="V002">
    <titulo>Hades</titulo>
    <plataforma>PC</plataforma>
  </videojuego>
</catalogo>
```

</details>

## Lista rápida de buena formación

- [ ] La declaración, si existe, está en la primera posición.
- [ ] Existe exactamente un elemento raíz.
- [ ] Todas las etiquetas están cerradas.
- [ ] Las mayúsculas coinciden.
- [ ] El anidamiento es correcto.
- [ ] Los atributos utilizan comillas.
- [ ] No existen atributos duplicados.
- [ ] Los nombres son válidos.
- [ ] Los caracteres reservados están escapados.
- [ ] Los comentarios cumplen la sintaxis.

---

[← Estructura](03-estructura-y-diseno.md) · [Índice](README.md) · [Siguiente: espacios de nombres →](05-espacios-de-nombres.md)
