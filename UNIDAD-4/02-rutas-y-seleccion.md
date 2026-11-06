# 2. Rutas y selección de nodos

## 2.1. Expresión de localización

Una expresión XPath describe un recorrido por el árbol. Cada paso se separa mediante `/`.

```xpath
/catalogo/videojuego/titulo
```

Se lee: «desde el documento, entra en `catalogo`, después en cada `videojuego` y selecciona su `titulo`».

## 2.2. Rutas absolutas

Comienzan con `/` y parten del nodo documento:

```xpath
/catalogo
/catalogo/videojuego
/catalogo/videojuego/titulo
```

Una ruta absoluta es clara, pero depende de la estructura completa. Si cambia el nombre o la posición de un contenedor, puede dejar de funcionar.

## 2.3. Rutas relativas

Parten del nodo de contexto y no comienzan con `/`:

```xpath
titulo
plataformas/plataforma
precio/@moneda
```

Si el contexto es un `videojuego`, `titulo` selecciona su hijo `titulo`.

## 2.4. Selección en cualquier profundidad

`//` busca descendientes sin exigir una ruta exacta:

```xpath
//titulo
//plataforma
//videojuego/titulo
```

No significa «cualquier cosa». Significa localizar descendientes que cumplan el paso posterior.

Conviene evitar `//` cuando conocemos la estructura, porque una ruta explícita comunica mejor la intención:

```xpath
/catalogo/videojuego/titulo
```

## 2.5. Comodines

| Expresión | Significado |
|---|---|
| `*` | Cualquier elemento hijo |
| `@*` | Cualquier atributo |
| `node()` | Cualquier nodo hijo |
| `text()` | Nodos de texto hijos |

Ejemplos:

```xpath
/catalogo/*
//videojuego/@*
//precio/text()
```

`*` no selecciona atributos; para ellos se necesita `@*`.

## 2.6. Seleccionar atributos

Los atributos se indican con `@`:

```xpath
//videojuego/@id
//videojuego/@disponible
//precio/@moneda
//desarrolladora/@pais
```

Para seleccionar elementos que posean un atributo:

```xpath
//videojuego[@id]
```

Para seleccionar los que tengan un valor determinado:

```xpath
//videojuego[@disponible='true']
```

## 2.7. Seleccionar texto

```xpath
//titulo/text()
```

Existe una diferencia entre seleccionar el elemento y seleccionar su texto:

```xpath
//titulo
//titulo/text()
```

La primera expresión devuelve nodos `<titulo>`. La segunda devuelve sus nodos de texto.

## 2.8. Unión de resultados

XPath 1.0 utiliza `|` para unir conjuntos de nodos:

```xpath
//titulo | //precio
```

```xpath
//videojuego[@id='V001'] | //videojuego[@id='V005']
```

No debe confundirse con el operador lógico `or`, utilizado dentro de condiciones.

## 2.9. Selecciones sobre el catálogo

| Necesidad | XPath |
|---|---|
| Todos los videojuegos | `/catalogo/videojuego` |
| Todos los títulos | `/catalogo/videojuego/titulo` |
| Todas las plataformas | `//plataforma` |
| Todos los identificadores | `//videojuego/@id` |
| Países de las desarrolladoras | `//desarrolladora/@pais` |
| Texto de los títulos | `//titulo/text()` |
| Hijos del primer videojuego | `/catalogo/videojuego[1]/*` |

## 2.10. Ejercicios

Escribe una expresión para seleccionar:

1. El elemento raíz.
2. Todos los precios.
3. Todos los atributos del catálogo.
4. Los géneros de todos los videojuegos.
5. Los textos de las plataformas.
6. Títulos y puntuaciones en una única consulta.
7. Todos los elementos hijos de `plataformas`.
