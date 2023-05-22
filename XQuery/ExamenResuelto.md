# XQuery

_Examen Bloque 6. Almacenamiento de información._

### Ejercicio 1

Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

```
<?xml version="1.0" encoding="UTF-8"?>
<libreria>
  <pelicula>
    <titulo idioma="es">Avengers: Endgame</titulo>
    <director>Anthony Russo, Joe Russo</director>
    <año>2019</año>
    <género>Acción</género>
    <precio>9.99</precio>
    <duración>181</duración>
  </pelicula>
  <pelicula>
    <titulo idioma="en">Inception</titulo>
    <director>Christopher Nolan</director>
    <año>2010</año>
    <género>Ciencia ficción</género>
    <precio>12.99</precio>
    <duración>148</duración>
  </pelicula>
  <pelicula>
    <titulo idioma="fr">Le fabuleux destin d'Amélie Poulain</titulo>
    <director>Jean-Pierre Jeunet</director>
    <año>2001</año>
    <género>Comedia romántica</género>
    <precio>14.99</precio>
    <duración>122</duración>
  </pelicula>
  <pelicula>
    <titulo idioma="de">Das Leben der Anderen</titulo>
    <director>Florian Henckel von Donnersmarck</director>
    <año>2006</año>
    <género>Drama</género>
    <precio>19.99</precio>
    <duración>137</duración>
  </pelicula>
</libreria>
```
### 1. Escribe una consulta en XQuery para obtener todos los títulos de las películas en inglés.
```
for $pelicula in //pelicula
where $pelicula/titulo/@idioma = "en"
return $pelicula/titulo
```
### 2. Encuentra la cantidad de películas en la categoría "Acción".
```
let $cantidad := count(//pelicula[género = "Acción"])
return $cantidad
```
### 3. Obtén el título y el director de la película más reciente.
```
let $anioMax := max(//pelicula/año/text())
for $peli in //pelicula
where $peli/año = $anioMax
return (
  $peli/titulo,
  $peli/director
)
```
### 4. Encuentra todas las películas que tengan una duración superior a 120 minutos.
```
for $pelicula in //pelicula
where $pelicula/duración > 120
return $pelicula
```
### 5. Escribe una consulta para calcular el precio promedio de todas las películas.
```
let $precios := //pelicula/precio
return avg($precios)
```
### 6. Obtén el título de la película más cara.
```
max(
  for $peliculas in //pelicula/precio
  return $peliculas
)
```
### 7. Encuentra todas las películas dirigidas por Christopher Nolan.
```
for $pelicula in //pelicula
where $pelicula/director = "Christopher Nolan"
return $pelicula
```
### 8. Obtén el título y el año de lanzamiento de las películas que fueron lanzadas después de 2010 y tienen un precio inferior a 15.
```
for $pelicula in //pelicula
where $pelicula/año > 2010 and $pelicula/precio < 15
return (
  $pelicula/titulo/text(),
  $pelicula/año/text()
)
```
### 9. Encuentra el director de la película cuyo título es "Avengers: Endgame".
```
for $pelicula in //pelicula
where $pelicula/titulo= "Avengers: Endgame"
return $pelicula/director/text()
```
### 10. Escribe una consulta para obtener todas las películas en orden alfabético según su título.
```
for $pelicula in //pelicula
order by $pelicula/titulo/text()
return $pelicula
```
### 11. Encuentra todas las películas cuyo título comienza con la letra "L".
```
for $pelicula in //pelicula
where starts-with($pelicula/titulo/text(), "L")
return $pelicula
```
### 12. Obtén el número total de películas en la librería.
```
let $totalPeliculas := count(//pelicula)
return $totalPeliculas
```
### 13. Encuentra la película con la duración más larga y muestra su título, duración y año de lanzamiento.
```
let $peliMasLarga := max(
  for $peliculas in //pelicula/duración
  return $peliculas
)
for $peli in //pelicula
where $peli/duración = $peliMasLarga
return (
  $peli/titulo,
  $peli/duración,
  $peli/año
)
```
### 14. Calcula el precio total de todas las películas en la librería y muestra el resultado.
```
sum(
  for $peliculas in //pelicula
  return $peliculas/precio
)
```
### 15. Encuentra todos los géneros distintos presentes en la librería y muestra la cantidad de películas para cada género.
```
let $peliculas := //pelicula
let $generos := distinct-values($peliculas/género)
for $genero in $generos
let $cantidad := count($peliculas[género = $genero])
return (
  $genero,
  $cantidad
)
```
### 16. Crea una variable que almacene el número total de películas en la librería. Luego, muestra el título y el precio de las películas cuyo precio es mayor que el promedio de todos los precios.
```
let $peliculas := //pelicula
let $numPeliculas := count($peliculas)
let $precios := $peliculas/precio
let $precioPromedio := avg($precios)
for $pelicula in $peliculas
where $pelicula/precio > $precioPromedio
return (
  $pelicula/titulo/text(),
  $pelicula/precio/text()
)
```
### 17. Escribe una consulta para encontrar el género con la película más corta y muestra el título y la duración de esa película.
```
let $peliculas := //pelicula
let $generos := distinct-values($peliculas/género)
let $peliculaMasCorta :=
  for $genero in $generos
  let $peliculasGenero := $peliculas[género = $genero]
  let $duracionMasCorta := min($peliculasGenero/duración)
  let $pelicula := $peliculasGenero[duración = $duracionMasCorta]
  return <generoPelículaMasCorta género="{$genero}">
           <pelicula>
             <titulo>{data($pelicula/titulo)}</titulo>
             <duracion>{data($pelicula/duración)}</duracion>
           </pelicula>
         </generoPelículaMasCorta>
let $generoMasCorto :=
  for $genero in $peliculaMasCorta
  where $genero/pelicula/duracion = min($peliculaMasCorta/pelicula/duracion)
  return $genero
return $generoMasCorto
```
### 18. Encuentra todas las películas cuyo título contiene la palabra "der" y muestra el título y el director.
``` 
for $pelicula in //pelicula
where contains($pelicula/titulo/text(), "der")
return (
  $pelicula/titulo/text(),
  $pelicula/director/text()
)
```
### 19. Escribe una consulta para obtener el título y el director de las tres películas más recientes en orden descendente de año de lanzamiento.
### 20. Encuentra todos los directores que han dirigido películas en más de un género y muestra el nombre de cada director junto con los géneros en los que ha trabajado.
```
let $peliculas := //pelicula
let $directores := distinct-values($peliculas/director)
for $director in $directores
let $generos := distinct-values($peliculas[director = $director]/género)
where count($generos) > 1
return <director nombre="{$director}">
         {
           for $genero in $generos
           return <genero>{data($genero)}</genero>
         }
       </director>

```
