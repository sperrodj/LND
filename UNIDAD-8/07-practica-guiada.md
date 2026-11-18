# 7. Práctica guiada: web de una protectora de animales

## 7.1. Objetivo

Crear una pequeña web HTML5 para la protectora ficticia **Huellas del Valle**. La página presentará animales en adopción, información de visitas y un formulario de contacto. No se utilizarán CSS ni JavaScript: se evaluará la calidad del marcado.

## 7.2. Estructura del proyecto

```text
huellas-del-valle/
├── index.html
├── adopcion.html
├── contacto.html
├── img/
│   ├── nala.jpg
│   ├── bruno.jpg
│   └── instalaciones.jpg
└── README.md
```

Las fotografías pueden ser propias o proceder de un banco con licencia adecuada. Debe indicarse su procedencia en el `README.md`.

## 7.3. Paso 1: portada

Crea `index.html` con la estructura mínima y estos bloques:

```html
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Conoce la labor y los animales en adopción de Huellas del Valle.">
    <title>Inicio | Huellas del Valle</title>
  </head>
  <body>
    <a href="#contenido">Saltar al contenido principal</a>

    <header>
      <p><a href="index.html">Huellas del Valle</a></p>
      <nav aria-label="Navegación principal">
        <ul>
          <li><a href="index.html" aria-current="page">Inicio</a></li>
          <li><a href="adopcion.html">Adopción</a></li>
          <li><a href="contacto.html">Contacto</a></li>
        </ul>
      </nav>
    </header>

    <main id="contenido">
      <h1>Una segunda oportunidad empieza aquí</h1>
      <p>Rescatamos, cuidamos y buscamos hogares responsables.</p>

      <section aria-labelledby="labor">
        <h2 id="labor">Nuestra labor</h2>
        <p>El equipo atiende animales abandonados y promueve la tenencia responsable.</p>
      </section>

      <section aria-labelledby="visitas">
        <h2 id="visitas">Visita las instalaciones</h2>
        <figure>
          <img
            src="img/instalaciones.jpg"
            alt="Zona exterior con patios individuales y árboles"
            width="900"
            height="600">
          <figcaption>Zona de paseo y socialización.</figcaption>
        </figure>
        <p>Las visitas se realizan con cita previa.</p>
      </section>
    </main>

    <footer>
      <address>
        Camino del Valle, 8<br>
        <a href="mailto:adopciones@huellas.example">adopciones@huellas.example</a>
      </address>
    </footer>
  </body>
</html>
```

## 7.4. Paso 2: animales en adopción

En `adopcion.html`, reutiliza la cabecera, la navegación y el pie. Cambia el `title`, el `h1` y `aria-current`. Añade al menos tres fichas como artículos:

```html
<section aria-labelledby="animales">
  <h2 id="animales">Animales que buscan hogar</h2>

  <article>
    <h3>Nala</h3>
    <figure>
      <img src="img/nala.jpg" alt="Nala, una perra mestiza de pelo canela y orejas erguidas">
      <figcaption>Nala durante su paseo diario.</figcaption>
    </figure>
    <dl>
      <dt>Edad</dt>
      <dd>3 años</dd>
      <dt>Tamaño</dt>
      <dd>Mediano</dd>
      <dt>Carácter</dt>
      <dd>Activa y sociable</dd>
    </dl>
    <p><a href="contacto.html#formulario">Preguntar por Nala</a></p>
  </article>

  <article>
    <h3>Bruno</h3>
    <p>Completa esta ficha siguiendo la misma estructura.</p>
  </article>
</section>
```

Incluye también una tabla con los horarios de visita:

```html
<table>
  <caption>Horarios de visita con cita previa</caption>
  <thead>
    <tr>
      <th scope="col">Día</th>
      <th scope="col">Mañana</th>
      <th scope="col">Tarde</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Martes a viernes</th>
      <td>10:00–13:00</td>
      <td>16:00–18:00</td>
    </tr>
    <tr>
      <th scope="row">Sábado</th>
      <td>10:00–14:00</td>
      <td>Cerrado</td>
    </tr>
  </tbody>
</table>
```

## 7.5. Paso 3: formulario de contacto

En `contacto.html`, crea un formulario que permita preguntar por una adopción:

```html
<main id="contenido">
  <h1>Contacto y adopciones</h1>

  <form id="formulario" action="/solicitudes-adopcion" method="post">
    <fieldset>
      <legend>Datos de contacto</legend>

      <label for="nombre">Nombre completo</label>
      <input id="nombre" name="nombre" type="text" autocomplete="name" required>

      <label for="correo">Correo electrónico</label>
      <input id="correo" name="correo" type="email" autocomplete="email" required>

      <label for="telefono">Teléfono</label>
      <input id="telefono" name="telefono" type="tel" autocomplete="tel">
    </fieldset>

    <fieldset>
      <legend>Consulta</legend>

      <label for="animal">Animal por el que preguntas</label>
      <select id="animal" name="animal" required>
        <option value="">Selecciona una opción</option>
        <option value="nala">Nala</option>
        <option value="bruno">Bruno</option>
        <option value="otro">Otro</option>
      </select>

      <p>Tipo de vivienda</p>
      <label><input type="radio" name="vivienda" value="piso" required> Piso</label>
      <label><input type="radio" name="vivienda" value="casa"> Casa</label>

      <label for="mensaje">Cuéntanos brevemente tu situación</label>
      <textarea id="mensaje" name="mensaje" rows="7" minlength="80" maxlength="800" required></textarea>

      <label>
        <input type="checkbox" name="privacidad" value="aceptada" required>
        He leído la información sobre protección de datos
      </label>
    </fieldset>

    <button type="submit">Enviar consulta</button>
  </form>
</main>
```

En un proyecto real, `action` debe apuntar a un servicio capaz de recibir y proteger esos datos.

## 7.6. Paso 4: README

El archivo `README.md` debe contener:

- Nombre y objetivo del proyecto.
- Estructura de archivos.
- Elementos HTML utilizados.
- Procedencia y licencia de las imágenes.
- Decisiones de accesibilidad aplicadas.
- Problemas encontrados y solución adoptada.

## 7.7. Paso 5: validación y pruebas

1. Valida los tres documentos HTML.
2. Corrige todos los errores de sintaxis.
3. Abre las páginas desde la portada y comprueba cada enlace.
4. Navega usando únicamente el teclado.
5. Comprueba que cada imagen tiene un `alt` apropiado.
6. Revisa la jerarquía de encabezados.
7. Prueba los campos obligatorios y los errores del formulario.
8. Abre las herramientas del navegador y revisa el árbol de accesibilidad.

## 7.8. Ampliaciones opcionales

- Añadir una página de voluntariado.
- Incluir un vídeo subtitulado sobre el proceso de adopción.
- Crear una sección de preguntas frecuentes con `details` y `summary`.
- Añadir metadatos sociales a la portada.

## 7.9. Lista de comprobación final

- [ ] Todos los archivos tienen `DOCTYPE`, idioma, codificación, `viewport` y título propio.
- [ ] La navegación funciona y señala la página actual.
- [ ] Existe un solo `main` visible en cada página.
- [ ] Los encabezados mantienen una jerarquía lógica.
- [ ] Las imágenes tienen alternativas adecuadas.
- [ ] La tabla utiliza `caption`, `th` y `scope`.
- [ ] Todos los controles tienen etiqueta y `name`.
- [ ] Los grupos del formulario usan `fieldset` y `legend`.
- [ ] La web puede recorrerse con teclado.
- [ ] El código no presenta errores de validación.
- [ ] El `README.md` documenta el trabajo y las fuentes.

## 7.10. Propuesta de evaluación

| Criterio | Peso orientativo |
|---|---:|
| Estructura HTML5 y validez | 20 % |
| Semántica y jerarquía | 20 % |
| Contenidos, enlaces e imágenes | 15 % |
| Tabla y formulario | 20 % |
| Accesibilidad | 15 % |
| Organización, README y presentación | 10 % |

