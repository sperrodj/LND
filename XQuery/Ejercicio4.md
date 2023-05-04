# XQuery

_Ejercicio visto en clase._

Para el archivo bailes.xml:

### 10. Obtener el precio del baile con el precio más caro.
```
max(
  for $baile in //bailes/baile
  return $baile/precio/text()  
)
```

### 11. Obtener el precio y el nombre del baile con el precio más caro.
```
let $max := max(
  for $baile in //bailes/baile
  return $baile/precio/text()  
)
for $baile in //bailes/baile
where $baile/precio = $max
return 
<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```
o
```
for $baile in //bailes/baile/precio
where $baile = max(//precio)
return $baile/text() | $baile/../nombre/text()
```
o
```
let $max := max(
   $baile/precio
)
for $baile in //bailes/baile
where $baile/precio = $max
return 
<baile>
  <nombre precio="{$max}">{$baile/nombre}</nombre>
</baile>
```

### 12. Obtener el precio del baile con el precio más barato.
```
min(
  for $baile in //bailes/baile
  return $baile/precio/text()  
)
```

### 13. Obtener el precio y el nombre del baile con el precio más barato.
```
let $min := min(
  for $baile in //bailes/baile
  return $baile/precio/text()  
)
for $baile in //bailes/baile
where $baile/precio = $min
return 
<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```

### 14. Obtener la suma del precio por el número de plazas de todas las clases. Resultado: 29250.
```
sum(
  for $baile in //bailes/baile
  return $baile/precio * $baile/plazas
)
```

### 15. Obtener el dia, mes y año de los bailes mensuales, tanto del comienzo como del final. 
```
for $baile in //baile
where $baile/precio/@cuota = "mensual"
return 
<baile>
  <comienzo>
    <dia>{day-from-date($baile/comienzo)}</dia>
    <mes>{month-from-date($baile/comienzo)}</mes>
    <anio>{year-from-date($baile/comienzo)}</anio>
  </comienzo>
  <fin>
    <dia>{day-from-date($baile/fin)}</dia>
    <mes>{month-from-date($baile/fin)}</mes>
    <anio>{year-from-date($baile/fin)}</anio>
  </fin>
</baile>
```
### 16. Obtener los bailes que tengan mas de 100 dias de diferencia.
```
for $baile in //baile
where days-from-duration(xs:date($baile/fin)-xs:date($baile/comienzo)) > 100
return $baile
```

### 17. Obtener la diferencia de dias del comienzo del baile con la fecha actual.
```
for $baile in //baile
return days-from-duration(current-date()-xs:date($baile/comienzo))
```
