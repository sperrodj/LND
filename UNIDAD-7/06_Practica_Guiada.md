# 6. Práctica guiada: catálogo de senderos

## 6.1. Objetivo

Crear una base XML en BaseX con información sobre senderos y realizar consultas XQuery que generen diferentes resultados.

Se trabajarán:

- Importación de XML.
- XPath dentro de XQuery.
- Expresiones FLWOR.
- Filtros y ordenación.
- Funciones agregadas.
- Construcción de XML y HTML.

## 6.2. Estructura

```text
practica-senderos-xquery/
├── README.md
├── datos/
│   └── senderos.xml
├── consultas/
│   ├── 01-listado.xq
│   ├── 02-filtro.xq
│   ├── 03-estadisticas.xq
│   ├── 04-resumen-xml.xq
│   └── 05-tabla-html.xq
├── resultados/
│   ├── resumen.xml
│   └── senderos.html
└── img/
    ├── 01-base-creada.png
    └── 02-consultas.png
```

## 6.3. Crear los datos

Guarda como `datos/senderos.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<red-senderos actualizado="2026-11-18">
  <sendero id="S001" isla="Tenerife" circular="true">
    <nombre>Camino de los Guardianes</nombre>
    <municipio>La Orotava</municipio>
    <dificultad>media</dificultad>
    <distancia unidad="km">8.4</distancia>
    <desnivel unidad="m">420</desnivel>
    <duracion unidad="min">210</duracion>
    <servicios>
      <servicio>aparcamiento</servicio>
      <servicio>mirador</servicio>
    </servicios>
  </sendero>

  <sendero id="S002" isla="La Palma" circular="false">
    <nombre>Ruta de las Nubes</nombre>
    <municipio>El Paso</municipio>
    <dificultad>alta</dificultad>
    <distancia unidad="km">13.2</distancia>
    <desnivel unidad="m">780</desnivel>
    <duracion unidad="min">330</duracion>
    <servicios>
      <servicio>transporte</servicio>
      <servicio>área de descanso</servicio>
    </servicios>
  </sendero>

  <sendero id="S003" isla="Gran Canaria" circular="true">
    <nombre>Miradores de Tamadaba</nombre>
    <municipio>Agaete</municipio>
    <dificultad>baja</dificultad>
    <distancia unidad="km">5.6</distancia>
    <desnivel unidad="m">180</desnivel>
    <duracion unidad="min">120</duracion>
    <servicios>
      <servicio>aparcamiento</servicio>
      <servicio>área de descanso</servicio>
      <servicio>mirador</servicio>
    </servicios>
  </sendero>

  <sendero id="S004" isla="La Gomera" circular="false">
    <nombre>Bosque de la Laurisilva</nombre>
    <municipio>Hermigua</municipio>
    <dificultad>media</dificultad>
    <distancia unidad="km">10.1</distancia>
    <desnivel unidad="m">510</desnivel>
    <duracion unidad="min">260</duracion>
    <servicios>
      <servicio>transporte</servicio>
      <servicio>mirador</servicio>
    </servicios>
  </sendero>

  <sendero id="S005" isla="El Hierro" circular="true">
    <nombre>Camino del Sabinar</nombre>
    <municipio>La Frontera</municipio>
    <dificultad>media</dificultad>
    <distancia unidad="km">7.3</distancia>
    <desnivel unidad="m">350</desnivel>
    <duracion unidad="min">185</duracion>
    <servicios>
      <servicio>aparcamiento</servicio>
    </servicios>
  </sendero>
</red-senderos>
```

Comprueba:

```bash
xmllint --noout datos/senderos.xml
```

## 6.4. Crear la base

Desde BaseX GUI:

1. Selecciona **Database → New**.
2. Elige `datos/senderos.xml`.
3. Asigna el nombre `senderos_canarias`.
4. Confirma.

Desde consola:

```bash
basex -c "CREATE DB senderos_canarias datos/senderos.xml"
```

## 6.5. Consulta 1: listado

Guarda `consultas/01-listado.xq`:

```xquery
xquery version "3.1";

for $sendero in db:get("senderos_canarias")/red-senderos/sendero
order by $sendero/nombre
return concat(
  $sendero/@id,
  " — ",
  $sendero/nombre,
  " — ",
  $sendero/@isla
)
```

Ejecuta:

```bash
basex consultas/01-listado.xq
```

## 6.6. Consulta 2: filtro

Senderos de dificultad media con menos de 10 kilómetros:

```xquery
xquery version "3.1";

for $sendero in db:get("senderos_canarias")/red-senderos/sendero
where $sendero/dificultad = "media"
  and xs:decimal($sendero/distancia) < 10
order by xs:decimal($sendero/distancia)
return
  <sendero id="{$sendero/@id}">
    {$sendero/nombre}
    {$sendero/distancia}
  </sendero>
```

Guarda como `consultas/02-filtro.xq`.

## 6.7. Consulta 3: estadísticas

```xquery
xquery version "3.1";

let $senderos :=
  db:get("senderos_canarias")/red-senderos/sendero
return
  <estadisticas>
    <total>{count($senderos)}</total>
    <distancia-media>{
      format-number(avg($senderos/distancia), "0.00")
    }</distancia-media>
    <desnivel-maximo>{max($senderos/desnivel)}</desnivel-maximo>
    <senderos-circulares>{
      count($senderos[@circular = "true"])
    }</senderos-circulares>
  </estadisticas>
```

Guarda como `consultas/03-estadisticas.xq`.

## 6.8. Consulta 4: resumen XML

```xquery
xquery version "3.1";

<catalogo>{
  for $sendero in db:get("senderos_canarias")/red-senderos/sendero
  order by xs:decimal($sendero/duracion)
  return
    <ruta id="{$sendero/@id}" isla="{$sendero/@isla}">
      <titulo>{string($sendero/nombre)}</titulo>
      <nivel>{string($sendero/dificultad)}</nivel>
      <kilometros>{string($sendero/distancia)}</kilometros>
      <horas>{
        format-number(
          xs:decimal($sendero/duracion) div 60,
          "0.0"
        )
      }</horas>
    </ruta>
}</catalogo>
```

Guarda como `consultas/04-resumen-xml.xq`.

Genera el resultado:

```bash
basex consultas/04-resumen-xml.xq > resultados/resumen.xml
```

## 6.9. Consulta 5: tabla HTML

```xquery
xquery version "3.1";

<html lang="es">
  <head>
    <meta charset="UTF-8"/>
    <title>Senderos de Canarias</title>
    <style>
      body {
        font-family: sans-serif;
        max-width: 1000px;
        margin: 2rem auto;
      }
      table {
        width: 100%;
        border-collapse: collapse;
      }
      th, td {
        padding: .7rem;
        border: 1px solid #aaa;
      }
      th {
        background: #dbeafe;
      }
    </style>
  </head>
  <body>
    <h1>Senderos de Canarias</h1>
    <table>
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Isla</th>
          <th>Dificultad</th>
          <th>Distancia</th>
          <th>Estado</th>
        </tr>
      </thead>
      <tbody>{
        for $sendero in
          db:get("senderos_canarias")/red-senderos/sendero
        order by $sendero/@isla, $sendero/nombre
        return
          <tr>
            <td>{string($sendero/nombre)}</td>
            <td>{string($sendero/@isla)}</td>
            <td>{string($sendero/dificultad)}</td>
            <td>{concat($sendero/distancia, " km")}</td>
            <td>{
              if ($sendero/@circular = "true")
              then "Circular"
              else "Lineal"
            }</td>
          </tr>
      }</tbody>
    </table>
  </body>
</html>
```

Guarda como `consultas/05-tabla-html.xq`.

Genera:

```bash
basex consultas/05-tabla-html.xq > resultados/senderos.html
```

## 6.10. Consultas adicionales

### Islas sin repetir

```xquery
distinct-values(
  db:get("senderos_canarias")/red-senderos/sendero/@isla
)
```

### Senderos con aparcamiento

```xquery
db:get("senderos_canarias")/red-senderos/sendero[
  servicios/servicio = "aparcamiento"
]/nombre
```

### Agrupar por dificultad

```xquery
for $sendero in
  db:get("senderos_canarias")/red-senderos/sendero
let $nivel := string($sendero/dificultad)
group by $nivel
order by $nivel
return
  <grupo dificultad="{$nivel}">
    <cantidad>{count($sendero)}</cantidad>
  </grupo>
```

## 6.11. Documentar

El `README.md` debe incluir:

1. Objetivo.
2. Estructura de carpetas.
3. Explicación del XML.
4. Proceso de creación de la base.
5. Explicación de cada consulta.
6. Capturas.
7. Problemas encontrados.
8. Resultados generados.

## 6.12. Ampliaciones

1. Añade dos senderos.
2. Incluye coordenadas.
3. Crea un filtro por isla.
4. Genera un resumen JSON.
5. Agrupa por dificultad.
6. Crea una función que clasifique la duración.
7. Añade una consulta con todos los servicios sin repetir.

## 6.13. Comprobación final

- [ ] El XML está bien formado.
- [ ] La base se llama `senderos_canarias`.
- [ ] Las cinco consultas funcionan.
- [ ] El XML resultante está bien formado.
- [ ] El HTML se abre correctamente.
- [ ] Las consultas incluyen comentarios.
- [ ] El `README.md` explica el trabajo.
- [ ] Las capturas se muestran.
- [ ] Se han realizado commits descriptivos.
- [ ] Los cambios están subidos al repositorio.

