# 7. Resumen, autoevaluación y ejercicios

[← Anterior](06-validacion-y-errores.md) · [Volver al índice](README.md)

## 7.1. Mapa de conceptos

| Concepto | Idea principal |
|---|---|
| Bien formado | Cumple la sintaxis XML |
| Válido | Está bien formado y cumple una DTD o XSD |
| DTD | Define estructura, cardinalidades, atributos y entidades |
| XSD | Define estructura, tipos y restricciones precisas |
| `#PCDATA` | Contenido textual en DTD |
| `?`, `*`, `+` | Cardinalidades en DTD |
| `#REQUIRED` | Atributo obligatorio en DTD |
| `ID` | Identificador único |
| `IDREF` | Referencia a un identificador |
| `xs:sequence` | Hijos en orden |
| `xs:choice` | Elección entre alternativas |
| `minOccurs` | Número mínimo de apariciones |
| `maxOccurs` | Número máximo de apariciones |
| `xs:restriction` | Crea un tipo limitado |
| `xs:enumeration` | Lista de valores permitidos |
| `xs:pattern` | Patrón que debe cumplir el texto |

## 7.2. Traducción de requisitos

| Requisito | DTD | XSD |
|---|---|---|
| Exactamente uno | Sin modificador | Valores por defecto `1` y `1` |
| Cero o uno | `?` | `minOccurs="0" maxOccurs="1"` |
| Cero o más | `*` | `minOccurs="0" maxOccurs="unbounded"` |
| Uno o más | `+` | `minOccurs="1" maxOccurs="unbounded"` |
| Alternativa | `a \| b` | `xs:choice` |
| Orden | `(a, b, c)` | `xs:sequence` |
| Atributo obligatorio | `#REQUIRED` | `use="required"` |
| Lista cerrada | Enumeración | `xs:enumeration` |

## 7.3. Procedimiento para crear una DTD

1. Identifica el elemento raíz.
2. Dibuja el árbol XML.
3. Declara los elementos de arriba hacia abajo.
4. Decide el orden de los hijos.
5. Asigna cardinalidades.
6. Declara elementos textuales como `#PCDATA`.
7. Añade atributos y decide si son obligatorios.
8. Utiliza enumeraciones para valores cerrados.
9. Define identificadores y referencias si existen.
10. Asocia la DTD y prueba casos válidos e inválidos.

## 7.4. Procedimiento para crear un XSD

1. Identifica elementos simples y complejos.
2. Elige tipos predefinidos adecuados.
3. Define la estructura mediante `sequence`, `choice` o `all`.
4. Añade `minOccurs` y `maxOccurs`.
5. Declara los atributos después del modelo de contenido.
6. Crea tipos propios para enumeraciones, rangos y patrones.
7. Nombra los tipos reutilizables.
8. Asocia el esquema al XML.
9. Valida un documento mínimo y uno completo.
10. Prueba deliberadamente valores incorrectos.

## 7.5. Autoevaluación

### Preguntas

1. ¿Qué dos condiciones debe cumplir un XML válido?
2. ¿Qué diferencia existe entre `*` y `+` en DTD?
3. ¿Qué expresa `#IMPLIED`?
4. ¿Para qué se utiliza `IDREF`?
5. ¿Qué diferencia existe entre `xs:sequence` y `xs:choice`?
6. ¿Cómo se indica en XSD que un elemento puede aparecer cualquier cantidad de veces?
7. ¿Qué tipo usarías para un precio?
8. ¿Qué faceta permite limitar una lista de valores?
9. ¿Puede DTD comprobar que un precio sea positivo?
10. ¿Por qué debemos probar también documentos inválidos?

### Respuestas breves

1. Estar bien formado y cumplir la DTD o XSD asociada.
2. `*` permite cero apariciones; `+` exige al menos una.
3. Que el atributo es opcional.
4. Para referenciar un identificador `ID` existente.
5. `sequence` exige todos los elementos en orden; `choice` selecciona alternativas.
6. `maxOccurs="unbounded"`.
7. `xs:decimal`, posiblemente restringido.
8. `xs:enumeration`.
9. No de forma tipada; para ello es preferible XSD.
10. Para comprobar que el esquema rechaza aquello que debería impedir.

## 7.6. Ejercicio 1: interpretar una DTD

```dtd
<!ELEMENT torneo (nombre, equipo+, patrocinador?)>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT equipo (nombre, jugador+)>
<!ATTLIST equipo id ID #REQUIRED>
<!ELEMENT jugador (#PCDATA)>
<!ATTLIST jugador dorsal CDATA #REQUIRED>
<!ELEMENT patrocinador (#PCDATA)>
```

Responde:

1. ¿Cuántos equipos como mínimo debe tener el torneo?
2. ¿Es obligatorio el patrocinador?
3. ¿Puede existir un equipo sin jugadores?
4. ¿Qué atributos son obligatorios?
5. Escribe un XML mínimo válido.

## 7.7. Ejercicio 2: corregir una DTD

Localiza y corrige los problemas:

```dtd
<!ELEMENT biblioteca libro+>
<!ELEMENT libro (titulo | autor, paginas)>
<!ELEMENT titulo PCDATA>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT paginas (#PCDATA)>
<!ATTLIST libro id ID IMPLIED>
```

Pistas:

- Revisa los paréntesis.
- Revisa `#PCDATA`.
- Revisa la condición del atributo.
- Decide si se quería una secuencia o una alternativa.

## 7.8. Ejercicio 3: crear una DTD

Diseña una DTD externa para una colección de videojuegos:

- La raíz es `catalogo`.
- Contiene uno o más `videojuego`.
- Cada videojuego tiene título, desarrolladora, fecha de lanzamiento y una o más plataformas.
- La descripción es opcional.
- Cada videojuego posee un identificador único obligatorio.
- El género debe ser `accion`, `aventura`, `rol`, `estrategia` o `deportes`.
- Puede indicarse si contiene modo multijugador; su valor predeterminado es `no`.

Crea además un XML con tres videojuegos y comprueba su validez.

## 7.9. Ejercicio 4: interpretar XSD

```xml
<xs:simpleType name="tipoPuntuacion">
  <xs:restriction base="xs:decimal">
    <xs:minInclusive value="0"/>
    <xs:maxInclusive value="10"/>
    <xs:fractionDigits value="1"/>
  </xs:restriction>
</xs:simpleType>
```

Indica si serían válidos:

- `7.5`
- `10`
- `10.5`
- `-1`
- `notable`
- `8.75`

Justifica cada respuesta.

## 7.10. Ejercicio 5: crear un XSD

Crea un esquema para un equipo de League of Legends:

- La raíz `equipo` tiene un nombre obligatorio.
- Contiene exactamente cinco jugadores.
- Cada jugador tiene alias, rol, nivel y campeón principal.
- El identificador del jugador es obligatorio y único.
- Los roles admitidos son `top`, `jungle`, `mid`, `adc` y `support`.
- El nivel es un entero entre 1 y 1000.
- El alias debe tener entre 3 y 20 caracteres.
- El jugador puede tener una nacionalidad opcional.

Después crea:

1. Un XML válido.
2. Un XML con cuatro jugadores.
3. Un XML con un rol no permitido.
4. Un XML con identificadores repetidos.

Anota el mensaje del validador en cada caso inválido.

## 7.11. Ejercicio 6: DTD frente a XSD

Para cada requisito, indica si puede comprobarse adecuadamente con DTD, si necesita XSD o si no puede garantizarse solo mediante validación estructural:

1. Debe existir al menos un plato.
2. El precio debe ser positivo.
3. El correo debe seguir un patrón concreto.
4. El nombre del restaurante debe coincidir con un negocio real.
5. El identificador no puede repetirse.
6. La fecha debe tener formato ISO.
7. Los platos deben estar realmente disponibles hoy.

## 7.12. Reto final de la unidad

Recupera la carta XML del guachinche y crea:

- Una DTD que valide su estructura.
- Un XSD que añada tipos y restricciones más precisas.
- Un XML válido mínimo.
- Un XML válido completo.
- Tres XML inválidos, cada uno con un error diferente.
- Una tabla comparando qué errores detecta DTD y cuáles detecta XSD.

La solución debe demostrar no solo que el caso correcto funciona, sino que las reglas rechazan casos incorrectos.

## 7.13. Glosario

- **DTD:** definición estructural para documentos XML.
- **Esquema:** conjunto formal de reglas que debe cumplir un documento.
- **Faceta:** restricción aplicada a un tipo XSD.
- **Instancia:** documento XML que se valida contra un esquema.
- **Modelo de contenido:** hijos y texto permitidos dentro de un elemento.
- **Tipo complejo:** elemento que contiene hijos o atributos.
- **Tipo simple:** valor sin hijos ni atributos.
- **Validación:** comprobación de un XML frente a reglas declaradas.
- **Vocabulario:** conjunto de elementos, atributos y reglas para un dominio.

---

[← Anterior](06-validacion-y-errores.md) · [Volver al índice](README.md)
