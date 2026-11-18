# 5. Práctica guiada: canal de una revista de libros

## 5.1. Objetivo

Crear dos canales equivalentes sobre novedades, reseñas y recomendaciones literarias:

- `rss.xml`.
- `atom.xml`.

Los dos deben publicar la misma información utilizando las estructuras propias de cada formato.

## 5.2. Estructura

```text
actividad-sindicacion/
├── README.md
├── rss.xml
├── atom.xml
├── index.html
└── img/
    ├── 01-rss-validado.png
    └── 02-atom-validado.png
```

## 5.3. Datos que se publicarán

Canal:

- Título: Revista Página Abierta.
- Sitio: `https://example.com/`.
- Descripción: Novedades, reseñas y recomendaciones literarias.
- Idioma: español.

Entradas:

| ID | Título | Categoría | Fecha |
|---|---|---|---|
| `entrada-001` | Reseña de La península de las casas vacías | Reseñas | 18/11/2026 |
| `entrada-002` | Cinco novelas de misterio actuales | Recomendaciones | 17/11/2026 |
| `entrada-003` | Novedades editoriales del mes | Novedades editoriales | 16/11/2026 |

## 5.4. Paso 1. Crear RSS

Crea `rss.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>Revista Página Abierta</title>
    <link>https://example.com/</link>
    <description>Novedades, reseñas y recomendaciones literarias.</description>
    <language>es-ES</language>
    <lastBuildDate>Wed, 18 Nov 2026 12:30:00 +0000</lastBuildDate>

    <item>
      <title>Reseña de La península de las casas vacías</title>
      <link>https://example.com/resenas/peninsula-casas-vacias</link>
      <description><![CDATA[
        <p>Comentamos los personajes, la ambientación y los temas de la novela.</p>
      ]]></description>
      <category>Reseñas</category>
      <category>Ficción histórica</category>
      <guid isPermaLink="false">entrada-001</guid>
      <pubDate>Wed, 18 Nov 2026 09:30:00 +0000</pubDate>
    </item>

    <item>
      <title>Cinco novelas de misterio actuales</title>
      <link>https://example.com/recomendaciones/novelas-misterio</link>
      <description>
        Recomendamos cinco novelas recientes para amantes del misterio.
      </description>
      <category>Recomendaciones</category>
      <guid isPermaLink="false">entrada-002</guid>
      <pubDate>Tue, 17 Nov 2026 17:00:00 +0000</pubDate>
    </item>

    <item>
      <title>Novedades editoriales del mes</title>
      <link>https://example.com/novedades/editoriales-noviembre</link>
      <description>
        Repasamos algunos de los libros publicados durante noviembre.
      </description>
      <category>Novedades editoriales</category>
      <guid isPermaLink="false">entrada-003</guid>
      <pubDate>Mon, 16 Nov 2026 10:00:00 +0000</pubDate>
    </item>
  </channel>
</rss>
```

Comprueba:

```bash
xmllint --noout rss.xml
```

## 5.5. Paso 2. Crear Atom

Crea `atom.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom"
      xml:lang="es">
  <title>Revista Página Abierta</title>
  <subtitle>Novedades, reseñas y recomendaciones literarias</subtitle>

  <link
    rel="alternate"
    href="https://example.com/"
    type="text/html"/>
  <link
    rel="self"
    href="https://example.com/atom.xml"
    type="application/atom+xml"/>

  <id>https://example.com/atom.xml</id>
  <updated>2026-11-18T12:30:00Z</updated>

  <author>
    <name>Equipo de redacción</name>
  </author>

  <entry>
    <title>Reseña de La península de las casas vacías</title>
    <link href="https://example.com/resenas/peninsula-casas-vacias"/>
    <id>https://example.com/entradas/entrada-001</id>
    <published>2026-11-18T09:00:00Z</published>
    <updated>2026-11-18T09:30:00Z</updated>
    <category term="Reseñas"/>
    <category term="Ficción histórica"/>
    <summary>
      Comentamos los personajes, la ambientación y los temas de la novela.
    </summary>
  </entry>

  <entry>
    <title>Cinco novelas de misterio actuales</title>
    <link href="https://example.com/recomendaciones/novelas-misterio"/>
    <id>https://example.com/entradas/entrada-002</id>
    <published>2026-11-17T17:00:00Z</published>
    <updated>2026-11-17T17:00:00Z</updated>
    <category term="Recomendaciones"/>
    <summary>
      Recomendamos cinco novelas recientes para amantes del misterio.
    </summary>
  </entry>

  <entry>
    <title>Novedades editoriales del mes</title>
    <link href="https://example.com/novedades/editoriales-noviembre"/>
    <id>https://example.com/entradas/entrada-003</id>
    <published>2026-11-16T10:00:00Z</published>
    <updated>2026-11-16T10:00:00Z</updated>
    <category term="Novedades editoriales"/>
    <summary>
      Repasamos algunos de los libros publicados durante noviembre.
    </summary>
  </entry>
</feed>
```

Comprueba:

```bash
xmllint --noout atom.xml
```

## 5.6. Paso 3. Crear la página HTML

Crea `index.html`:

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revista Página Abierta</title>

    <link
      rel="alternate"
      type="application/rss+xml"
      title="Revista Página Abierta — RSS"
      href="rss.xml">

    <link
      rel="alternate"
      type="application/atom+xml"
      title="Revista Página Abierta — Atom"
      href="atom.xml">
  </head>

  <body>
    <h1>Revista Página Abierta</h1>
    <p>Novedades, reseñas y recomendaciones literarias.</p>

    <nav>
      <a href="rss.xml">Canal RSS</a>
      <a href="atom.xml">Canal Atom</a>
    </nav>
  </body>
</html>
```

## 5.7. Paso 4. Servidor local

Desde la carpeta del proyecto:

```bash
python3 -m http.server 8000
```

Abre:

```text
http://localhost:8000
```

## 5.8. Paso 5. Documentar

El `README.md` debe incluir:

1. Definición breve de sindicación.
2. Explicación de RSS y Atom.
3. Diferencias principales.
4. Estructura de archivos.
5. Comandos utilizados.
6. Capturas de validación.
7. Problemas encontrados y soluciones.

Ejemplo:

```markdown
![RSS comprobado](img/01-rss-validado.png)

![Atom comprobado](img/02-atom-validado.png)
```

## 5.9. Ampliaciones

1. Añade una imagen al canal RSS.
2. Añade `icon` y `logo` a Atom.
3. Incluye autores diferentes.
4. Añade contenido HTML.
5. Publica un archivo multimedia.
6. Añade una cuarta entrada.
7. Sustituye `example.com` por una URL real cuando el proyecto esté publicado.

## 5.10. Lista final

- [ ] `rss.xml` está bien formado.
- [ ] `atom.xml` está bien formado.
- [ ] RSS contiene los elementos obligatorios.
- [ ] Atom declara su espacio de nombres.
- [ ] Los identificadores son únicos y estables.
- [ ] Las fechas tienen el formato correspondiente.
- [ ] Los enlaces son coherentes.
- [ ] `index.html` enlaza ambos canales.
- [ ] El `README.md` explica el trabajo.
- [ ] Las capturas se muestran correctamente.
- [ ] Los cambios están subidos al repositorio.

