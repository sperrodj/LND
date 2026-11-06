# Unidad 4. XPath: consulta y navegación de documentos XML

## 1. ¿Qué vamos a aprender?

XPath es un lenguaje que permite **localizar y seleccionar información dentro de un documento XML**. Su nombre procede de *XML Path Language*, porque muchas de sus expresiones se parecen a rutas que recorren el árbol de un documento.

Al finalizar la unidad podrás:

- Interpretar un documento XML como un árbol de nodos.
- Escribir rutas absolutas y relativas.
- Seleccionar elementos, atributos y contenido textual.
- Aplicar filtros mediante predicados.
- Utilizar operadores y funciones de XPath 1.0.
- Navegar mediante ejes como `child`, `parent`, `ancestor` y `following-sibling`.
- Ejecutar expresiones XPath con Visual Studio Code y `xmllint`.
- Diseñar consultas XPath para resolver problemas reales.

## 2. Conocimientos previos

Antes de comenzar debes recordar:

- La sintaxis básica de XML.
- Los conceptos de elemento raíz, padre, hijo y hermano.
- La diferencia entre elementos y atributos.
- Qué significa que un XML esté bien formado.
- Cómo validar o comprobar un XML desde la terminal.

## 3. Archivos de la unidad

| Archivo | Contenido |
|---|---|
| [01-modelo-de-arbol.md](01-modelo-de-arbol.md) | Modelo de árbol, nodos y contexto |
| [02-rutas-y-seleccion.md](02-rutas-y-seleccion.md) | Rutas absolutas, relativas y selección básica |
| [03-predicados-y-operadores.md](03-predicados-y-operadores.md) | Filtros, posiciones, comparaciones y lógica |
| [04-funciones-xpath.md](04-funciones-xpath.md) | Funciones de cadenas, números y nodos |
| [05-ejes-de-navegacion.md](05-ejes-de-navegacion.md) | Navegación avanzada mediante ejes |
| [06-ejecucion-y-depuracion.md](06-ejecucion-y-depuracion.md) | VS Code, `xmllint` y resolución de errores |
| [07-practica-guiada.md](07-practica-guiada.md) | Práctica paso a paso sobre un catálogo de videojuegos |
| [08-actividad-evaluable.md](08-actividad-evaluable.md) | Actividad final evaluable |
| [chuleta-xpath.md](chuleta-xpath.md) | Resumen de expresiones frecuentes |
| [catalogo-videojuegos.xml](catalogo-videojuegos.xml) | XML utilizado en los ejemplos y prácticas |

## 4. Documento XML de referencia

La mayoría de los ejemplos utilizarán este catálogo:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo actualizado="2026-11-06">
  <videojuego id="V001" disponible="true">
    <titulo>Hollow Knight</titulo>
    <desarrolladora pais="Australia">Team Cherry</desarrolladora>
    <generos>
      <genero>Metroidvania</genero>
      <genero>Acción</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>Switch</plataforma>
    </plataformas>
    <precio moneda="EUR">14.99</precio>
    <puntuacion>9.2</puntuacion>
  </videojuego>

  <videojuego id="V002" disponible="true">
    <titulo>League of Legends</titulo>
    <desarrolladora pais="Estados Unidos">Riot Games</desarrolladora>
    <generos>
      <genero>MOBA</genero>
      <genero>Estrategia</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
    </plataformas>
    <precio moneda="EUR">0</precio>
    <puntuacion>8.1</puntuacion>
  </videojuego>

  <videojuego id="V003" disponible="false">
    <titulo>Marvel's Spider-Man 2</titulo>
    <desarrolladora pais="Estados Unidos">Insomniac Games</desarrolladora>
    <generos>
      <genero>Acción</genero>
      <genero>Aventura</genero>
    </generos>
    <plataformas>
      <plataforma>PS5</plataforma>
      <plataforma>PC</plataforma>
    </plataformas>
    <precio moneda="EUR">59.99</precio>
    <puntuacion>8.8</puntuacion>
  </videojuego>

  <videojuego id="V004" disponible="true">
    <titulo>EA Sports FC 27</titulo>
    <desarrolladora pais="Canadá">EA Sports</desarrolladora>
    <generos>
      <genero>Deportes</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>PS5</plataforma>
      <plataforma>Xbox Series</plataforma>
    </plataformas>
    <precio moneda="EUR">79.99</precio>
    <puntuacion>7.4</puntuacion>
  </videojuego>

  <videojuego id="V005" disponible="true">
    <titulo>Jujutsu Kaisen Cursed Clash</titulo>
    <desarrolladora pais="Japón">Byking</desarrolladora>
    <generos>
      <genero>Lucha</genero>
      <genero>Anime</genero>
    </generos>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>PS5</plataforma>
      <plataforma>Switch</plataforma>
    </plataformas>
    <precio moneda="EUR">49.99</precio>
    <puntuacion>6.2</puntuacion>
    <observaciones>Basado en el manga y el anime.</observaciones>
  </videojuego>
</catalogo>
```

Guárdalo como `catalogo-videojuegos.xml` para probar las consultas de los apuntes.

## 5. Versión utilizada

El núcleo de la unidad utiliza **XPath 1.0**, compatible con `xmllint`. Algunas aplicaciones admiten XPath 2.0 o 3.1, pero sus funciones no siempre funcionan en las herramientas básicas. Cuando una expresión no pertenezca a XPath 1.0 se indicará expresamente.

---

> XPath no modifica el XML: únicamente selecciona nodos o calcula resultados a partir de ellos.
