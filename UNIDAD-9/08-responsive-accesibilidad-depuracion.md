# 8. Diseño adaptable, accesibilidad y depuración

## 8.1. Diseño adaptable

Un diseño adaptable no consiste en crear una versión separada para cada dispositivo. Se construye una base flexible que responde al espacio y a las preferencias disponibles.

Principios:

- Empezar por una estructura sencilla para pantallas estrechas.
- Evitar anchuras fijas innecesarias.
- Utilizar imágenes flexibles.
- Permitir que componentes y texto crezcan.
- Añadir puntos de ruptura cuando el contenido lo necesite.

## 8.2. Viewport

En HTML:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

Sin esta declaración, los navegadores móviles pueden usar un viewport virtual más ancho y reducir la página.

## 8.3. Enfoque mobile first

```css
.pagina {
  display: grid;
  gap: 1.5rem;
}

@media (min-width: 48rem) {
  .pagina {
    grid-template-columns: 2fr 1fr;
  }
}
```

La regla base funciona para espacios estrechos. La media query añade columnas cuando existe espacio suficiente.

El punto de ruptura se elige observando cuándo el contenido empieza a necesitar otra distribución, no por un modelo concreto de teléfono.

## 8.4. Media queries

```css
@media (min-width: 60rem) {
  .galeria {
    grid-template-columns: repeat(4, 1fr);
  }
}

@media (orientation: landscape) and (max-height: 30rem) {
  .portada {
    min-height: auto;
  }
}
```

Las consultas evalúan características del medio o del dispositivo de visualización. No deben utilizarse para detectar navegadores.

## 8.5. Preferencia de tema

```css
:root {
  color-scheme: light dark;
  --fondo: #fffdf8;
  --texto: #202124;
}

@media (prefers-color-scheme: dark) {
  :root {
    --fondo: #17191c;
    --texto: #f1f3f4;
  }
}

body {
  color: var(--texto);
  background-color: var(--fondo);
}
```

Debe comprobarse el contraste y la legibilidad en ambos temas. La preferencia del sistema puede complementarse más adelante con un selector controlado mediante JavaScript, pero no forma parte de esta unidad.

## 8.6. Accesibilidad visual y motriz

- No eliminar el foco sin ofrecer uno equivalente o mejor.
- Mantener contraste suficiente.
- No transmitir información solo mediante color.
- Permitir zoom y ampliación de texto.
- Evitar texto dentro de imágenes.
- Crear zonas interactivas suficientemente amplias.
- Respetar `prefers-reduced-motion`.
- No reordenar visualmente de forma distinta al orden de lectura.
- Comprobar que los contenidos no quedan ocultos al aumentar el zoom.

## 8.7. Impresión

```css
@media print {
  nav,
  .acciones,
  video {
    display: none;
  }

  body {
    color: black;
    background: white;
    font-size: 11pt;
  }

  a[href^="http"]::after {
    content: " (" attr(href) ")";
  }
}
```

Una hoja de impresión puede eliminar elementos interactivos y evitar desperdiciar tinta, pero no debe ocultar información necesaria.

## 8.8. Herramientas de desarrollo

El inspector del navegador permite:

- Comprobar qué reglas coinciden con un elemento.
- Ver propiedades sobrescritas.
- Consultar especificidad y procedencia.
- Modificar valores temporalmente.
- Visualizar modelo de cajas.
- Inspeccionar Flexbox y Grid.
- Simular tamaños de pantalla y preferencias.
- Revisar contraste y árbol de accesibilidad.

Los cambios realizados en el inspector se pierden al recargar: deben copiarse al archivo CSS.

## 8.9. Errores frecuentes

### El CSS no se carga

- Ruta incorrecta en `href`.
- Nombre o mayúsculas diferentes.
- Archivo no guardado.
- Caché del navegador.

### Una regla aparece tachada

Otra declaración gana en la cascada. Se debe revisar especificidad, orden, capas y `!important`.

### La propiedad no aparece

Puede existir un error de sintaxis antes de ella, una propiedad desconocida o un selector que no coincide.

### Flexbox o Grid no actúan

Las propiedades pueden estar colocadas en el elemento equivocado. Debe distinguirse entre contenedor e ítems.

### Desbordamiento horizontal

Posibles causas: anchura fija, contenido sin posibilidad de ruptura, imagen demasiado grande, `100vw` combinado con barras o márgenes, o una cuadrícula con mínimos excesivos.

## 8.10. Validación y compatibilidad

- Validar la hoja con el servicio de validación CSS del W3C.
- Probar en más de un navegador cuando el proyecto lo requiera.
- Consultar soporte antes de depender de funciones recientes.
- Definir una alternativa razonable cuando una mejora no sea imprescindible.
- No confundir «CSS válido» con «diseño accesible y correcto».

## 8.11. Auditoría manual

1. Recorrer la página con teclado.
2. Aumentar el zoom hasta comprobar que el contenido se reorganiza.
3. Probar anchos estrechos sin asumir un dispositivo concreto.
4. Activar movimiento reducido.
5. Probar tema oscuro si está implementado.
6. Revisar impresión.
7. Comprobar textos largos y colecciones vacías.
8. Verificar que no aparece desplazamiento horizontal injustificado.

## 8.12. Actividades

1. Convierte una página fija en mobile first.
2. Decide un punto de ruptura según el contenido.
3. Añade estilos de impresión.
4. Localiza una regla tachada desde el inspector.
5. Corrige un desbordamiento horizontal sin ocultarlo con `overflow-x: hidden`.

