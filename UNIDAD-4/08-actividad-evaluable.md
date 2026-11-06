# 8. Actividad evaluable: consultas sobre un universo temático

## Descripción

Crearás un documento XML propio y escribirás consultas XPath para recuperar información. Puedes elegir una de estas temáticas:

- Personajes y equipos de Marvel.
- Campeones y roles de League of Legends.
- Personajes, técnicas y clanes de Jujutsu Kaisen.
- Equipos, jugadores y competiciones de fútbol.
- Videojuegos, géneros y plataformas.

## 1. Estructura del repositorio

```text
unidad-04/
└── actividad-evaluable-xpath/
    ├── README.md
    ├── datos.xml
    └── img/
        ├── consulta-01.png
        ├── consulta-02.png
        └── consulta-03.png
```

## 2. Requisitos del XML

`datos.xml` debe contener:

- Declaración XML con codificación UTF-8.
- Un único elemento raíz.
- Un mínimo de seis registros principales.
- Un atributo identificador único en cada registro.
- Al menos otro atributo con información útil.
- Un mínimo de ocho nombres de elementos diferentes.
- Una colección interna repetida en cada registro.
- Un dato compuesto con al menos dos hijos.
- Un elemento opcional presente solo en algunos registros.
- Un comentario XML.
- Algún texto que obligue a utilizar `&amp;`.
- Indentación coherente y documento bien formado.

No es necesario crear DTD ni XSD en esta actividad.

## 3. Consultas obligatorias

Escribe y prueba **18 consultas**:

### Selección básica

1. Seleccionar el elemento raíz.
2. Seleccionar todos los registros principales.
3. Seleccionar el nombre o título de todos los registros.
4. Seleccionar todos los identificadores.
5. Seleccionar todos los valores de la colección repetida.

### Predicados y operadores

6. Seleccionar un registro mediante su identificador.
7. Seleccionar registros que tengan un atributo con un valor concreto.
8. Seleccionar registros que contengan un determinado valor repetido.
9. Seleccionar registros mediante una comparación numérica.
10. Combinar dos condiciones con `and`.
11. Combinar dos condiciones con `or`.
12. Seleccionar registros que no tengan el elemento opcional.

### Posiciones y funciones

13. Seleccionar el primer y el último registro.
14. Seleccionar los registros que ocupan las tres primeras posiciones.
15. Contar los registros principales.
16. Utilizar `contains()` o `starts-with()`.

### Ejes

17. Partir de un nodo descendiente y seleccionar su registro ancestro.
18. Seleccionar un hermano anterior o posterior.

## 4. Consultas de ampliación

Para optar a la máxima calificación, añade al menos dos:

- Cálculo de una media con `sum()`, `count()` y `div`.
- Búsqueda sin distinguir mayúsculas mediante `translate()`.
- Unión de dos conjuntos mediante `|`.
- Consulta que combine un eje, una función y un predicado.

## 5. Documentación en `README.md`

Incluye:

1. Título y temática.
2. Explicación de la información representada.
3. Árbol simplificado del XML.
4. Tabla de decisiones de diseño.
5. Código XML completo en un bloque `xml`.
6. Las 18 expresiones numeradas.
7. Explicación y resultado de cada expresión.
8. Tres capturas de la terminal como mínimo.
9. Un apartado de problemas encontrados y soluciones.
10. Conclusión personal.

## 6. Rúbrica

| Criterio | Peso |
|---|---:|
| XML bien formado y cumplimiento de requisitos | 20 % |
| Selecciones básicas | 15 % |
| Predicados, operadores y posiciones | 25 % |
| Funciones XPath | 15 % |
| Ejes de navegación | 15 % |
| README, evidencias y organización | 10 % |

### Condiciones importantes

- Un XML que no esté bien formado impide probar XPath y limita el primer criterio.
- Las consultas deben estar probadas; no basta con escribirlas.
- Se valorará que las explicaciones estén redactadas con palabras propias.
- Los archivos vacíos o las capturas sin explicación no cuentan como apartados realizados.
- No publiques datos personales ni información sensible.

## 7. Lista de comprobación

- [ ] Mi XML tiene un único elemento raíz.
- [ ] Incluye seis registros como mínimo.
- [ ] Todos los identificadores son únicos.
- [ ] He comprobado el XML con `xmllint --noout`.
- [ ] Las 18 consultas producen el resultado esperado.
- [ ] He utilizado predicados, funciones y ejes.
- [ ] El README explica cada consulta.
- [ ] Las imágenes utilizan rutas relativas.
- [ ] He realizado varios commits descriptivos.
- [ ] El enlace entregado permite acceder al repositorio.
