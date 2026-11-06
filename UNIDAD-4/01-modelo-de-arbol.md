# 1. El modelo de árbol de XPath

## 1.1. Del texto XML al árbol

Aunque escribimos XML como texto, XPath lo interpreta como un **árbol de nodos**. Cada parte del documento ocupa una posición y mantiene relaciones con las demás.

```text
documento
└── catalogo
    ├── @actualizado
    ├── videojuego
    │   ├── @id
    │   ├── @disponible
    │   ├── titulo
    │   │   └── texto
    │   ├── desarrolladora
    │   │   ├── @pais
    │   │   └── texto
    │   └── precio
    │       ├── @moneda
    │       └── texto
    └── videojuego
```

El nodo documento se encuentra por encima del elemento raíz. Por eso `/` representa el comienzo del documento y `/catalogo` selecciona su elemento raíz.

## 1.2. Tipos de nodos

XPath 1.0 trabaja principalmente con estos nodos:

| Tipo | Ejemplo | Selección habitual |
|---|---|---|
| Documento | Documento XML completo | `/` |
| Elemento | `<titulo>Hollow Knight</titulo>` | `titulo` |
| Atributo | `id="V001"` | `@id` |
| Texto | `Hollow Knight` | `text()` |
| Comentario | `<!-- Juego destacado -->` | `comment()` |
| Instrucción de procesamiento | `<?xml-stylesheet ...?>` | `processing-instruction()` |

La declaración `<?xml version="1.0"?>` no se selecciona como un elemento XML.

## 1.3. Relaciones familiares

XPath utiliza vocabulario parecido al de una familia:

- **Padre:** nodo que contiene directamente a otro.
- **Hijo:** nodo contenido directamente por otro.
- **Hermanos:** nodos que tienen el mismo padre.
- **Ancestro:** padre, abuelo y niveles superiores.
- **Descendiente:** hijo, nieto y niveles inferiores.

En el catálogo:

- `catalogo` es padre de `videojuego`.
- `titulo` es hijo de `videojuego`.
- `titulo`, `desarrolladora` y `precio` son hermanos.
- `catalogo` es ancestro de `plataforma`.
- `plataforma` es descendiente de `catalogo`.

## 1.4. Nodo de contexto

Una expresión XPath se evalúa desde un **nodo de contexto**, es decir, desde la posición actual.

Si el contexto es el documento:

```xpath
/catalogo/videojuego
```

Si el contexto ya es un `videojuego`, podemos escribir:

```xpath
titulo
```

El punto representa el nodo actual:

```xpath
.
```

Dos puntos representan su padre:

```xpath
..
```

## 1.5. Conjuntos de nodos y valores

Una expresión puede devolver diferentes tipos de resultados:

| Resultado | Ejemplo |
|---|---|
| Conjunto de nodos | `//videojuego` |
| Cadena | `string(/catalogo/videojuego[1]/titulo)` |
| Número | `count(//videojuego)` |
| Booleano | `count(//videojuego) > 3` |

En XPath 1.0 se habla de **conjunto de nodos**. Versiones posteriores utilizan el concepto más amplio de secuencia.

## 1.6. XML bien formado frente a consulta correcta

XPath solo puede recorrer un documento XML que pueda analizarse. Si el archivo tiene etiquetas mal cerradas, varios elementos raíz o un `&` sin escapar, la herramienta mostrará primero un error XML y no llegará a ejecutar la consulta.

## 1.7. Comprueba lo aprendido

Observa este fragmento:

```xml
<equipo nombre="Hechiceros">
  <personaje id="P01">
    <nombre>Yuji Itadori</nombre>
    <tecnicas>
      <tecnica>Puño divergente</tecnica>
      <tecnica>Destello negro</tecnica>
    </tecnicas>
  </personaje>
</equipo>
```

Responde:

1. ¿Cuál es el elemento raíz?
2. ¿Cuál es el padre de `tecnica`?
3. ¿Qué nodos son hermanos?
4. ¿Cuáles son los atributos?
5. ¿Qué nodos son descendientes de `personaje`?
