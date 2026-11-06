# 4. Funciones de XPath 1.0

## 4.1. Funciones sobre nodos y posiciones

### `count()`

Cuenta nodos:

```xpath
count(/catalogo/videojuego)
count(//plataforma)
count(//videojuego[@disponible='true'])
```

### `position()`

Devuelve la posición del nodo en el conjunto que se está evaluando:

```xpath
/catalogo/videojuego[position() mod 2 = 1]
```

Selecciona posiciones impares.

### `last()`

Devuelve la última posición:

```xpath
/catalogo/videojuego[last()]
/catalogo/videojuego[last() - 1]
```

### `name()`

Devuelve el nombre del primer nodo seleccionado:

```xpath
name(/catalogo/*[1])
```

## 4.2. Funciones de cadenas

### `contains()`

```xpath
//videojuego[contains(titulo, 'Spider')]
```

La búsqueda distingue mayúsculas de minúsculas.

### `starts-with()`

```xpath
//videojuego[starts-with(titulo, 'Jujutsu')]
```

### `string-length()`

```xpath
//videojuego[string-length(titulo) > 20]/titulo
```

### `normalize-space()`

Elimina espacios iniciales y finales y reduce grupos internos de espacios:

```xpath
normalize-space(/catalogo/videojuego[1]/titulo)
```

Es útil cuando el XML contiene saltos o espacios accidentales.

### `substring()`, `substring-before()` y `substring-after()`

```xpath
substring('V001', 2)
substring-before('14.99 EUR', ' ')
substring-after('V-001', '-')
```

En XPath las posiciones de las cadenas también empiezan en 1.

### `concat()`

```xpath
concat('Total de juegos: ', count(//videojuego))
```

### `translate()`

XPath 1.0 no incluye `lower-case()` ni `upper-case()`. Puede simular una conversión básica:

```xpath
//videojuego[contains(
  translate(titulo,
            'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
            'abcdefghijklmnopqrstuvwxyz'),
  'hollow'
)]
```

Esta versión sencilla no convierte letras acentuadas.

## 4.3. Funciones numéricas

### `sum()`

```xpath
sum(//precio)
```

### `round()`, `floor()` y `ceiling()`

```xpath
round(sum(//precio))
floor(/catalogo/videojuego[1]/precio)
ceiling(/catalogo/videojuego[1]/precio)
```

### `number()`

```xpath
number(/catalogo/videojuego[1]/precio)
```

Si el contenido no puede convertirse, el resultado es `NaN` (*Not a Number*).

### Media aritmética

XPath 1.0 no ofrece `avg()`, pero podemos calcularla:

```xpath
sum(//puntuacion) div count(//puntuacion)
```

Los operadores aritméticos son:

| Operador | Operación |
|---|---|
| `+` | Suma |
| `-` | Resta |
| `*` | Multiplicación |
| `div` | División |
| `mod` | Resto |

## 4.4. Funciones booleanas

```xpath
boolean(//videojuego[@disponible='false'])
not(//videojuego[@disponible='false'])
true()
false()
```

`boolean()` devuelve `true` si el conjunto contiene al menos un nodo.

## 4.5. Funciones que no pertenecen a XPath 1.0

Estas funciones son habituales en XPath 2.0 o posterior, pero pueden fallar con `xmllint`:

- `lower-case()`
- `upper-case()`
- `matches()`
- `replace()`
- `tokenize()`
- `avg()`
- `min()` y `max()`
- `ends-with()`

No debes asumir que una expresión encontrada en Internet funcionará en cualquier motor XPath. Comprueba siempre la versión admitida.

## 4.6. Ejercicios

1. Cuenta los videojuegos disponibles.
2. Cuenta las plataformas de `V005`.
3. Selecciona títulos que contengan `League`.
4. Selecciona títulos con más de 20 caracteres.
5. Calcula la suma de todos los precios.
6. Calcula el precio medio.
7. Obtén el último videojuego.
8. Selecciona las posiciones pares.
9. Busca `spider` sin distinguir entre mayúsculas y minúsculas usando `translate()`.
