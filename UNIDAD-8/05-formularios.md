# 5. Formularios HTML5

## 5.1. ¿Qué es un formulario?

Un formulario permite introducir y enviar datos. HTML define los controles y algunas reglas de validación, pero el procesamiento real requiere un servidor o, más adelante, programación.

```html
<form action="/solicitudes" method="post">
  <!-- Controles -->
  <button type="submit">Enviar solicitud</button>
</form>
```

- `action`: destino que procesará los datos.
- `method="get"`: añade los datos a la URL; adecuado para búsquedas y filtros no sensibles.
- `method="post"`: envía los datos en el cuerpo de la petición; adecuado para crear o modificar información.

> POST no cifra automáticamente la información. La protección durante el transporte depende de HTTPS.

## 5.2. `label`, `id` y `name`

```html
<div>
  <label for="nombre">Nombre completo</label>
  <input type="text" id="nombre" name="nombre" autocomplete="name" required>
</div>
```

- `label` identifica el control y aumenta su zona de activación.
- `for` debe coincidir con el `id` del control.
- `id` identifica el elemento dentro de la página.
- `name` identifica el dato cuando se envía. Sin `name`, normalmente el valor no se envía.
- `required` obliga a completar el campo antes del envío del navegador.

El `placeholder` es solo una pista breve; no sustituye a `label`.

## 5.3. Tipos de `input`

```html
<input type="text" name="nombre">
<input type="email" name="correo">
<input type="tel" name="telefono">
<input type="url" name="web">
<input type="password" name="clave">
<input type="number" name="cantidad" min="1" max="5">
<input type="date" name="fecha">
<input type="time" name="hora">
<input type="file" name="documento" accept="image/*,.pdf">
<input type="range" name="experiencia" min="0" max="10">
<input type="color" name="color-identificativo">
```

Elegir el tipo correcto mejora el teclado en móviles, la validación y la comprensión del campo.

## 5.4. Casillas y botones de opción

```html
<fieldset>
  <legend>Disponibilidad</legend>
  <label><input type="checkbox" name="turnos" value="manana"> Mañana</label>
  <label><input type="checkbox" name="turnos" value="tarde"> Tarde</label>
</fieldset>

<fieldset>
  <legend>Experiencia previa</legend>
  <label><input type="radio" name="experiencia" value="si" required> Sí</label>
  <label><input type="radio" name="experiencia" value="no"> No</label>
</fieldset>
```

- Las casillas permiten seleccionar cero, una o varias opciones.
- Los botones `radio` con el mismo `name` forman un grupo de selección única.
- `fieldset` agrupa controles relacionados y `legend` da nombre al grupo.

## 5.5. Selección y texto extenso

```html
<label for="area">Área de voluntariado</label>
<select id="area" name="area" required>
  <option value="">Selecciona una opción</option>
  <optgroup label="Atención animal">
    <option value="paseos">Paseos</option>
    <option value="cuidados">Cuidados básicos</option>
  </optgroup>
  <optgroup label="Apoyo">
    <option value="fotografia">Fotografía</option>
    <option value="transporte">Traslados</option>
  </optgroup>
</select>

<label for="motivacion">Motivación</label>
<textarea id="motivacion" name="motivacion" rows="6" minlength="40" maxlength="500"></textarea>
```

## 5.6. Reglas de validación HTML

```html
<label for="codigo">Código de inscripción</label>
<input
  type="text"
  id="codigo"
  name="codigo"
  pattern="VOL-[0-9]{4}"
  title="Formato requerido: VOL- seguido de cuatro cifras"
  required>
```

Otros atributos útiles:

- `min`, `max` y `step` para valores numéricos o fechas.
- `minlength` y `maxlength` para longitud de texto.
- `multiple` para permitir varios correos o archivos cuando el tipo lo admite.
- `readonly` impide editar pero envía el valor.
- `disabled` desactiva el control y normalmente no envía su valor.

La validación del navegador mejora la experiencia, pero **siempre debe repetirse en el servidor**, porque el HTML puede modificarse o evitarse.

## 5.7. Ayuda y errores accesibles

```html
<label for="telefono">Teléfono</label>
<p id="ayuda-telefono">Incluye el prefijo del país.</p>
<input
  type="tel"
  id="telefono"
  name="telefono"
  aria-describedby="ayuda-telefono"
  autocomplete="tel">
```

Los mensajes de error deben explicar qué ocurre y cómo corregirlo. No deben depender únicamente del color.

## 5.8. Botones

```html
<button type="submit">Enviar inscripción</button>
<button type="reset">Borrar formulario</button>
<button type="button">Mostrar ayuda</button>
```

Dentro de un formulario, conviene declarar siempre el `type`. El botón de reinicio suele causar pérdidas accidentales, por lo que debe usarse con prudencia.

## 5.9. Subida de archivos

```html
<form action="/documentacion" method="post" enctype="multipart/form-data">
  <label for="documento">Adjunta el documento</label>
  <input type="file" id="documento" name="documento" accept=".pdf" required>
  <button type="submit">Enviar</button>
</form>
```

Para enviar archivos con POST se necesita `enctype="multipart/form-data"`. `accept` orienta la selección, pero el servidor debe comprobar realmente el tipo, el tamaño y la seguridad del archivo.

## 5.10. Formulario completo de voluntariado

```html
<form action="/alta-voluntariado" method="post">
  <fieldset>
    <legend>Datos personales</legend>

    <label for="alta-nombre">Nombre completo</label>
    <input id="alta-nombre" name="nombre" type="text" autocomplete="name" required>

    <label for="alta-correo">Correo electrónico</label>
    <input id="alta-correo" name="correo" type="email" autocomplete="email" required>

    <label for="alta-nacimiento">Fecha de nacimiento</label>
    <input id="alta-nacimiento" name="nacimiento" type="date" required>
  </fieldset>

  <fieldset>
    <legend>Preferencias</legend>
    <label for="alta-area">Área</label>
    <select id="alta-area" name="area" required>
      <option value="">Selecciona</option>
      <option value="paseos">Paseos</option>
      <option value="eventos">Eventos solidarios</option>
      <option value="administracion">Administración</option>
    </select>

    <label>
      <input type="checkbox" name="condiciones" value="aceptadas" required>
      He leído las condiciones de participación
    </label>
  </fieldset>

  <button type="submit">Solicitar alta</button>
</form>
```

## 5.11. Actividad

Diseña un formulario de inscripción para una campaña de limpieza de playa. Debe contener datos personales, fecha, turno, talla de guantes, necesidades de accesibilidad, aceptación de condiciones y botones adecuados. Justifica los tipos de control elegidos.

