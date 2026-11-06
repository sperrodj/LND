# 3. Predicados, filtros y operadores

## 3.1. ¿Qué es un predicado?

Un predicado es una condición escrita entre corchetes que filtra una selección:

```xpath
//videojuego[condicion]
```

La expresión devuelve únicamente los videojuegos que cumplen la condición.

## 3.2. Filtrar por atributo

```xpath
//videojuego[@disponible='true']
//videojuego[@id='V003']
//precio[@moneda='EUR']
```

Para obtener el título de los disponibles:

```xpath
//videojuego[@disponible='true']/titulo
```

## 3.3. Filtrar por contenido de un hijo

```xpath
//videojuego[precio > 50]
//videojuego[puntuacion >= 8]/titulo
//videojuego[desarrolladora='Riot Games']
```

XPath convierte el texto de `precio` o `puntuacion` a número cuando se usa una comparación numérica.

## 3.4. Comprobar que existe un nodo

```xpath
//videojuego[observaciones]
//videojuego[plataformas/plataforma]
```

Para seleccionar los que no tienen observaciones:

```xpath
//videojuego[not(observaciones)]
```

## 3.5. Filtrar por un valor repetido

La comparación comprueba si alguno de los nodos seleccionados coincide:

```xpath
//videojuego[plataformas/plataforma='Switch']/titulo
```

La consulta selecciona un videojuego si al menos una de sus plataformas contiene `Switch`.

```xpath
//videojuego[generos/genero='Acción']/titulo
```

## 3.6. Operadores de comparación

| Operador | Significado | Ejemplo |
|---|---|---|
| `=` | Igual | `precio = 0` |
| `!=` | Distinto | `@moneda != 'USD'` |
| `<` | Menor que | `precio < 20` |
| `<=` | Menor o igual | `precio <= 50` |
| `>` | Mayor que | `puntuacion > 8` |
| `>=` | Mayor o igual | `puntuacion >= 7` |

En XML escrito dentro de otro XML, `<` puede requerir `&lt;`. En una expresión introducida directamente en terminal normalmente puede escribirse `<`, protegiendo la consulta con comillas.

## 3.7. Operadores lógicos

```xpath
//videojuego[precio < 60 and @disponible='true']
```

```xpath
//videojuego[generos/genero='Acción' or generos/genero='Lucha']
```

```xpath
//videojuego[not(@disponible='true')]
```

También podría escribirse:

```xpath
//videojuego[@disponible='false']
```

## 3.8. Posiciones

```xpath
/catalogo/videojuego[1]
/catalogo/videojuego[2]
/catalogo/videojuego[last()]
/catalogo/videojuego[position() <= 3]
```

XPath comienza a contar en **1**, no en 0.

### Atención al contexto

```xpath
//videojuego[1]
```

Selecciona cada `videojuego` que sea el primero entre los hermanos de su contexto. En este documento coincide con el primero del catálogo, pero en estructuras más complejas puede producir varios resultados.

Para expresar inequívocamente «el primer videojuego del catálogo»:

```xpath
(/catalogo/videojuego)[1]
```

Los paréntesis cambian el conjunto sobre el que se aplica la posición.

## 3.9. Varios predicados

```xpath
//videojuego[@disponible='true'][precio < 60]
```

Equivale en este caso a:

```xpath
//videojuego[@disponible='true' and precio < 60]
```

También se pueden combinar posición y contenido:

```xpath
(//videojuego[precio < 60])[1]/titulo
```

## 3.10. Errores frecuentes

```xpath
//videojuego[@disponible=true]
```

`true` sin comillas no es el texto del atributo. Para comparar el atributo con la cadena almacenada utiliza:

```xpath
//videojuego[@disponible='true']
```

Otro error es escribir `&&` o `||`. XPath utiliza `and` y `or`.

## 3.11. Ejercicios

Selecciona:

1. Los videojuegos gratuitos.
2. Los títulos de juegos con puntuación superior a 8.
3. Los juegos disponibles y con precio inferior a 50 euros.
4. Los juegos que se pueden utilizar en PC.
5. Los juegos que tienen observaciones.
6. Los dos primeros videojuegos.
7. El penúltimo videojuego.
8. Los videojuegos de acción o aventura.
9. Los videojuegos que no han sido desarrollados en Estados Unidos.
