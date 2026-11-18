# 7. Componentes, estados y efectos visuales

## 7.1. Clases de componentes

Un componente agrupa estructura y estilos reutilizables. Una nomenclatura coherente evita clases como `.caja1`, `.texto-rojo` o `.margen-grande` sin contexto.

```html
<article class="curso curso--destacado">
  <h2 class="curso__titulo">Cerámica inicial</h2>
  <p class="curso__descripcion">Técnicas básicas de modelado manual.</p>
  <a class="boton" href="inscripcion.html">Inscribirse</a>
</article>
```

```css
.curso { ... }
.curso__titulo { ... }
.curso__descripcion { ... }
.curso--destacado { ... }
.boton { ... }
```

No es obligatorio seguir una metodología concreta, pero los nombres deben comunicar intención y mantenerse consistentes.

## 7.2. Botones y enlaces

```css
.boton {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 2.75rem;
  padding: 0.65rem 1rem;
  border: 2px solid transparent;
  border-radius: 0.5rem;
  color: white;
  background-color: #345995;
  font: inherit;
  font-weight: 700;
  text-decoration: none;
  cursor: pointer;
}

.boton:hover {
  background-color: #274473;
}

.boton:focus-visible {
  outline: 3px solid #f6ae2d;
  outline-offset: 3px;
}
```

La apariencia no cambia la semántica: un enlace navega y un botón ejecuta una acción. No se debe elegir el elemento HTML por cómo se desea que se vea.

## 7.3. Formularios

```css
form {
  display: grid;
  gap: 1.25rem;
  max-width: 42rem;
}

label,
legend {
  font-weight: 700;
}

input,
select,
textarea,
button {
  font: inherit;
}

input,
select,
textarea {
  width: 100%;
  padding: 0.75rem;
  border: 2px solid #9aa5ad;
  border-radius: 0.4rem;
  background-color: white;
}

input:focus-visible,
select:focus-visible,
textarea:focus-visible {
  border-color: #345995;
  outline: 3px solid rgb(52 89 149 / 25%);
}

input:user-invalid,
textarea:user-invalid {
  border-color: #a12626;
}
```

Los mensajes de error deben existir también como texto HTML. Un borde rojo no explica por sí solo el problema.

## 7.4. Tablas

```css
.tabla-responsive {
  overflow-x: auto;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 0.75rem;
  border-bottom: 1px solid #cbd2d8;
  text-align: start;
}

thead {
  background-color: #263238;
  color: white;
}

tbody tr:nth-child(even) {
  background-color: #f4f6f7;
}
```

No debe cambiarse una tabla a `display: block` celda por celda sin comprobar cómo afecta a su semántica y accesibilidad.

## 7.5. Transiciones

```css
.tarjeta {
  transform: translateY(0);
  box-shadow: 0 0.25rem 0.75rem rgb(0 0 0 / 10%);
  transition:
    transform 180ms ease,
    box-shadow 180ms ease;
}

.tarjeta:hover,
.tarjeta:focus-within {
  transform: translateY(-0.25rem);
  box-shadow: 0 0.75rem 1.5rem rgb(0 0 0 / 15%);
}
```

Es mejor enumerar las propiedades que usar `transition: all`. Las transiciones deben reforzar la interacción, no retrasarla.

## 7.6. Transformaciones

```css
.icono {
  transform: rotate(-3deg) scale(1.05);
  transform-origin: center;
}
```

Transformar un elemento cambia su representación visual, no el espacio que ocupa en el flujo normal.

## 7.7. Animaciones

```css
@keyframes aparecer {
  from {
    opacity: 0;
    transform: translateY(0.5rem);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.aviso {
  animation: aparecer 300ms ease-out both;
}
```

Las animaciones deben ser breves, con propósito y no impedir el acceso al contenido. No se recomienda animar continuamente grandes zonas.

## 7.8. Preferencia de movimiento reducido

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    scroll-behavior: auto !important;
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

También se puede diseñar cada componente para eliminar específicamente el movimiento no esencial.

## 7.9. Contenido visualmente oculto

```css
.solo-lectores {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}
```

Esta técnica oculta visualmente pero conserva contenido para tecnologías de apoyo. No debe confundirse con `display: none`, que lo elimina también del árbol de accesibilidad.

## 7.10. Actividades

1. Crea un botón con estados normal, `hover`, `focus-visible` y desactivado.
2. Da estilo a un formulario sin eliminar sus etiquetas.
3. Construye una tabla con desplazamiento horizontal en pantallas estrechas.
4. Añade una transición que respete `prefers-reduced-motion`.
5. Explica por qué un enlace estilizado como botón continúa siendo un enlace.

