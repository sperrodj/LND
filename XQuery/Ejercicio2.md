# XQuery

_Ejercicio visto en clase._

Para el archivo bailes.xml:

### 4. Mostrar los bailes ordenados por nombre.
```
for $baile in //bailes/baile/nombre/text()
order by $baile
return $baile
```

### 5. Mostrar los nombres de los bailes que contienen una a.
```
for $baile in //bailes/baile/nombre/text()
where contains($baile, "a")
return $baile
```

### 6. Mostrar el nombre de los bailes donde el apellido del profesor sea Lozano.
```
for $baile in //bailes/baile
where contains($baile/profesor, "Lozano")
return $baile/nombre/text()
```
o
```
for $baile in //bailes/baile
where ends-with($baile/profesor, "Lozano")
return $baile/nombre/text()
```
