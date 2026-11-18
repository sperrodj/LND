# 4. Validación, publicación y comparación

## 4.1. Proceso de comprobación

Conviene comprobar un canal en varias fases:

```text
1. Sintaxis XML
2. Reglas del formato
3. Enlaces y recursos
4. Publicación web
5. Prueba en un lector
```

## 4.2. Comprobar que el XML está bien formado

```bash
xmllint --noout rss.xml
```

```bash
xmllint --noout atom.xml
```

Si no aparece ningún mensaje, el documento está bien formado. Esto no demuestra todavía que cumpla todas las reglas de RSS o Atom.

### Formatear el documento

```bash
xmllint --format rss.xml
```

Guardar una copia formateada:

```bash
xmllint --format rss.xml > rss-formateado.xml
```

No debe utilizarse el mismo archivo como entrada y salida mediante `>` porque podría vaciarse antes de ser leído.

## 4.3. Validación específica

Un validador de feeds comprueba aspectos que `xmllint --noout` no detecta:

- Elementos obligatorios.
- Orden y ubicación de los elementos.
- Formatos de fechas.
- Espacios de nombres.
- Identificadores repetidos.
- Tipos MIME.
- Enlaces.
- Recomendaciones de compatibilidad.

Un canal puede ser XML correcto y, sin embargo, contener:

```xml
<pubDate>18/11/2026</pubDate>
```

La etiqueta está bien formada, pero el formato de fecha no es adecuado para RSS.

## 4.4. Tipos MIME

Al publicar los canales, el servidor debería utilizar:

| Formato | Tipo MIME |
|---|---|
| RSS | `application/rss+xml` |
| Atom | `application/atom+xml` |
| XML genérico | `application/xml` |

El tipo MIME informa al cliente de la naturaleza del recurso.

## 4.5. Enlazar el canal desde HTML

### RSS

```html
<link
  rel="alternate"
  type="application/rss+xml"
  title="Letras del Atlántico — RSS"
  href="https://example.com/rss.xml">
```

### Atom

```html
<link
  rel="alternate"
  type="application/atom+xml"
  title="Letras del Atlántico — Atom"
  href="https://example.com/atom.xml">
```

Estos elementos se colocan dentro de `head`.

También puede añadirse un enlace visible:

```html
<a href="rss.xml">Suscribirse mediante RSS</a>
```

## 4.6. Enlaces absolutos

En un canal publicado es recomendable utilizar enlaces absolutos:

```xml
<link>https://example.com/resenas/novela-del-mes</link>
```

Evita:

```xml
<link>resenas/novela-del-mes</link>
```

Un agregador puede procesar el canal fuera del contexto del sitio y no saber resolver una ruta relativa.

## 4.7. HTTPS

La publicación mediante HTTPS:

- Protege el contenido durante la transmisión.
- Evita modificaciones durante el transporte.
- Reduce problemas de contenido mixto.
- Mejora la compatibilidad con servicios modernos.

## 4.8. Actualización del canal

Cuando se publica una entrada:

1. Se añade al canal.
2. Se asigna un identificador estable.
3. Se indica su fecha.
4. Se actualiza la fecha general del canal.
5. Se comprueba la sintaxis.
6. Se valida el formato.
7. Se publica el archivo actualizado.

En general, las publicaciones más recientes se colocan primero.

## 4.9. Identificadores estables

Incorrecto:

```text
Hoy:     noticia-001
Mañana:  noticia-001-corregida
```

Si se trata de la misma publicación, debe mantener su identificador aunque cambie el contenido.

RSS:

```xml
<guid isPermaLink="false">noticia-001</guid>
```

Atom:

```xml
<id>https://example.com/entradas/noticia-001</id>
```

## 4.10. RSS frente a Atom

| Aspecto | RSS 2.0 | Atom 1.0 |
|---|---|---|
| Raíz | `rss` | `feed` |
| Contenedor | `channel` | `feed` |
| Publicación | `item` | `entry` |
| Namespace | No obligatorio | Obligatorio |
| Identificador | `guid` | `id` |
| Fecha de entrada | `pubDate` | `updated` y `published` |
| Enlace | Texto de `link` | Atributo `href` |
| Resumen | `description` | `summary` |
| Contenido completo | Extensiones o `description` | `content` |
| Autor | Texto en `author` | Estructura `author/name` |
| Multimedia | `enclosure` | `link rel="enclosure"` |

## 4.11. Ejemplo equivalente

### RSS

```xml
<item>
  <title>Reseña de la novela del mes</title>
  <link>https://example.com/resenas/novela-del-mes</link>
  <description>Comentamos sus personajes, temas y estilo narrativo.</description>
  <guid isPermaLink="false">resena-novela-001</guid>
  <pubDate>Wed, 18 Nov 2026 09:30:00 +0000</pubDate>
</item>
```

### Atom

```xml
<entry>
  <title>Reseña de la novela del mes</title>
  <link href="https://example.com/resenas/novela-del-mes"/>
  <summary>Comentamos sus personajes, temas y estilo narrativo.</summary>
  <id>https://example.com/entradas/resena-novela-001</id>
  <updated>2026-11-18T09:30:00Z</updated>
</entry>
```

## 4.12. ¿Cuál utilizar?

Los dos formatos pueden resolver necesidades similares.

RSS 2.0 puede resultar:

- Más familiar.
- Más sencillo para una primera toma de contacto.
- Muy habitual en blogs y pódcast.

Atom 1.0 ofrece:

- Reglas más explícitas.
- Identificadores obligatorios.
- Fechas normalizadas.
- Diferenciación entre resumen y contenido.
- Modelo de enlaces más expresivo.

La elección depende de los requisitos, las herramientas utilizadas y la compatibilidad necesaria.

## 4.13. Seguridad y privacidad

Un canal es normalmente público. No debe contener:

- Contraseñas.
- Claves de API.
- Datos personales innecesarios.
- Direcciones privadas.
- Información académica confidencial.
- Enlaces internos que no deban publicarse.

También se debe evitar insertar HTML procedente de usuarios sin revisarlo.

## 4.14. Lista de comprobación

### XML

- [ ] Existe un único elemento raíz.
- [ ] Las etiquetas están correctamente cerradas.
- [ ] Los atributos están entre comillas.
- [ ] Los caracteres reservados están escapados.
- [ ] La codificación es UTF-8.

### RSS

- [ ] `rss` tiene `version="2.0"`.
- [ ] Existe un único `channel`.
- [ ] `channel` contiene `title`, `link` y `description`.
- [ ] Cada `item` tiene título o descripción.
- [ ] Cada publicación tiene un `guid` estable.
- [ ] Las fechas tienen un formato apropiado.

### Atom

- [ ] `feed` declara el namespace de Atom.
- [ ] El canal contiene `title`, `id` y `updated`.
- [ ] Cada `entry` contiene `title`, `id` y `updated`.
- [ ] Los enlaces usan `href`.
- [ ] Existe un enlace `self`.
- [ ] Los identificadores son únicos.

### Publicación

- [ ] Las URL son absolutas.
- [ ] Los recursos enlazados existen.
- [ ] El servidor utiliza un tipo MIME apropiado.
- [ ] El canal se sirve mediante HTTPS.
- [ ] Se ha probado en un lector.
- [ ] No contiene información sensible.

## 4.15. Actividades

1. Localiza cinco diferencias entre RSS y Atom.
2. Corrige un canal Atom que no declare su namespace.
3. Convierte una entrada RSS en una entrada Atom.
4. Explica por qué un identificador no debe cambiar.
5. Añade los enlaces de descubrimiento RSS y Atom a una página HTML.

