# Bloque 4. Aplicaciones, herramientas y buenas prácticas

## 1. Aplicaciones profesionales

Los lenguajes de marcas participan en muchas capas de un proyecto web.

### 1.1. Interfaces web

HTML estructura menús, formularios, tablas, artículos y otros componentes. Una estructura semántica ayuda a navegadores, buscadores y tecnologías de asistencia.

### 1.2. Intercambio de información

XML y otros formatos permiten que sistemas desarrollados con tecnologías distintas compartan datos. El acuerdo sobre la estructura es tan importante como el propio archivo.

### 1.3. Configuración y automatización

Servidores, herramientas de construcción, dependencias y procesos de despliegue utilizan documentos estructurados. Un error pequeño puede impedir que una aplicación se compile o se publique.

### 1.4. Gráficos y contenido reutilizable

SVG permite crear iconos, logotipos, diagramas y visualizaciones escalables. RSS y Atom permiten distribuir automáticamente novedades.

### 1.5. Documentación

Markdown facilita mantener documentación junto al código. Un buen `README` puede explicar instalación, ejecución, pruebas y contribución.

### 1.6. Plantillas y generación de contenido

Las aplicaciones de servidor suelen generar HTML a partir de datos y plantillas. Por ejemplo, una tienda consulta un producto en la base de datos y construye la página que recibirá el navegador.

```text
Datos del producto + plantilla → documento HTML → navegador
```

Aunque el HTML se genere automáticamente, debe conservar una estructura correcta y semántica.

### 1.7. Servicios web y sistemas empresariales

XML sigue presente en servicios SOAP, intercambio de facturas, herramientas de construcción y sistemas empresariales. Un desarrollador web puede tener que consumir o producir estos documentos aunque la interfaz principal utilice JSON.

## 2. ¿Por qué son especialmente importantes para DAW?

### Accesibilidad

Las marcas semánticas ofrecen información a lectores de pantalla y otros productos de apoyo. Usar un botón real no equivale a dar apariencia de botón a un elemento genérico.

```html
<!-- Semántica y comportamiento esperados -->
<button type="button">Abrir menú</button>

<!-- Solo parece un botón si se añaden estilos -->
<div class="boton">Abrir menú</div>
```

El primer elemento puede recibir foco con teclado y comunica su función de forma nativa.

### Posicionamiento y descubrimiento

Los motores de búsqueda analizan la estructura, los encabezados, los enlaces y los metadatos de una página.

El **SEO** no consiste en repetir palabras. Una jerarquía coherente, títulos descriptivos, enlaces comprensibles y metadatos adecuados facilitan que el contenido sea interpretado.

### Interoperabilidad

Los estándares permiten que navegadores, servidores y herramientas diferentes procesen el mismo documento.

Por ejemplo, una fuente RSS creada por un sitio web puede ser leída por muchas aplicaciones agregadoras porque todas conocen el formato acordado.

### Mantenimiento

Una estructura clara reduce acoplamiento y facilita localizar errores, rediseñar interfaces o reutilizar contenidos.

### Comunicación entre cliente y servidor

Aunque muchas API modernas utilicen JSON, el principio fundamental es el mismo: los datos deben poseer una estructura acordada y procesable.

### Reutilización y transformación

Una fuente de información estructurada puede convertirse en varias salidas: una página web, un documento imprimible, un listado o un canal de novedades. La separación entre contenido y presentación evita mantener copias independientes.

## 3. Herramientas habituales

### Editor de código

Un editor puede proporcionar:

- Resaltado de sintaxis.
- Autocompletado.
- Formateo e indentación.
- Detección temprana de errores.
- Extensiones de validación.

El editor ayuda, pero no sustituye la comprensión del documento.

### Navegador y herramientas de desarrollo

El navegador no se limita a mostrar HTML: lo analiza y construye un modelo del documento. Sus herramientas permiten inspeccionar:

- El árbol de elementos.
- Los atributos.
- Los estilos aplicados.
- Los problemas de accesibilidad.
- Las solicitudes y respuestas de red.

### Validadores

Un validador comprueba un documento según reglas conocidas. Ayuda a detectar etiquetas mal anidadas, atributos incorrectos o estructuras no permitidas.

> [!WARNING]
> Que el navegador “muestre algo” no demuestra que el documento sea correcto. Los navegadores intentan recuperarse de muchos errores.

### Control de versiones

Al ser texto, estos documentos funcionan bien con Git: se pueden comparar cambios, revisar contribuciones y recuperar versiones anteriores.

### Formateadores y linters

Un **formateador** aplica automáticamente un estilo consistente de sangrado, espacios y saltos de línea. Un **linter** analiza el archivo y señala posibles errores o malas prácticas.

Estas herramientas mejoran la consistencia, pero una advertencia debe comprenderse antes de corregirse automáticamente.

### Validadores de accesibilidad y calidad

Herramientas como los analizadores integrados en el navegador ayudan a detectar ausencia de textos alternativos, contraste insuficiente o estructura incorrecta. Ninguna herramienta automática encuentra todos los problemas: también es necesaria una revisión humana.

## 4. Buenas prácticas iniciales

- Utilizar UTF-8 salvo que exista una razón justificada para otra codificación.
- Indentar de forma consistente.
- Elegir nombres claros y significativos.
- Respetar mayúsculas y minúsculas según el lenguaje.
- Evitar mezclar contenido, estilo y comportamiento sin necesidad.
- Validar los documentos cuando exista un estándar o esquema.
- Escribir comentarios útiles, no evidentes ni secretos.
- Mantener una estructura sencilla y predecible.
- Consultar documentación oficial antes que ejemplos sin contexto.
- Probar en más de una herramienta cuando la interoperabilidad sea importante.

### Ejemplo de documento legible

```xml
<catalogo>
  <producto id="P-01">
    <nombre>Monitor</nombre>
    <precio moneda="EUR">189.90</precio>
  </producto>
</catalogo>
```

Los nombres son significativos, la indentación muestra la jerarquía y la unidad monetaria se expresa explícitamente.

### Nombres y consistencia

Conviene acordar una convención y mantenerla:

```text
nombreProducto   camelCase
nombre-producto  kebab-case
nombre_producto  snake_case
```

No existe una convención universal para todos los lenguajes. Lo importante es respetar el estándar aplicable y evitar mezclas arbitrarias.

### Seguridad y privacidad

Los archivos de texto pueden terminar publicados en un repositorio o enviados al navegador. Nunca deben contener:

- Contraseñas.
- Tokens de acceso.
- Claves privadas.
- Datos personales innecesarios.
- Información interna que no deba hacerse pública.

La etiqueta o el comentario que oculta visualmente un contenido no lo protege. Si está en el archivo, puede recuperarse.

## 5. Errores frecuentes

### “HTML es un lenguaje de programación”

HTML describe estructura y semántica; no expresa por sí solo algoritmos generales.

### “Todo lo que usa llaves o etiquetas es un lenguaje de marcas”

La apariencia no determina la categoría. JSON representa datos, CSS estilos y JavaScript comportamiento.

### “Si se ve bien, está bien escrito”

Un navegador puede corregir implícitamente errores. Esa recuperación puede producir resultados distintos de los esperados.

### “Semántica significa diseño visual”

La semántica describe el significado o función. La apariencia pertenece principalmente a la presentación.

### “XML sustituye siempre a JSON”

Cada formato tiene ventajas, ecosistema y casos de uso. La elección depende de los requisitos.

### “Puedo inventar cualquier etiqueta HTML”

El navegador puede conservar elementos desconocidos, pero eso no les aporta semántica estándar. Los componentes personalizados siguen reglas específicas que se estudiarán más adelante.

## 6. Caso guiado: portal de noticias del centro

Un equipo debe construir un portal que publique noticias, muestre un logotipo, permita suscribirse a novedades y documente el proyecto.

Una posible selección sería:

| Necesidad | Tecnología | Justificación |
|---|---|---|
| Estructura de las páginas | HTML | Semántica web interpretable por navegadores |
| Apariencia adaptable | CSS | Separación de la presentación |
| Interacción del menú | JavaScript | Programación del comportamiento |
| Logotipo escalable | SVG | Gráfico vectorial integrado en la web |
| Suscripción a noticias | RSS o Atom | Sindicación estandarizada |
| Guía de instalación | Markdown | Documentación clara en el repositorio |
| Datos de una API propia | JSON | Amplio soporte en aplicaciones web |

La solución combina tecnologías. No existe una única herramienta apropiada para todas las tareas.

### Flujo simplificado del proyecto

1. El equipo redacta o recupera el contenido.
2. El servidor prepara los datos.
3. HTML estructura la página.
4. CSS aplica la presentación.
5. JavaScript añade interacciones cuando son necesarias.
6. SVG representa recursos gráficos escalables.
7. RSS o Atom distribuye las novedades.
8. Markdown documenta la instalación y el mantenimiento.

Cada tecnología resuelve una parte del problema. Utilizarlas correctamente hace el proyecto más accesible, mantenible e interoperable.

## 7. Caso breve: elegir con criterio

Una API de una biblioteca debe devolver una lista de libros a una aplicación web. JSON puede ser una opción inicial por su integración sencilla con JavaScript:

```json
{
  "libros": [
    {"id": 1, "titulo": "1984", "disponible": true}
  ]
}
```

Sin embargo, si la biblioteca debe integrarse con una plataforma institucional que exige un vocabulario XML validado, la decisión cambia. La tecnología se elige a partir de requisitos, no de preferencias personales.

## 8. Resumen profesional

Un desarrollador web debe ser capaz de:

- Leer documentos que no ha creado.
- Reconocer su estructura y propósito.
- Consultar la especificación correspondiente.
- Detectar errores de sintaxis y de semántica.
- Elegir el formato adecuado para intercambiar información.
- Crear documentación comprensible para otras personas.
- Evitar publicar secretos o datos innecesarios.
- Validar el resultado con herramientas y pruebas reales.