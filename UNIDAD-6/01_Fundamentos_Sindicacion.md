# 1. Fundamentos de la sindicación

## 1.1. ¿Qué significa sindicar contenidos?

Sindicar contenidos consiste en ofrecer las novedades de un sitio mediante un documento estructurado que puede ser procesado automáticamente.

El documento recibe normalmente el nombre de:

- Canal.
- Fuente.
- *Feed*.

Un canal puede contener noticias, episodios, artículos, lanzamientos, ofertas, avisos o cualquier información publicada de forma periódica.

## 1.2. Problema que resuelve

Sin sindicación, una persona debe visitar cada página para comprobar si hay novedades.

Con sindicación:

1. El sitio publica un canal RSS o Atom.
2. La persona añade su URL a un lector.
3. El lector consulta periódicamente el canal.
4. Las novedades aparecen automáticamente.

```text
Autor o sitio
      ↓ publica
Canal RSS o Atom
      ↓ consulta
Lector o agregador
      ↓ muestra
Persona suscrita
```

## 1.3. Componentes

### Proveedor

Es el sitio o aplicación que genera el canal.

### Canal

Es el documento XML que contiene información general y una colección de publicaciones.

### Entrada

Es cada novedad individual: una noticia, un episodio, una actualización o una oferta.

### Agregador

Es el programa que consulta varios canales y reúne sus novedades.

### Suscriptor

Es la persona o aplicación que consume el canal.

## 1.4. Ejemplos de uso

- Noticias de un periódico.
- Nuevas entradas de un blog.
- Episodios de un pódcast.
- Avisos de una plataforma educativa.
- Versiones publicadas de un programa.
- Nuevos productos de una tienda.
- Novedades editoriales y reseñas de libros.
- Ofertas de empleo.
- Alertas meteorológicas.

## 1.5. Ventajas

- No es necesario visitar cada sitio manualmente.
- El formato puede procesarse automáticamente.
- Una aplicación puede reunir canales diferentes.
- El usuario controla sus suscripciones.
- Los datos están separados de su presentación.
- El contenido puede reutilizarse en otras aplicaciones.
- No es necesario facilitar una dirección de correo.

## 1.6. Limitaciones

- El canal debe mantenerse actualizado.
- Un error XML puede impedir su lectura.
- Algunos sitios publican únicamente un resumen.
- Los lectores pueden interpretar ciertos elementos de forma distinta.
- La sindicación no sustituye la navegación completa del sitio.

## 1.7. RSS y Atom

Los dos formatos más habituales son:

- **RSS 2.0**.
- **Atom 1.0**.

Ambos están basados en XML y representan una colección ordenada de publicaciones.

| Concepto | RSS 2.0 | Atom 1.0 |
|---|---|---|
| Documento principal | `rss` | `feed` |
| Colección | `channel` | `feed` |
| Publicación | `item` | `entry` |
| Título | `title` | `title` |
| Enlace | `link` | `link` |
| Identificador | `guid` | `id` |
| Fecha | `pubDate` | `updated` / `published` |
| Espacio de nombres propio | No obligatorio | Obligatorio |

## 1.8. Sindicación y XML

Un canal debe cumplir primero las reglas básicas de XML:

- Un único elemento raíz.
- Etiquetas correctamente cerradas y anidadas.
- Distinción entre mayúsculas y minúsculas.
- Atributos entre comillas.
- Caracteres reservados escapados.
- Codificación declarada correctamente.

Ejemplo de texto escapado:

```xml
<title>Acción &amp; aventura</title>
```

Ejemplo con CDATA:

```xml
<description><![CDATA[
  <p>Contenido con <strong>HTML</strong>.</p>
]]></description>
```

CDATA evita que el analizador interprete las etiquetas interiores como elementos del canal.

## 1.9. Página web frente a canal

Una página HTML está diseñada principalmente para que una persona la visualice. Un canal está diseñado para que una aplicación lo procese.

| Página web | Canal RSS o Atom |
|---|---|
| Presenta una interfaz | Describe datos |
| Usa HTML y CSS | Usa XML |
| Se visita con navegador | Se consume con lector |
| Puede incluir menús y formularios | Contiene publicaciones |
| La persona busca novedades | El lector detecta novedades |

## 1.10. Canal bien formado y canal válido

Un documento puede estar bien formado como XML y, aun así, no respetar las reglas de RSS o Atom.

```text
Bien formado → cumple las reglas generales de XML.
Válido como canal → además cumple las reglas del formato.
```

Ejemplo:

```xml
<rss version="2.0">
  <inventario>
    <producto>Teclado</producto>
  </inventario>
</rss>
```

El documento puede estar bien formado, pero no es un RSS 2.0 correcto porque falta `channel` y sus elementos obligatorios.

## 1.11. Actividades de comprensión

1. Explica la diferencia entre proveedor, canal, entrada y agregador.
2. Indica tres usos de la sindicación diferentes de las noticias.
3. Explica por qué RSS y Atom no sustituyen una página web.
4. ¿Puede un documento estar bien formado y no ser un canal válido?
5. ¿Qué ventaja aporta la separación entre datos y presentación?

