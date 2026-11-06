# 5. Ejes de navegación

## 5.1. Sintaxis completa de un paso

La forma completa de un paso XPath es:

```xpath
eje::prueba-de-nodo[predicado]
```

Ejemplo:

```xpath
child::videojuego[@disponible='true']
```

Muchas expresiones que ya conocemos son abreviaturas:

```xpath
child::videojuego
```

equivale a:

```xpath
videojuego
```

## 5.2. Ejes principales

| Eje | Selecciona |
|---|---|
| `child` | Hijos directos |
| `parent` | Padre directo |
| `self` | Nodo actual |
| `attribute` | Atributos |
| `descendant` | Descendientes, sin incluir el actual |
| `descendant-or-self` | Nodo actual y descendientes |
| `ancestor` | Ancestros, sin incluir el actual |
| `ancestor-or-self` | Nodo actual y ancestros |
| `following-sibling` | Hermanos posteriores |
| `preceding-sibling` | Hermanos anteriores |
| `following` | Nodos posteriores en el documento |
| `preceding` | Nodos anteriores en el documento |

## 5.3. Hijos, padres y nodo actual

```xpath
/catalogo/child::videojuego
//precio/parent::videojuego
//videojuego/self::videojuego
```

Abreviaturas:

| Completa | Abreviada |
|---|---|
| `child::titulo` | `titulo` |
| `attribute::id` | `@id` |
| `self::node()` | `.` |
| `parent::node()` | `..` |
| `/descendant-or-self::node()/titulo` | `//titulo` |

## 5.4. Ancestros y descendientes

Seleccionar los videojuegos que son ancestros de una plataforma `Switch`:

```xpath
//plataforma[.='Switch']/ancestor::videojuego
```

Seleccionar todos los descendientes de cada videojuego:

```xpath
//videojuego/descendant::*
```

Seleccionar el catálogo ancestro de un precio:

```xpath
//precio/ancestor::catalogo
```

## 5.5. Hermanos anteriores y posteriores

Desde un `titulo`, seleccionar sus hermanos posteriores:

```xpath
//titulo/following-sibling::*
```

Seleccionar el hermano `precio`:

```xpath
//titulo/following-sibling::precio
```

Desde `precio`, seleccionar el título hermano anterior:

```xpath
//precio/preceding-sibling::titulo
```

El hermano inmediatamente posterior:

```xpath
//titulo/following-sibling::*[1]
```

El hermano inmediatamente anterior:

```xpath
//precio/preceding-sibling::*[1]
```

## 5.6. `following` no es lo mismo que `following-sibling`

- `following-sibling` solo selecciona nodos con el mismo padre.
- `following` selecciona nodos posteriores del documento, aunque estén en otras ramas.

```xpath
//videojuego[1]/following-sibling::videojuego
```

Selecciona los videojuegos hermanos posteriores al primero.

```xpath
//videojuego[1]/following::videojuego
```

Busca videojuegos posteriores en todo el documento.

## 5.7. Ejes inversos y posición

`preceding-sibling` es un eje inverso. Esta expresión:

```xpath
//precio/preceding-sibling::*[1]
```

selecciona el hermano anterior más cercano, no el primer hijo del padre.

## 5.8. ¿Cuándo usar ejes?

Utiliza una ruta sencilla cuando sea suficiente:

```xpath
//videojuego/titulo
```

Los ejes son útiles cuando la consulta parte de un nodo conocido y necesita desplazarse hacia padres, ancestros o hermanos:

```xpath
//plataforma[.='Switch']/ancestor::videojuego/titulo
```

## 5.9. Ejercicios

1. Desde `precio`, selecciona su videojuego padre.
2. Desde una plataforma `PC`, selecciona el título de su videojuego.
3. Selecciona todos los hermanos posteriores de `titulo`.
4. Selecciona el hermano inmediatamente anterior de `puntuacion`.
5. Selecciona el atributo `id` del ancestro `videojuego` de cada género `Acción`.
6. Selecciona todos los descendientes del primer videojuego.
