# XQuery

_Ejercicio visto en clase._

Para el archivo bailes.xml:

### 7. Mostrar todos los bailes, excepto el 3 y 5.
```
for $baile in //bailes/baile
where $baile/@id != 3 and $baile/@id != 5
return $baile
```

### 8. Mostrar profesores que den clases de bailes por una cuota mensual.
```
for $baile in //bailes/baile
where $baile/precio/@cuota = "mensual"
return $baile/profesor/text()
```

### 9. Mostrar el nombre de los bailes de la sala 1, que se pague con euros y el precio sea menor a 35.
```
for $baile in //bailes/baile
where $baile/sala/text() = "1" and $baile/precio/@moneda = "euro" and $baile/number(precio) < 35
return $baile/nombre/text()
```
