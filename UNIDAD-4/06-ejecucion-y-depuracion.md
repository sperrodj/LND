# 6. Ejecución y depuración de XPath

## 6.1. Preparar Visual Studio Code

Para trabajar cómodamente:

1. Abre una carpeta de trabajo en Visual Studio Code.
2. Instala la extensión **XML de Red Hat**.
3. Crea `catalogo-videojuegos.xml` con el XML de referencia.
4. Comprueba que VS Code no muestra errores de sintaxis.
5. Abre una terminal integrada mediante **Terminal > Nuevo terminal**.

La extensión ayuda a editar y validar, pero la ejecución concreta de XPath dependerá de la herramienta utilizada.

## 6.2. Ejecutar XPath con `xmllint`

Comprobar que el documento está bien formado:

```bash
xmllint --noout catalogo-videojuegos.xml
```

Ejecutar una consulta:

```bash
xmllint --xpath '/catalogo/videojuego/titulo' catalogo-videojuegos.xml
```

Contar videojuegos:

```bash
xmllint --xpath 'count(/catalogo/videojuego)' catalogo-videojuegos.xml
```

Seleccionar los títulos de juegos gratuitos:

```bash
xmllint --xpath '//videojuego[precio=0]/titulo' catalogo-videojuegos.xml
```

Utiliza comillas simples alrededor de la expresión para evitar que la terminal interprete caracteres como `*`, `<` o `>`.

## 6.3. Formato de la salida

Si seleccionamos elementos, `xmllint` devuelve las etiquetas completas:

```bash
xmllint --xpath '//videojuego[1]/titulo' catalogo-videojuegos.xml
```

Salida aproximada:

```xml
<titulo>Hollow Knight</titulo>
```

Para obtener solo el texto:

```bash
xmllint --xpath 'string(//videojuego[1]/titulo)' catalogo-videojuegos.xml
```

Salida:

```text
Hollow Knight
```

`string()` solo devuelve el valor de cadena del primer nodo del conjunto. No sirve para imprimir por separado el texto de todos los títulos en XPath 1.0.

## 6.4. Modo interactivo

También puede utilizarse:

```bash
xmllint --shell catalogo-videojuegos.xml
```

Dentro del intérprete:

```text
xpath /catalogo/videojuego/titulo
```

Para salir:

```text
quit
```

## 6.5. XPath y espacios de nombres

Un XML puede utilizar un espacio de nombres:

```xml
<c:catalogo xmlns:c="https://ejemplo.com/catalogo">
  <c:videojuego id="V001">
    <c:titulo>Hollow Knight</c:titulo>
  </c:videojuego>
</c:catalogo>
```

Esta consulta no seleccionará nada:

```xpath
/catalogo/videojuego/titulo
```

Los elementos pertenecen al espacio de nombres y deben consultarse con un prefijo registrado por la herramienta. En `xmllint --shell` puede registrarse:

```text
setns c=https://ejemplo.com/catalogo
xpath /c:catalogo/c:videojuego/c:titulo
```

El prefijo usado en XPath no tiene que coincidir con el del XML, pero sí debe apuntar al mismo URI.

## 6.6. Diagnóstico de resultados vacíos

Si la consulta no devuelve nada, revisa:

1. ¿El XML está bien formado?
2. ¿Has respetado mayúsculas y minúsculas?
3. ¿La ruta comienza en el elemento raíz correcto?
4. ¿El nodo es hijo directo o descendiente más profundo?
5. ¿Estás intentando seleccionar un atributo sin `@`?
6. ¿El documento utiliza espacios de nombres?
7. ¿El texto contiene espacios inesperados?
8. ¿La herramienta admite la versión de XPath empleada?

## 6.7. Errores frecuentes

| Error | Motivo | Corrección |
|---|---|---|
| `/Catalogo/videojuego` no devuelve nada | XML distingue mayúsculas | `/catalogo/videojuego` |
| `//videojuego/id` no encuentra el identificador | `id` es atributo | `//videojuego/@id` |
| `//videojuego[precio='0 EUR']` no coincide | El elemento contiene `0` y la moneda es atributo | `//videojuego[precio=0]` |
| `//videojuego[@disponible=true]` | Compara con algo distinto de la cadena | `[@disponible='true']` |
| `contains(lower-case(titulo),'x')` falla | `lower-case()` no es XPath 1.0 | Usar `translate()` |
| La terminal interpreta `*` | La consulta no está protegida | Rodearla con comillas simples |

## 6.8. Evidencias recomendadas

Al documentar una práctica incluye:

- La expresión XPath.
- Una breve explicación de lo que busca.
- La salida obtenida.
- Una captura de la terminal cuando se solicite.
- La corrección explicada si inicialmente falló.

No basta con pegar capturas: el README debe permitir comprender el proceso sin abrir las imágenes.
