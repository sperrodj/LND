# 8. Depuración, accesibilidad y seguridad

## 8.1. Tipos de errores

- **Sintaxis:** el código no puede interpretarse.
- **Referencia:** se utiliza una variable que no existe.
- **Tipo:** se intenta una operación no permitida para ese valor.
- **Lógica:** el programa se ejecuta, pero produce un resultado incorrecto.
- **Asincronía:** se usa un resultado antes de que esté disponible o no se controla un rechazo.

## 8.2. Leer la consola

```text
TypeError: Cannot read properties of null (reading 'addEventListener')
    at app.js:12:7
```

Indica que la selección devolvió `null`. Posibles causas:

- Selector incorrecto.
- El elemento no existe en esa página.
- El script se ejecutó antes de procesar el HTML.

## 8.3. Comprobaciones y aserciones

```js
console.assert(actividades.length > 0, "No hay actividades cargadas");
console.table(actividades);
```

Los mensajes temporales deben retirarse o reducirse antes de la entrega.

## 8.4. Puntos de interrupción

Un breakpoint pausa la ejecución para inspeccionar:

- Variables locales y globales.
- Pila de llamadas.
- Resultado de expresiones.
- Flujo línea por línea.
- Eventos que activaron el código.

También puede escribirse temporalmente:

```js
debugger;
```

## 8.5. Manejo de errores

```js
function dividir(dividendo, divisor) {
  if (divisor === 0) {
    throw new Error("No se puede dividir entre cero");
  }
  return dividendo / divisor;
}
```

No debe rodearse todo el programa con un `try/catch` vacío:

```js
try {
  // código
} catch (error) {
  console.error(error);
  mostrarError("Ha ocurrido un problema.");
}
```

El error técnico puede registrarse; el mensaje al usuario debe ser comprensible y no revelar información sensible.

## 8.6. Accesibilidad en interacciones

- Utilizar botones para acciones y enlaces para navegación.
- Mantener todo operable con teclado.
- No depender solo de `hover`.
- Actualizar `aria-expanded`, `aria-pressed` u otros estados cuando corresponda.
- Mantener un foco visible.
- Anunciar resultados importantes sin abusar de regiones vivas.
- Devolver el foco de forma lógica al cerrar diálogos o eliminar elementos.
- No cambiar automáticamente el foco en cada actualización.

## 8.7. Mejora progresiva

La página debe conservar contenido y funciones esenciales cuando JavaScript falla, siempre que sea viable. Un formulario puede tener un `action` real y mejorarse después con JavaScript. Los enlaces deben conservar destinos válidos.

## 8.8. Evitar inyección de HTML

```js
// Riesgoso con contenido externo
contenedor.innerHTML = nombreUsuario;

// Seguro para texto
contenedor.textContent = nombreUsuario;
```

Crear nodos con `createElement` y usar `textContent` evita interpretar datos como marcado. Si una aplicación necesita permitir HTML, debe existir una estrategia seria de saneamiento; no basta con reemplazar algunos caracteres.

## 8.9. No confiar en el cliente

Un usuario puede modificar HTML, JavaScript, almacenamiento y solicitudes. Por tanto:

- La validación definitiva corresponde al servidor.
- No se ocultan secretos en JavaScript del navegador.
- No se implementan permisos reales solo escondiendo botones.
- No se confía en precios o roles enviados por el cliente.

## 8.10. Rendimiento básico

- No consultar repetidamente el mismo elemento si puede guardarse una referencia.
- Agrupar inserciones mediante fragmentos.
- Delegar eventos en listas dinámicas.
- Evitar listeners y renders innecesarios.
- No optimizar sin medir; primero claridad y corrección.

## 8.11. Errores frecuentes

### Usar antes de declarar

```js
console.log(total);
const total = 10;
```

### Confundir asignación y comparación

```js
if (estado = "activo") { /* asigna */ }
if (estado === "activo") { /* compara */ }
```

### Olvidar convertir un campo

```js
"2" + "3";             // "23"
Number("2") + Number("3"); // 5
```

### Modificar un array con `sort`

```js
const ordenadas = [...actividades].sort(comparador);
```

### No comprobar `response.ok`

Una solicitud HTTP con error puede resolverse igualmente como respuesta y debe comprobarse.

## 8.12. Lista de comprobación

- [ ] No hay errores en consola.
- [ ] Se utilizan `const` y `let` adecuadamente.
- [ ] Las funciones tienen responsabilidades claras.
- [ ] Se controlan selecciones nulas.
- [ ] No se introduce contenido externo mediante `innerHTML`.
- [ ] Los eventos funcionan con teclado y semántica nativa.
- [ ] Los formularios se validan en HTML y JavaScript cuando corresponde.
- [ ] Las solicitudes gestionan carga, error, vacío y éxito.
- [ ] El almacenamiento no contiene datos sensibles.
- [ ] La interfaz mantiene foco y mensajes accesibles.

## 8.13. Actividad de depuración

Corrige:

```js
const boton = document.querySelector("#guardar");
boton.onclick = guardar();

function guardar() {
  const cantidad = document.querySelector("#cantidad").value;
  const total = cantidad + 5;
  document.querySelector("#resultado").innerHTML = total;
}
```

Debe comprobarse la selección, registrar la función sin ejecutarla inmediatamente, convertir la cantidad y usar `textContent`.

