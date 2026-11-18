# 2. Variables, tipos, operadores y conversiones

## 2.1. `const` y `let`

```js
const nombreCentro = "Aula Abierta";
let plazasLibres = 12;

plazasLibres = plazasLibres - 1;
```

- `const`: la variable no puede recibir otra asignación.
- `let`: puede cambiar de valor.
- `var`: tiene reglas de ámbito antiguas; no se utilizará como opción habitual.

Utilizar `const` por defecto y `let` solo cuando la reasignación sea necesaria.

## 2.2. Nombres

```js
const precioEntrada = 8.5;
const estaDisponible = true;
const numeroDeSesiones = 4;
```

Buenas prácticas:

- Usar nombres descriptivos.
- Emplear `camelCase` para variables y funciones.
- Evitar tildes, espacios y nombres como `dato`, `cosa` o `x` fuera de contextos muy breves.
- No empezar por un número.

## 2.3. Tipos primitivos

```js
const titulo = "Taller de radio"; // string
const duracion = 90;              // number
const gratuito = true;            // boolean
const pendiente = null;           // ausencia intencionada
let responsable;                  // undefined
```

```js
console.log(typeof titulo);    // "string"
console.log(typeof duracion);  // "number"
```

JavaScript tiene tipado dinámico: una variable puede recibir valores de tipos distintos, aunque cambiar de tipo sin motivo suele dificultar el código.

## 2.4. Plantillas de texto

```js
const actividad = "Taller de radio";
const plazas = 12;
const resumen = `${actividad}: quedan ${plazas} plazas.`;
```

Los *template literals* usan comillas invertidas y permiten interpolar expresiones mediante `${...}`.

## 2.5. Operadores aritméticos

```js
const precio = 7.5;
const cantidad = 3;
const subtotal = precio * cantidad;
const impuesto = subtotal * 0.07;
const total = subtotal + impuesto;
```

Operadores: `+`, `-`, `*`, `/`, `%` y `**`.

```js
const esPar = cantidad % 2 === 0;
```

## 2.6. Comparaciones

```js
console.log(5 === 5);     // true
console.log(5 === "5");   // false
console.log(5 !== "5");   // true
console.log(8 >= 5);      // true
```

Se recomiendan `===` y `!==`, que no realizan conversión automática de tipo. `==` y `!=` pueden producir resultados sorprendentes.

## 2.7. Operadores lógicos

```js
const edad = 19;
const autorizacion = true;

const puedeEntrar = edad >= 18 && autorizacion;
const tieneDescuento = edad < 18 || edad >= 65;
const noAutorizado = !autorizacion;
```

- `&&`: se cumplen ambas condiciones.
- `||`: se cumple al menos una.
- `!`: negación.

## 2.8. Valores verdaderos y falsos

En una condición, JavaScript convierte valores a booleano. Son falsos, entre otros:

- `false`
- `0`
- `""`
- `null`
- `undefined`
- `NaN`

Una cadena `"false"` no está vacía y por tanto es verdadera en una condición.

## 2.9. Conversión de tipos

Los valores de formularios llegan normalmente como texto:

```js
const cantidadTexto = "4";
const cantidad = Number(cantidadTexto);

if (Number.isNaN(cantidad)) {
  console.error("La cantidad no es válida");
}
```

Otras conversiones:

```js
String(42);        // "42"
Boolean(1);        // true
parseInt("12", 10); // 12
parseFloat("8.50"); // 8.5
```

`Number("")` devuelve `0`, por lo que primero conviene comprobar si un campo obligatorio está vacío.

## 2.10. Valores especiales

```js
const resultado = 0 / 0;     // NaN
const infinito = 10 / 0;     // Infinity
```

Para comprobar `NaN`:

```js
Number.isNaN(resultado);
```

## 2.11. Coalescencia nula y encadenamiento opcional

```js
const nombre = usuario.nombre ?? "Sin nombre";
const ciudad = usuario.direccion?.ciudad ?? "No indicada";
```

- `??` usa la alternativa solo ante `null` o `undefined`.
- `?.` evita un error si una parte de la cadena no existe.

## 2.12. Actividades

1. Calcula el total de una reserva con precio, cantidad y descuento.
2. Convierte una cantidad recibida como texto y comprueba si es válida.
3. Compara `5 == "5"` y `5 === "5"`.
4. Construye un mensaje con template literals.
5. Utiliza `?.` y `??` para leer un dato opcional.

