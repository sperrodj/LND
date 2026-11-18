# 3. Condiciones, bucles y funciones

## 3.1. `if`, `else if` y `else`

```js
const plazas = 4;

if (plazas === 0) {
  console.log("Actividad completa");
} else if (plazas <= 5) {
  console.log("Últimas plazas");
} else {
  console.log("Plazas disponibles");
}
```

Las llaves deben mantenerse incluso en bloques de una sola línea para evitar errores durante cambios posteriores.

## 3.2. Operador condicional

```js
const textoEstado = plazas > 0 ? "Disponible" : "Completa";
```

Es adecuado para elegir entre dos valores breves. Para varias acciones o condiciones complejas, `if` resulta más legible.

## 3.3. `switch`

```js
const categoria = "musica";

switch (categoria) {
  case "musica":
    console.log("Sala de ensayo");
    break;
  case "deporte":
    console.log("Pabellón");
    break;
  case "arte":
    console.log("Taller creativo");
    break;
  default:
    console.log("Espacio por confirmar");
}
```

Sin `break`, la ejecución continúa por los casos siguientes.

## 3.4. Bucle `for`

```js
for (let numero = 1; numero <= 5; numero += 1) {
  console.log(`Turno ${numero}`);
}
```

Se utiliza cuando se conoce o controla mediante un contador el número de repeticiones.

## 3.5. `for...of`

```js
const salas = ["Aula 1", "Estudio", "Patio"];

for (const sala of salas) {
  console.log(sala);
}
```

Recorre valores de objetos iterables como arrays y cadenas. No debe confundirse con `for...in`, que recorre claves enumerables y no es la opción habitual para arrays.

## 3.6. `while`

```js
let intentos = 0;

while (intentos < 3) {
  console.log(`Intento ${intentos + 1}`);
  intentos += 1;
}
```

La condición debe llegar a ser falsa para evitar un bucle infinito.

## 3.7. Funciones declaradas

```js
function calcularImporte(precio, cantidad) {
  return precio * cantidad;
}

const importe = calcularImporte(7.5, 3);
```

- Los parámetros reciben datos.
- `return` devuelve el resultado y termina la función.
- Una función debe tener una responsabilidad clara.

## 3.8. Expresiones y funciones flecha

```js
const formatearPrecio = function (cantidad) {
  return `${cantidad.toFixed(2)} €`;
};

const duplicar = numero => numero * 2;
```

Las funciones flecha son útiles en callbacks y funciones breves. No sustituyen siempre a las declaradas y su comportamiento con `this` es diferente.

## 3.9. Parámetros predeterminados

```js
function crearMensaje(nombre, saludo = "Hola") {
  return `${saludo}, ${nombre}`;
}
```

## 3.10. Ámbito

```js
const nombreCentro = "Aula Abierta";

function mostrarCentro() {
  const mensaje = `Bienvenida a ${nombreCentro}`;
  console.log(mensaje);
}

// console.log(mensaje); // Error: solo existe dentro de la función
```

`let` y `const` tienen ámbito de bloque:

```js
if (true) {
  const temporal = "Solo dentro del bloque";
}
```

## 3.11. Funciones puras y efectos

```js
function aplicarDescuento(precio, porcentaje) {
  return precio * (1 - porcentaje / 100);
}
```

Con los mismos argumentos devuelve el mismo resultado y no modifica datos externos. Separar cálculos puros de cambios en el DOM facilita probar y depurar.

## 3.12. Salidas anticipadas

```js
function calcularPrecio(precio, cantidad) {
  if (precio < 0 || cantidad < 1) {
    return null;
  }

  return precio * cantidad;
}
```

Una salida anticipada evita anidar bloques innecesarios.

## 3.13. Actividades

1. Crea una función que clasifique una puntuación.
2. Calcula el coste de una inscripción con parámetros predeterminados.
3. Recorre una lista con `for...of`.
4. Reescribe una función breve como función flecha.
5. Separa un cálculo puro de la función que muestra el resultado.

