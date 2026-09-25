# Bloque 5. Espacios de nombres XML

[← Buena formación](04-documentos-bien-formados.md) 

## Objetivos del bloque

- Explicar por qué aparecen conflictos entre vocabularios XML.
- Declarar espacios de nombres con `xmlns`.
- Utilizar prefijos y espacios de nombres predeterminados.
- Interpretar correctamente el nombre expandido de elementos y atributos.

## 1. El problema de los nombres repetidos

XML permite crear vocabularios. Dos vocabularios distintos pueden utilizar el mismo nombre con significados diferentes.

Una tienda puede usar `tabla` para un mueble:

```xml
<tabla>
  <material>madera</material>
</tabla>
```

HTML utiliza `table` para una tabla de datos. En documentos más complejos, distintos vocabularios podrían compartir nombres como `titulo`, `item`, `table` o `codigo`.

Los **espacios de nombres** permiten identificar a qué vocabulario pertenece cada nombre.

## 2. URI del espacio de nombres

Un espacio de nombres se identifica mediante una **URI**:

```text
https://ejemplo.com/videojuegos
```

La URI funciona como identificador único. No es obligatorio que conduzca a una página descargable ni a un esquema.

> [!IMPORTANT]
> El espacio de nombres no se identifica por el prefijo. Se identifica por la URI.

## 3. Declaración con prefijo

Se utiliza el atributo reservado `xmlns`:

```xml
<vg:catalogo xmlns:vg="https://ejemplo.com/videojuegos">
  <vg:videojuego>
    <vg:titulo>Celeste</vg:titulo>
  </vg:videojuego>
</vg:catalogo>
```

En la declaración:

- `xmlns:vg` declara el prefijo `vg`.
- `https://ejemplo.com/videojuegos` es la URI del espacio.
- `vg:catalogo` y `vg:titulo` pertenecen a ese espacio.

La forma `prefijo:nombreLocal` se denomina **nombre cualificado**.

## 4. El prefijo es un alias

Estos documentos utilizan prefijos diferentes pero identifican el mismo vocabulario:

```xml
<vg:catalogo xmlns:vg="https://ejemplo.com/videojuegos">
  <vg:titulo>Celeste</vg:titulo>
</vg:catalogo>
```

```xml
<j:catalogo xmlns:j="https://ejemplo.com/videojuegos">
  <j:titulo>Celeste</j:titulo>
</j:catalogo>
```

`vg` y `j` son alias elegidos por el autor. La identidad real procede de la URI.

Podemos pensar en el nombre completo como:

```text
{https://ejemplo.com/videojuegos}titulo
```

Esto se conoce como **nombre expandido**: URI del espacio más nombre local.

## 5. Combinar vocabularios

Un documento puede combinar información propia con SVG:

```xml
<vg:videojuego
  xmlns:vg="https://ejemplo.com/videojuegos"
  xmlns:svg="http://www.w3.org/2000/svg">

  <vg:titulo>Celeste</vg:titulo>

  <svg:svg viewBox="0 0 100 100">
    <svg:circle cx="50" cy="50" r="40" />
  </svg:svg>
</vg:videojuego>
```

El prefijo `vg` identifica el vocabulario del catálogo y `svg` identifica SVG. Así, el procesador distingue ambos conjuntos de elementos.

## 6. Ámbito de una declaración

Una declaración afecta al elemento en el que aparece y a sus descendientes, salvo que otra declaración la sustituya.

```xml
<vg:catalogo xmlns:vg="https://ejemplo.com/videojuegos">
  <vg:videojuego>
    <vg:titulo>Hades</vg:titulo>
  </vg:videojuego>
</vg:catalogo>
```

No es necesario repetir `xmlns:vg` en cada elemento.

También puede declararse en un elemento interior si solo se necesita allí:

```xml
<catalogo>
  <grafico xmlns:svg="http://www.w3.org/2000/svg">
    <svg:svg />
  </grafico>
</catalogo>
```

## 7. Espacio de nombres predeterminado

Puede declararse sin prefijo:

```xml
<catalogo xmlns="https://ejemplo.com/videojuegos">
  <videojuego>
    <titulo>Celeste</titulo>
  </videojuego>
</catalogo>
```

Los elementos sin prefijo pertenecen al espacio predeterminado.

### Cambiar o eliminar el espacio predeterminado

```xml
<catalogo xmlns="https://ejemplo.com/videojuegos">
  <videojuego>
    <titulo>Celeste</titulo>
    <nota xmlns="">Documento de uso interno</nota>
  </videojuego>
</catalogo>
```

`nota` no pertenece al espacio predeterminado porque `xmlns=""` lo elimina en ese elemento.

## 8. Los atributos y el espacio predeterminado

El espacio predeterminado se aplica a los **elementos sin prefijo**, pero no a los atributos sin prefijo.

```xml
<videojuego xmlns="https://ejemplo.com/videojuegos" id="V001">
  <titulo>Celeste</titulo>
</videojuego>
```

- `videojuego` y `titulo` pertenecen al espacio de videojuegos.
- `id` no pertenece a ese espacio de nombres.

Si un atributo debe pertenecer expresamente a un espacio, necesita prefijo:

```xml
<videojuego
  xmlns="https://ejemplo.com/videojuegos"
  xmlns:meta="https://ejemplo.com/metadatos"
  meta:revision="3">
  <titulo>Celeste</titulo>
</videojuego>
```

## 9. Errores frecuentes

### Prefijo no declarado

```xml
<!-- Incorrecto -->
<vg:catalogo>
  <vg:titulo>Celeste</vg:titulo>
</vg:catalogo>
```

No existe una declaración `xmlns:vg`.

### Creer que el prefijo es la identidad

Dos prefijos distintos pueden señalar la misma URI. Dos documentos que utilizan `vg` con URI diferentes no emplean el mismo espacio.

### Confundir URI con ubicación obligatoria

Una URI de espacio de nombres identifica; no tiene por qué devolver un archivo al abrirse en el navegador.

### Pensar que el espacio predeterminado incluye atributos

Los atributos sin prefijo quedan fuera del espacio predeterminado.

### Declarar prefijos que nunca se utilizan

No suele romper el documento, pero añade ruido y dificulta la lectura.

## 10. Ejemplo integrado

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo
  xmlns="https://ejemplo.com/videojuegos"
  xmlns:meta="https://ejemplo.com/metadatos"
  xmlns:svg="http://www.w3.org/2000/svg"
  meta:version="1.0">

  <videojuego id="V001">
    <titulo>Celeste</titulo>
    <caratula>
      <svg:svg viewBox="0 0 100 100">
        <svg:rect x="10" y="10" width="80" height="80" />
      </svg:svg>
    </caratula>
  </videojuego>
</catalogo>
```

Análisis:

- Los elementos sin prefijo pertenecen al vocabulario de videojuegos.
- `meta:version` pertenece al vocabulario de metadatos.
- Los elementos con `svg:` pertenecen a SVG.
- Los atributos `id`, `viewBox`, `x`, `y`, `width` y `height` no reciben automáticamente el espacio predeterminado.

## 11. Actividad breve

Corrige y explica este documento:

```xml
<tienda xmlns="https://ejemplo.com/tienda">
  <producto id="P01">
    <nombre>Cuaderno</nombre>
    <svg:svg viewBox="0 0 20 20">
      <svg:circle cx="10" cy="10" r="8" />
    </svg:svg>
  </producto>
</tienda>
```

1. ¿Qué error existe?
2. Añade la declaración necesaria para SVG.
3. ¿A qué espacio pertenece `producto`?
4. ¿Pertenece `id` al espacio predeterminado?
5. Cambia el documento para usar el prefijo `t` en el vocabulario de tienda.

---

[← Buena formación](04-documentos-bien-formados.md)
