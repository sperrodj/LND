# 5. FLWOR, funciones y construcción de resultados

## 5.1. Expresiones FLWOR

FLWOR reúne varias cláusulas:

```text
F → for
L → let
W → where
O → order by
R → return
```

No es obligatorio utilizar todas las cláusulas.

```xquery
for $elemento in secuencia
let $variable := expresión
where condición
order by expresión
return resultado
```

## 5.2. Documento de ejemplo

Guarda `mercado.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mercado nombre="Sabores del Mundo">
  <puestos>
    <puesto id="P01" zona="norte">
      <nombre>Casa Tagine</nombre>
      <especialidad>Marruecos</especialidad>
      <platos>
        <plato vegetariano="true">
          <nombre>Cuscús de verduras</nombre>
          <precio>9.50</precio>
        </plato>
        <plato vegetariano="false">
          <nombre>Tagine de pollo</nombre>
          <precio>12.00</precio>
        </plato>
      </platos>
    </puesto>

    <puesto id="P02" zona="central">
      <nombre>Andes en la Mesa</nombre>
      <especialidad>Perú</especialidad>
      <platos>
        <plato vegetariano="false">
          <nombre>Ceviche clásico</nombre>
          <precio>14.50</precio>
        </plato>
        <plato vegetariano="true">
          <nombre>Causa de aguacate</nombre>
          <precio>10.00</precio>
        </plato>
      </platos>
    </puesto>

    <puesto id="P03" zona="sur">
      <nombre>Raíces Canarias</nombre>
      <especialidad>Canarias</especialidad>
      <platos>
        <plato vegetariano="true">
          <nombre>Papas con mojo</nombre>
          <precio>7.50</precio>
        </plato>
        <plato vegetariano="false">
          <nombre>Carne de cabra</nombre>
          <precio>13.00</precio>
        </plato>
      </platos>
    </puesto>
  </puestos>
</mercado>
```

## 5.3. FLWOR básico

```xquery
for $puesto in doc("mercado.xml")/mercado/puestos/puesto
return $puesto/nombre
```

## 5.4. Combinar `for` y `let`

```xquery
for $puesto in doc("mercado.xml")/mercado/puestos/puesto
let $numero-platos := count($puesto/platos/plato)
return
  <puesto>
    {$puesto/nombre}
    <cantidad>{$numero-platos}</cantidad>
  </puesto>
```

`for` recorre los puestos. `let` calcula un valor para cada puesto.

## 5.5. Filtrar nodos descendientes

```xquery
for $plato in doc("mercado.xml")//plato
where $plato/@vegetariano = "true"
order by xs:decimal($plato/precio)
return $plato/nombre
```

## 5.6. Combinar información del padre y del hijo

```xquery
for $puesto in doc("mercado.xml")/mercado/puestos/puesto
for $plato in $puesto/platos/plato
return
  <oferta>
    <puesto>{string($puesto/nombre)}</puesto>
    <plato>{string($plato/nombre)}</plato>
    <precio>{string($plato/precio)}</precio>
  </oferta>
```

Por cada puesto se recorren sus platos.

## 5.7. Funciones agregadas

### Contar

```xquery
count(doc("mercado.xml")//plato)
```

Resultado: `6`.

### Sumar

```xquery
sum(doc("mercado.xml")//plato/precio)
```

### Media

```xquery
avg(doc("mercado.xml")//plato/precio)
```

### Mínimo y máximo

```xquery
min(doc("mercado.xml")//plato/precio)
```

```xquery
max(doc("mercado.xml")//plato/precio)
```

## 5.8. Valores distintos

```xquery
distinct-values(
  doc("mercado.xml")/mercado/puestos/puesto/@zona
)
```

Obtiene valores sin repetir.

Especialidades:

```xquery
distinct-values(
  doc("mercado.xml")/mercado/puestos/puesto/especialidad
)
```

## 5.9. Funciones de texto

### Concatenar

```xquery
concat("Puesto: ", "Casa Tagine")
```

### Convertir a mayúsculas

```xquery
upper-case("Raíces Canarias")
```

### Convertir a minúsculas

```xquery
lower-case("MARRUECOS")
```

### Comprobar contenido

```xquery
contains("Cuscús de verduras", "verduras")
```

### Comprobar inicio

```xquery
starts-with("Papas con mojo", "Papas")
```

### Eliminar espacios exteriores

```xquery
normalize-space("   texto con espacios   ")
```

## 5.10. Filtrar con funciones

```xquery
for $plato in doc("mercado.xml")//plato
where contains(lower-case($plato/nombre), "mojo")
return $plato/nombre
```

Convertir a minúsculas permite una comparación menos sensible a mayúsculas.

## 5.11. Funciones numéricas

```xquery
round(12.678)
```

```xquery
floor(12.9)
```

```xquery
ceiling(12.1)
```

Formatear:

```xquery
format-number(
  avg(doc("mercado.xml")//plato/precio),
  "0.00"
)
```

## 5.12. Agrupar

```xquery
for $puesto in doc("mercado.xml")/mercado/puestos/puesto
let $zona := string($puesto/@zona)
group by $zona
order by $zona
return
  <zona nombre="{$zona}">
    <numero-puestos>{count($puesto)}</numero-puestos>
  </zona>
```

Después de `group by`, `$puesto` contiene la secuencia de puestos del grupo.

Otro ejemplo:

```xquery
for $plato in doc("mercado.xml")//plato
let $tipo :=
  if ($plato/@vegetariano = "true")
  then "Vegetariano"
  else "No vegetariano"
group by $tipo
return
  <grupo tipo="{$tipo}">
    <cantidad>{count($plato)}</cantidad>
  </grupo>
```

## 5.13. Cuantificadores

### `some`

Comprueba si al menos un elemento cumple la condición:

```xquery
some $plato in doc("mercado.xml")//plato
satisfies $plato/precio > 14
```

### `every`

Comprueba si todos cumplen:

```xquery
every $plato in doc("mercado.xml")//plato
satisfies $plato/precio > 0
```

## 5.14. Existencia

```xquery
exists(doc("mercado.xml")//plato[@vegetariano = "true"])
```

```xquery
empty(doc("mercado.xml")//plato[precio > 100])
```

## 5.15. Crear un documento XML

```xquery
<menu-vegetariano>{
  for $puesto in doc("mercado.xml")/mercado/puestos/puesto
  for $plato in $puesto/platos/plato[@vegetariano = "true"]
  order by xs:decimal($plato/precio)
  return
    <opcion puesto="{$puesto/@id}">
      <nombre>{string($plato/nombre)}</nombre>
      <origen>{string($puesto/especialidad)}</origen>
      <precio moneda="EUR">{string($plato/precio)}</precio>
    </opcion>
}</menu-vegetariano>
```

## 5.16. Crear HTML

```xquery
<html lang="es">
  <head>
    <meta charset="UTF-8"/>
    <title>Mercado gastronómico</title>
  </head>
  <body>
    <h1>Platos disponibles</h1>
    <table>
      <thead>
        <tr>
          <th>Plato</th>
          <th>Puesto</th>
          <th>Precio</th>
        </tr>
      </thead>
      <tbody>{
        for $puesto in doc("mercado.xml")/mercado/puestos/puesto
        for $plato in $puesto/platos/plato
        order by xs:decimal($plato/precio)
        return
          <tr>
            <td>{string($plato/nombre)}</td>
            <td>{string($puesto/nombre)}</td>
            <td>{concat($plato/precio, " EUR")}</td>
          </tr>
      }</tbody>
    </table>
  </body>
</html>
```

Guardar el resultado:

```bash
basex consulta-html.xq > resultado.html
```

## 5.17. Mapas y JSON

XQuery 3.1 incorpora mapas y arrays:

```xquery
map {
  "mercado": "Sabores del Mundo",
  "numeroPuestos": count(doc("mercado.xml")//puesto)
}
```

Serializar como JSON:

```xquery
serialize(
  map {
    "mercado": "Sabores del Mundo",
    "numeroPuestos": count(doc("mercado.xml")//puesto)
  },
  map {
    "method": "json",
    "indent": true()
  }
)
```

Array de nombres:

```xquery
array {
  for $plato in doc("mercado.xml")//plato
  return string($plato/nombre)
}
```

## 5.18. Funciones propias

```xquery
declare function local:clasificar-precio(
  $precio as xs:decimal
) as xs:string {
  if ($precio < 9)
  then "Económico"
  else if ($precio <= 12)
  then "Medio"
  else "Especial"
};

for $plato in doc("mercado.xml")//plato
return
  <plato categoria="{local:clasificar-precio(
    xs:decimal($plato/precio)
  )}">
    {string($plato/nombre)}
  </plato>
```

Una función propia:

- Se declara con `declare function`.
- Puede recibir parámetros tipados.
- Puede indicar el tipo devuelto.
- Utiliza habitualmente el prefijo `local`.

## 5.19. Actualizaciones

BaseX admite XQuery Update.

### Insertar

```xquery
insert node
  <plato vegetariano="true">
    <nombre>Arepas de verduras</nombre>
    <precio>8.50</precio>
  </plato>
into db:get("mercado")//puesto[@id = "P02"]/platos
```

### Cambiar un valor

```xquery
replace value of node
  db:get("mercado")//puesto[@id = "P03"]//plato[1]/precio
with "8.00"
```

### Eliminar

```xquery
delete node
  db:get("mercado")//puesto[@id = "P01"]//plato[nombre = "Tagine de pollo"]
```

### Renombrar

```xquery
rename node
  db:get("mercado")/mercado/puestos
as "establecimientos"
```

Las consultas de actualización modifican la base. Deben probarse primero sobre una copia.

## 5.20. Errores frecuentes

- Mezclar cadenas y números sin conversión.
- Crear elementos con nombres no válidos.
- Agrupar por nodos cuando se necesita su texto.
- Olvidar que `distinct-values()` devuelve valores atómicos.
- Ejecutar una actualización sin copia.
- Generar JSON sin especificar el método de serialización.
- Confundir una secuencia con un único elemento.

## 5.21. Actividades

1. Calcula el precio medio.
2. Muestra el plato más barato.
3. Agrupa los puestos por zona.
4. Crea un menú vegetariano ordenado.
5. Genera una tabla HTML.
6. Genera un resumen JSON.
7. Escribe una función para clasificar platos por precio.

