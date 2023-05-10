# XQuery

_Actividad XML - XQuery 1._

### Ejercicio 1

Dado el siguiente documento XML realiza las siguientes consultas con XQuery:

```
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
  <book category="COOKING">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>
  <book category="CHILDREN">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book category="WEB">
    <title lang="en">XQuery Kick Start</title>
    <author>James McGovern</author>
    <author>Per Bothner</author>
    <author>Kurt Cagle</author>
    <author>James Linn</author>
    <author>Vaidyanathan Nagarajan</author>
    <year>2003</year>
    <price>49.99</price>
  </book>
  <book category="WEB">
    <title lang="en">Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore> 
```
### 1.	Mostrar los títulos de los libros con la etiqueta "titulo".
```
for $titulo in /bookstore/book/title/text()
return <titulo>{$titulo}</titulo>
```
### 2.	Mostrar los libros cuyo precio sea menor o igual a 30. Primero incluyendo la condición en la cláusula "where" y luego en la ruta del XPath.
```
for $libro in /bookstore/book[price<=30]
return $libro
```
o
```
for $libro in /bookstore/book
where $libro/price <= 30
return $libro
```
### 3.	Mostrar sólo el título de los libros cuyo precio sea menor o igual a 30.
```
for $libro in /bookstore/book
where $libro/price <= 30
return $libro/title
```
### 4.	Mostrar sólo el título sin atributos de los libros cuyo precio sea menor o igual a 30.
```
for $libro in /bookstore/book
where $libro/price <= 30
return $libro/title/text()
```
### 5.	Mostrar el título y el autor de los libros del año 2005, y etiquetar cada uno de ellos con "lib2005".
```
for $libro in /bookstore/book
where $libro/year=2005
return <lib2005>{$libro/title,$libro/author}</lib2005>
```
### 6.	Mostrar los años de publicación, primero con "for" y luego con "let" para comprobar la diferencia entre ellos. Etiquetar la salida con "publicacion".
```
for $year in /bookstore/book/year
return <publicacion>{$year/text()}</publicacion>
```
o
```
let $year := /bookstore/book/year
return <publicacion>{$year}</publicacion>
```
### 7.	Mostrar los libros ordenados primero por "category" y luego por "title" en una sola consulta.
```
for $libro in /bookstore/book
order by $libro/@category,$libro/title
return $libro
```
### 8.	Mostrar cuántos libros hay, y etiquetarlo con "total".
```
let $num_libro := count(/bookstore/book)
return <total>{$num_libro}</total>
```
### 9.	Mostrar los títulos de los libros y al final una etiqueta con el número total de libros.
```
let $total := count(/bookstore/book),
    $titulos := /bookstore/book/title/text()
return 
      <resultado>
        <titulo>{$titulos}</titulo>
        <numero_libros>{$total}</numero_libros>
      </resultado>
```
### 10.	Mostrar el precio mínimo y máximo de los libros.
```
let $max := max(/bookstore/book/price), 
    $min := min(/bookstore/book/price)
return
<resultado>
  <max>{$max}</max>
  <min>{$min}</min>
</resultado>
```
### 11.	Mostrar el título del libro, su precio y su precio con el IVA incluido, cada uno con su propia etiqueta. Ordénalos por precio con IVA.
```
for $libro in /bookstore/book
order by $libro/price * 1.21
return 
<libro>
  <titulo>{$libro/title/text()}</titulo>
  <precio>{$libro/price/text()} €</precio>
  <precio_iva>{$libro/price * 1.21} €</precio_iva>
</libro>
```
### 12.	Mostrar la suma total de los precios de los libros con la etiqueta "total".
```
let $libros := /bookstore/book
return <total>{sum($libros/price)}</total>
```
### 13.	Mostrar cada uno de los precios de los libros, y al final una nueva etiqueta con la suma de los precios.
```
<libros>
{
  for $libros in /bookstore/book
  return $libros/price
}
{
  let $libros := /bookstore/book
  return <total>{sum($libros/price)}</total>
}
</libros>
```
### 14.	Mostrar el título y el número de autores que tiene cada título en etiquetas diferentes.
```
for $libros in /bookstore/book
return 
  <libro>
    {$libros/title}
    <autores>{count($libros/author)}</autores>
  </libro>
```
### 15.	Mostrar en la misma etiqueta el título y entre paréntesis el número de autores que tiene ese título.
```
for $libros in /bookstore/book
return <libro>{$libros/title/text()}({count($libros/author)})</libro>
```
### 16.	Mostrar los libros escritos en años que terminen en "3".
```
for $libros in /bookstore/book
where ends-with($libros/year, '3')
return $libros
```
### 17.	Mostrar los libros cuya categoría empiece por "C".
```
for $libros in /bookstore/book
where starts-with($libros/@category, 'C')
return $libros
```
### 18.	Mostrar los libros que tengan una "X" mayúscula o minúscula en el título.
```
for $libros in /bookstore/book
where contains(lower-case($libros/title), 'X')
return $libros
```
### 19.	Mostrar el título y el número de caracteres que tiene cada título, cada uno con su propia etiqueta.
```
for $libros in /bookstore/book
return 
  <libro>
    {$libros/title}
    <length>{string-length($libros/title)}</length>
  </libro>
```
### 20.	Mostrar todos los años en los que se ha publicado un libro eliminando los repetidos. Etiquétalos con "año".
```
for $años in distinct-values(/bookstore/book/year)
return <año>{$años}</año>
```
### 21.	Mostrar todos los autores eliminando los que se repiten y ordenados por el número de caracteres que tiene cada autor.
```
for $autores in distinct-values(/bookstore/book/author)
order by string-length($autores)
return <autor>{$autores}</autor>
```
### 22.	Mostrar los títulos en una tabla de HTML.
```
<table>
{
  for $libros in /bookstore/book
  return 
    <tr>
      <td>{$libros/title/text()}</td>
    </tr>
}
</table>
```
 
