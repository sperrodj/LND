# 2. DTD: elementos y modelos de contenido

[← Anterior](01-bien-formado-y-valido.md) · [Volver al índice](README.md) · [Siguiente →](03-dtd-atributos-y-entidades.md)

## 2.1. ¿Qué es una DTD?

Una **DTD** (*Document Type Definition*) define la estructura permitida de un vocabulario XML.

Puede declarar:

- Elementos.
- Orden y anidamiento.
- Repeticiones.
- Alternativas.
- Atributos.
- Entidades.

DTD utiliza una sintaxis propia, no XML.

## 2.2. DTD interna

Una DTD interna se escribe dentro del propio documento, en la declaración `DOCTYPE`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plato [
  <!ELEMENT plato (nombre, descripcion, precio)>
  <!ELEMENT nombre (#PCDATA)>
  <!ELEMENT descripcion (#PCDATA)>
  <!ELEMENT precio (#PCDATA)>
]>
<plato>
  <nombre>Queso asado</nombre>
  <descripcion>Queso canario con mojos.</descripcion>
  <precio>8.50</precio>
</plato>
```

El nombre situado después de `DOCTYPE` debe coincidir con el elemento raíz.

Las DTD internas son cómodas para ejemplos pequeños, pero mezclan datos y reglas.

## 2.3. DTD externa

En proyectos reales suele utilizarse un archivo independiente.

`plato.dtd`:

```dtd
<!ELEMENT plato (nombre, descripcion, precio)>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT descripcion (#PCDATA)>
<!ELEMENT precio (#PCDATA)>
```

`plato.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plato SYSTEM "plato.dtd">
<plato>
  <nombre>Queso asado</nombre>
  <descripcion>Queso canario con mojos.</descripcion>
  <precio>8.50</precio>
</plato>
```

`SYSTEM` indica que la DTD se encuentra en una ubicación concreta. La ruta es relativa al XML si solo se escribe el nombre del archivo.

## 2.4. Declarar elementos

La sintaxis general es:

```dtd
<!ELEMENT nombre modelo-de-contenido>
```

### Elemento con texto

```dtd
<!ELEMENT nombre (#PCDATA)>
```

`#PCDATA` significa texto analizado por el procesador XML. Puede contener caracteres y referencias a entidades.

### Elemento vacío

```dtd
<!ELEMENT separador EMPTY>
```

XML válido:

```xml
<separador/>
```

### Cualquier contenido

```dtd
<!ELEMENT contenido ANY>
```

`ANY` permite casi cualquier combinación declarada. Reduce mucho el control y debe evitarse salvo que exista una razón clara.

## 2.5. Secuencias

La coma exige que los hijos aparezcan en un orden concreto:

```dtd
<!ELEMENT plato (nombre, descripcion, precio)>
```

Válido:

```xml
<plato>
  <nombre>Escaldón</nombre>
  <descripcion>Gofio mezclado con caldo.</descripcion>
  <precio>7.00</precio>
</plato>
```

Inválido:

```xml
<plato>
  <precio>7.00</precio>
  <nombre>Escaldón</nombre>
  <descripcion>Gofio mezclado con caldo.</descripcion>
</plato>
```

## 2.6. Alternativas

La barra vertical representa una elección:

```dtd
<!ELEMENT contacto (telefono | correo)>
```

`contacto` debe contener un teléfono o un correo, pero no ambos con este modelo.

```xml
<contacto>
  <correo>reservas@ejemplo.com</correo>
</contacto>
```

## 2.7. Cardinalidades

DTD utiliza modificadores para indicar cuántas veces puede aparecer un elemento:

| Símbolo | Significado | Mínimo | Máximo |
|---|---|---:|---:|
| Sin símbolo | Exactamente una vez | 1 | 1 |
| `?` | Cero o una vez | 0 | 1 |
| `*` | Cero o más veces | 0 | Sin límite |
| `+` | Una o más veces | 1 | Sin límite |

Ejemplos:

```dtd
<!ELEMENT plato (nombre, descripcion?, precio)>
```

La descripción es opcional.

```dtd
<!ELEMENT carta (seccion+)>
```

La carta necesita al menos una sección.

```dtd
<!ELEMENT seccion (titulo, plato*)>
```

La sección puede no tener platos o contener muchos.

## 2.8. Agrupaciones

Los paréntesis permiten construir reglas más complejas:

```dtd
<!ELEMENT carta (informacion, seccion+, pie?)>
```

La carta debe contener:

1. Una `informacion`.
2. Una o varias `seccion`.
3. Opcionalmente, un `pie`.

Ejemplo con alternativa repetible:

```dtd
<!ELEMENT avisos (alergeno | promocion)*>
```

`avisos` puede contener cualquier cantidad de `alergeno` y `promocion`, incluso intercalados.

## 2.9. Contenido mixto

El contenido mixto combina texto y elementos:

```dtd
<!ELEMENT descripcion (#PCDATA | destacado)*>
<!ELEMENT destacado (#PCDATA)>
```

XML válido:

```xml
<descripcion>
  Queso canario con <destacado>mojo casero</destacado>.
</descripcion>
```

En DTD, los modelos mixtos tienen limitaciones: la alternativa debe incluir `#PCDATA` y terminar normalmente en `*`.

## 2.10. DTD de la carta

```dtd
<!ELEMENT carta (informacion, seccion+, pie?)>
<!ELEMENT informacion (eslogan, ubicacion, horario?, telefono?)>
<!ELEMENT eslogan (#PCDATA)>
<!ELEMENT ubicacion (#PCDATA)>
<!ELEMENT horario (#PCDATA)>
<!ELEMENT telefono (#PCDATA)>

<!ELEMENT seccion (titulo, plato+)>
<!ELEMENT titulo (#PCDATA)>
<!ELEMENT plato (nombre, descripcion?, precio)>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT descripcion (#PCDATA)>
<!ELEMENT precio (#PCDATA)>

<!ELEMENT pie (aviso+)>
<!ELEMENT aviso (#PCDATA)>
```

Observa que todos los elementos utilizados en el XML deben estar declarados.

## 2.11. Errores frecuentes

- Confundir `+` con `*`.
- Declarar un orden diferente al utilizado en el XML.
- Usar un elemento en el XML sin declararlo.
- Escribir `PCDATA` sin `#`.
- Olvidar los paréntesis del modelo de contenido.
- Hacer que el nombre de `DOCTYPE` no coincida con la raíz.
- Confundir «opcional» con «puede aparecer muchas veces».

## 2.12. Ejemplo razonado

Requisito: «Una liga contiene un nombre y uno o varios equipos. Cada equipo posee un nombre, un entrenador opcional y al menos un jugador».

Traducción:

```dtd
<!ELEMENT liga (nombre, equipo+)>
<!ELEMENT equipo (nombre, entrenador?, jugador+)>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT entrenador (#PCDATA)>
<!ELEMENT jugador (#PCDATA)>
```

La dificultad no consiste en memorizar símbolos, sino en convertir cada requisito en orden y cardinalidad.

---

[← Anterior](01-bien-formado-y-valido.md) · [Siguiente →](03-dtd-atributos-y-entidades.md)
