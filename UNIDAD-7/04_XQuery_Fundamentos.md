# 4. Fundamentos de XQuery

## 4.1. ¿Qué es XQuery?

XQuery es un lenguaje diseñado para consultar y transformar información XML.

Permite:

- Seleccionar nodos.
- Filtrar registros.
- Ordenar resultados.
- Realizar cálculos.
- Agrupar información.
- Combinar documentos.
- Crear nuevos documentos XML o HTML.
- Generar texto y JSON.

## 4.2. Relación con XPath

XPath selecciona nodos:

```xpath
/festival/conciertos/concierto[precio < 30]/artista
```

XQuery incorpora XPath y añade construcciones propias:

```xquery
for $concierto in /festival/conciertos/concierto
where $concierto/precio < 30
return $concierto/artista
```

## 4.3. Documento de ejemplo

Guarda `festival.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<festival nombre="Sonidos del Valle" edicion="2027">
  <localizacion>Valle de La Orotava</localizacion>

  <escenarios>
    <escenario id="E1">Bosque</escenario>
    <escenario id="E2">Volcán</escenario>
    <escenario id="E3">Océano</escenario>
  </escenarios>

  <conciertos>
    <concierto id="C01" escenario="E1" agotado="false">
      <artista>Bruma Atlántica</artista>
      <genero>Indie</genero>
      <fecha>2027-07-10</fecha>
      <hora>19:30:00</hora>
      <precio moneda="EUR">28.50</precio>
    </concierto>

    <concierto id="C02" escenario="E2" agotado="true">
      <artista>Ritmo Solar</artista>
      <genero>Electrónica</genero>
      <fecha>2027-07-10</fecha>
      <hora>22:00:00</hora>
      <precio moneda="EUR">42.00</precio>
    </concierto>

    <concierto id="C03" escenario="E1" agotado="false">
      <artista>Isla de Sal</artista>
      <genero>Folk</genero>
      <fecha>2027-07-11</fecha>
      <hora>18:00:00</hora>
      <precio moneda="EUR">24.00</precio>
    </concierto>

    <concierto id="C04" escenario="E3" agotado="false">
      <artista>Niebla Roja</artista>
      <genero>Rock</genero>
      <fecha>2027-07-11</fecha>
      <hora>21:30:00</hora>
      <precio moneda="EUR">35.00</precio>
    </concierto>
  </conciertos>
</festival>
```

## 4.4. Primera consulta

Desde un archivo:

```xquery
doc("festival.xml")/festival/conciertos/concierto/artista
```

Desde una base:

```xquery
db:get("festival")/festival/conciertos/concierto/artista
```

`doc()` abre un documento. `db:get()` accede a una base BaseX.

## 4.5. Declaración de versión

```xquery
xquery version "3.1";

doc("festival.xml")/festival/@nombre
```

La declaración debe aparecer al principio.

## 4.6. Secuencias

XQuery trabaja con secuencias:

```xquery
(10, 20, 30)
```

```xquery
("Indie", "Folk", "Rock")
```

```xquery
1 to 5
```

Una secuencia puede contener nodos y valores atómicos.

Secuencia vacía:

```xquery
()
```

No es lo mismo que una cadena vacía:

```xquery
""
```

## 4.7. Variables

Las variables comienzan por `$`:

```xquery
let $precio-maximo := 30
return $precio-maximo
```

Guardar un documento:

```xquery
let $festival := doc("festival.xml")/festival
return $festival/@nombre
```

El operador `:=` asigna el valor.

## 4.8. `for`

`for` recorre una secuencia:

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
return $concierto/artista
```

En cada iteración, `$concierto` contiene un elemento diferente.

### Posición

```xquery
for $concierto at $posicion
in doc("festival.xml")/festival/conciertos/concierto
return concat($posicion, ". ", $concierto/artista)
```

## 4.9. `let`

`let` asigna una secuencia sin recorrerla:

```xquery
let $conciertos :=
  doc("festival.xml")/festival/conciertos/concierto
return count($conciertos)
```

Comparación:

```text
for → una evaluación por cada elemento.
let → asigna la secuencia completa.
```

## 4.10. `where`

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
where $concierto/precio < 30
return $concierto/artista
```

Resultado:

- Bruma Atlántica.
- Isla de Sal.

### Varias condiciones

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
where $concierto/@agotado = "false"
  and $concierto/precio <= 35
return $concierto/artista
```

## 4.11. `order by`

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
order by xs:decimal($concierto/precio) ascending
return $concierto/artista
```

Orden descendente:

```xquery
order by xs:decimal($concierto/precio) descending
```

La conversión `xs:decimal()` deja claro que se desea una ordenación numérica.

## 4.12. `return`

`return` construye el resultado:

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
return
  <actuacion>
    {$concierto/artista}
    {$concierto/fecha}
  </actuacion>
```

Las llaves `{}` insertan el resultado de una expresión XQuery dentro de un constructor XML.

## 4.13. Constructores directos

```xquery
<saludo>Hola</saludo>
```

Con expresión:

```xquery
let $nombre := "Sonidos del Valle"
return <festival>{$nombre}</festival>
```

Resultado:

```xml
<festival>Sonidos del Valle</festival>
```

## 4.14. Atributos dinámicos

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
return
  <actuacion id="{$concierto/@id}">
    {$concierto/artista}
  </actuacion>
```

Resultado:

```xml
<actuacion id="C01">
  <artista>Bruma Atlántica</artista>
</actuacion>
```

## 4.15. Obtener solo texto

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
return string($concierto/artista)
```

`$concierto/artista` devuelve nodos. `string()` devuelve el contenido textual.

## 4.16. Condicionales

```xquery
for $concierto in doc("festival.xml")/festival/conciertos/concierto
return
  <concierto>
    {$concierto/artista}
    <estado>{
      if ($concierto/@agotado = "true")
      then "Entradas agotadas"
      else "Entradas disponibles"
    }</estado>
  </concierto>
```

XQuery utiliza:

```text
if (condición) then resultado else resultado
```

`else` es obligatorio.

## 4.17. Comparaciones

Comparaciones generales:

```xquery
=  !=  <  <=  >  >=
```

Dentro de un archivo `.xq`, el signo `<` puede utilizarse en una expresión. Si la consulta se incrusta dentro de XML, debe escribirse `&lt;`.

## 4.18. Comentarios

```xquery
(: Este es un comentario XQuery :)
```

Pueden ocupar varias líneas:

```xquery
(:
  Consulta de actuaciones
  con entradas disponibles.
:)
```

## 4.19. Errores frecuentes

- Olvidar `$` delante de una variable.
- Usar `=` para asignar en vez de `:=`.
- Confundir `for` y `let`.
- Escribir `if` sin `else`.
- Ordenar números como texto.
- Utilizar una ruta desde el contexto equivocado.
- Olvidar las llaves al insertar expresiones en XML.
- Devolver elementos completos cuando se necesita texto.

## 4.20. Actividades

1. Muestra todos los artistas.
2. Obtén los conciertos del 11 de julio.
3. Selecciona los conciertos no agotados.
4. Ordénalos de mayor a menor precio.
5. Genera un XML con artista, género y precio.
6. Añade un estado calculado mediante `if`.

