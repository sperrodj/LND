# 4. Arrays, objetos y procesamiento de datos

## 4.1. Arrays

```js
const materiales = ["cartulina", "tijeras", "pegamento"];

console.log(materiales[0]);
console.log(materiales.length);
```

Los índices comienzan en cero.

## 4.2. Añadir y eliminar

```js
materiales.push("rotuladores");
const ultimo = materiales.pop();
const primero = materiales.shift();
materiales.unshift("regla");
```

- `push` y `pop`: final.
- `unshift` y `shift`: inicio.

Estos métodos modifican el array original.

## 4.3. Buscar

```js
const incluyeTijeras = materiales.includes("tijeras");
const posicion = materiales.indexOf("pegamento");
```

Con objetos:

```js
const talleres = [
  { id: 1, titulo: "Podcast", plazas: 8 },
  { id: 2, titulo: "Fotografía", plazas: 0 }
];

const taller = talleres.find(item => item.id === 2);
const indice = talleres.findIndex(item => item.id === 2);
```

## 4.4. Transformar con `map`

```js
const nombres = talleres.map(taller => taller.titulo);
```

`map` crea un nuevo array con un resultado por cada elemento.

## 4.5. Filtrar

```js
const disponibles = talleres.filter(taller => taller.plazas > 0);
```

`filter` devuelve un array nuevo con los elementos que cumplen la condición.

## 4.6. Comprobar con `some` y `every`

```js
const hayCompletos = talleres.some(taller => taller.plazas === 0);
const todosValidos = talleres.every(taller => taller.titulo !== "");
```

## 4.7. Acumular con `reduce`

```js
const totalPlazas = talleres.reduce(
  (acumulador, taller) => acumulador + taller.plazas,
  0
);
```

`reduce` es potente, pero no debe sustituir un código más claro cuando un bucle sencillo expresa mejor la intención.

## 4.8. Ordenar

```js
const porTitulo = [...talleres].sort((a, b) =>
  a.titulo.localeCompare(b.titulo, "es")
);

const porPlazas = [...talleres].sort((a, b) => a.plazas - b.plazas);
```

`sort` modifica el array. La copia `[...talleres]` conserva el original.

## 4.9. Objetos

```js
const actividad = {
  id: 3,
  titulo: "Iniciación al teatro",
  categoria: "arte",
  plazas: 15,
  gratuita: true
};

console.log(actividad.titulo);
console.log(actividad["categoria"]);
```

Modificar y añadir:

```js
actividad.plazas = 14;
actividad.sala = "Salón de actos";
```

`const` impide reasignar la variable, pero no hace inmutable el objeto.

## 4.10. Desestructuración

```js
const { titulo, categoria, plazas = 0 } = actividad;
const [primerMaterial, segundoMaterial] = materiales;
```

## 4.11. Copia y extensión

```js
const actividadActualizada = {
  ...actividad,
  plazas: actividad.plazas - 1
};

const todosLosMateriales = [...materiales, "cinta adhesiva"];
```

El operador spread realiza una copia superficial: los objetos anidados continúan compartiendo referencias.

## 4.12. Métodos de objeto

```js
const persona = {
  nombre: "Nora",
  saludar() {
    return `Hola, soy ${this.nombre}`;
  }
};
```

En métodos que necesitan `this`, una función flecha puede no comportarse como se espera.

## 4.13. Encadenar operaciones

```js
const titulosDisponibles = talleres
  .filter(taller => taller.plazas > 0)
  .sort((a, b) => a.titulo.localeCompare(b.titulo, "es"))
  .map(taller => taller.titulo);
```

Cada paso debe mantener una intención clara. Si la cadena resulta difícil de leer, puede dividirse en variables intermedias.

## 4.14. Actividades

1. Crea un array con cinco actividades.
2. Filtra las disponibles y ordénalas alfabéticamente.
3. Calcula la suma de plazas.
4. Encuentra una actividad por `id`.
5. Actualiza una actividad mediante spread sin modificar el objeto original.

