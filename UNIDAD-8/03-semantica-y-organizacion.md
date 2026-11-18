# 3. HTML semántico y organización de páginas

## 3.1. ¿Qué significa semántica?

Una etiqueta semántica explica el papel de su contenido. Por ejemplo, `nav` dice que contiene navegación y `article` que contiene una pieza autónoma. Esto ayuda a:

- Comprender y mantener el código.
- Navegar con tecnologías de apoyo.
- Interpretar el documento en buscadores y otras herramientas.
- Aplicar estilos posteriormente con mayor claridad.

## 3.2. Elementos estructurales principales

| Elemento | Uso habitual |
|---|---|
| `header` | Cabecera de una página o sección |
| `nav` | Bloque principal de enlaces de navegación |
| `main` | Contenido principal único del documento |
| `section` | Sección temática, normalmente con encabezado |
| `article` | Contenido autónomo y reutilizable |
| `aside` | Contenido relacionado pero complementario |
| `footer` | Pie de una página o sección |
| `address` | Información de contacto de la persona o entidad responsable |

## 3.3. Ejemplo: centro cultural

```html
<body>
  <header>
    <a href="index.html">Centro Cultural La Estación</a>
    <nav aria-label="Navegación principal">
      <ul>
        <li><a href="agenda.html">Agenda</a></li>
        <li><a href="talleres.html">Talleres</a></li>
        <li><a href="contacto.html">Contacto</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <h1>Agenda cultural de noviembre</h1>

    <section aria-labelledby="proximas-actividades">
      <h2 id="proximas-actividades">Próximas actividades</h2>

      <article>
        <h3>Encuentro de cerámica</h3>
        <p>Demostración y taller abierto a partir de 12 años.</p>
        <footer>
          <p><time datetime="2026-11-21T18:00">21 de noviembre, 18:00</time></p>
        </footer>
      </article>

      <article>
        <h3>Concierto de percusión</h3>
        <p>Actuación del alumnado de la escuela municipal.</p>
      </article>
    </section>

    <aside>
      <h2>Información útil</h2>
      <p>Las actividades de la sala principal disponen de bucle magnético.</p>
    </aside>
  </main>

  <footer>
    <address>
      Avenida de la Cultura, 12<br>
      <a href="mailto:info@laestacion.example">info@laestacion.example</a>
    </address>
  </footer>
</body>
```

## 3.4. Elegir entre `section` y `article`

- Usa `section` para agrupar contenido de un mismo tema dentro del documento.
- Usa `article` si el contenido tendría sentido por separado: una noticia, una receta, una entrada o una actividad de agenda.
- No es obligatorio envolver cada fragmento en una de estas etiquetas.
- Una `section` suele necesitar un encabezado.

## 3.5. `div` y `span`

`div` y `span` no aportan significado propio. Son útiles cuando no existe un elemento semántico adecuado:

```html
<p>Quedan <span>12 plazas</span> disponibles.</p>
```

- `div` es un contenedor genérico de bloque.
- `span` es un contenedor genérico dentro de una línea.

No deben sustituir a `nav`, `main`, `button` u otros elementos que ya expresan la función necesaria.

## 3.6. Contenido desplegable

```html
<details>
  <summary>¿Es necesaria inscripción?</summary>
  <p>Sí. La reserva puede realizarse hasta 24 horas antes.</p>
</details>
```

`details` y `summary` crean un componente desplegable nativo que puede utilizarse con teclado.

## 3.7. Errores frecuentes

- Incluir más de un `main` visible.
- Usar `header` solo como sinónimo de parte superior; también puede encabezar un `article`.
- Colocar todos los enlaces en `nav`; solo corresponde a bloques importantes de navegación.
- Elegir una etiqueta por su apariencia predeterminada.
- Crear una `section` sin tema reconocible ni encabezado.
- Construir botones con `div` o enlaces sin destino.

## 3.8. Actividad de análisis

Sustituye los contenedores genéricos por elementos semánticos cuando corresponda:

```html
<div class="cabecera">
  <div class="menu">...</div>
</div>
<div class="contenido">
  <div class="noticia">...</div>
  <div class="noticia">...</div>
</div>
<div class="pie">...</div>
```

Una posible estructura sería `header > nav`, `main > article + article` y `footer`. La decisión definitiva depende del significado real del contenido.

