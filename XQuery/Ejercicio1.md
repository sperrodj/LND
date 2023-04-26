# XQuery

_Ejercicio visto en clase._

Para el archivo bailes.xml:

### 1. Muestra el nombre de todos los bailes.
```
for $baile in //bailes/baile/nombre/text()
return $baile
```

### 2. Muestra el nombre y precio de todos los bailes.
```
for $baile in //bailes/baile
return 
<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>    
</baile>
```

### 3. Muestra el nombre y precio de todos los bailes donde su precio es mayor que 40.
```
for $baile in //bailes/baile
where $baile/number(precio) > 40
return 
<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio> 
</baile>
```
