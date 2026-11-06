# Chuleta de XPath 1.0

## Rutas

| Expresión | Significado |
|---|---|
| `/` | Nodo documento |
| `/catalogo` | Elemento raíz `catalogo` |
| `videojuego/titulo` | Ruta relativa |
| `//titulo` | Títulos a cualquier profundidad |
| `.` | Nodo actual |
| `..` | Nodo padre |
| `*` | Cualquier elemento |
| `@*` | Cualquier atributo |
| `text()` | Nodo de texto |

## Atributos y filtros

```xpath
//videojuego/@id
//videojuego[@id]
//videojuego[@id='V001']
//videojuego[precio > 50]
//videojuego[plataformas/plataforma='PC']
//videojuego[observaciones]
//videojuego[not(observaciones)]
```

## Posiciones

```xpath
/catalogo/videojuego[1]
/catalogo/videojuego[last()]
/catalogo/videojuego[last()-1]
/catalogo/videojuego[position() <= 3]
/catalogo/videojuego[position() mod 2 = 0]
```

## Lógica y comparación

```xpath
//videojuego[precio >= 10 and precio <= 50]
//videojuego[@disponible='true' or precio=0]
//videojuego[not(@disponible='true')]
```

Operadores: `=`, `!=`, `<`, `<=`, `>`, `>=`, `and`, `or`.

## Funciones

```xpath
count(//videojuego)
sum(//precio)
sum(//precio) div count(//precio)
contains(titulo, 'Marvel')
starts-with(titulo, 'Jujutsu')
string-length(titulo)
normalize-space(titulo)
concat('Total: ', count(//videojuego))
```

## Unión

```xpath
//titulo | //precio
```

## Ejes

```xpath
child::videojuego
parent::videojuego
ancestor::videojuego
descendant::plataforma
following-sibling::precio
preceding-sibling::titulo
```

## Abreviaturas

| Completa | Abreviada |
|---|---|
| `child::titulo` | `titulo` |
| `attribute::id` | `@id` |
| `self::node()` | `.` |
| `parent::node()` | `..` |

## Terminal

```bash
xmllint --noout archivo.xml
xmllint --xpath '//titulo' archivo.xml
xmllint --xpath 'count(//videojuego)' archivo.xml
xmllint --shell archivo.xml
```

## Recuerda

- XPath distingue mayúsculas y minúsculas.
- Las posiciones empiezan en 1.
- `@` selecciona atributos.
- `//` busca descendientes; no lo uses sin necesidad.
- `and` y `or`, no `&&` y `||`.
- En XPath 1.0 no existen `lower-case()`, `matches()` ni `avg()`.
- Si no obtienes resultados, revisa la ruta, el contexto y los espacios de nombres.
