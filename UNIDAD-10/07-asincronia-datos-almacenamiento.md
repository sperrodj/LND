# 7. Asincronía, Fetch, JSON y almacenamiento

## 7.1. Código síncrono y asíncrono

Una solicitud de red tarda un tiempo desconocido. JavaScript no debe bloquear toda la página mientras espera. Las promesas representan un resultado que puede llegar en el futuro.

```js
fetch("datos/actividades.json")
  .then(respuesta => respuesta.json())
  .then(datos => console.log(datos))
  .catch(error => console.error(error));
```

## 7.2. `async` y `await`

```js
async function cargarActividades() {
  const respuesta = await fetch("datos/actividades.json");
  const datos = await respuesta.json();
  return datos;
}
```

- Una función `async` siempre devuelve una promesa.
- `await` pausa esa función, no toda la página.
- Solo puede usarse dentro de una función `async` o en determinados contextos de módulo.

## 7.3. Comprobar la respuesta

`fetch` no rechaza automáticamente la promesa ante todos los códigos HTTP de error:

```js
async function cargarActividades() {
  const respuesta = await fetch("datos/actividades.json");

  if (!respuesta.ok) {
    throw new Error(`Error HTTP: ${respuesta.status}`);
  }

  return respuesta.json();
}
```

## 7.4. `try`, `catch` y `finally`

```js
async function iniciar() {
  mostrarCargando(true);

  try {
    actividades = await cargarActividades();
    renderizarActividades(actividades);
  } catch (error) {
    console.error(error);
    mostrarError("No se pudo cargar la programación.");
  } finally {
    mostrarCargando(false);
  }
}
```

La interfaz debe contemplar al menos estados de carga, éxito, vacío y error.

## 7.5. JSON

`datos/actividades.json`:

```json
[
  {
    "id": "A01",
    "titulo": "Laboratorio de sonido",
    "categoria": "musica",
    "plazas": 12
  },
  {
    "id": "A02",
    "titulo": "Torneo de ajedrez",
    "categoria": "juegos",
    "plazas": 20
  }
]
```

JSON admite cadenas, números, booleanos, `null`, arrays y objetos. No admite comentarios, funciones ni comas finales.

```js
const texto = JSON.stringify(actividades);
const datos = JSON.parse(texto);
```

## 7.6. Servidor local y CORS

Las solicitudes a archivos locales pueden estar restringidas. Conviene ejecutar el proyecto mediante un servidor de desarrollo, por ejemplo la extensión Live Server o una herramienta equivalente.

CORS es una política de seguridad del navegador relacionada con solicitudes entre orígenes. No debe «solucionarse» desactivando la seguridad del navegador; se necesita una API que permita el origen o un servidor configurado correctamente.

## 7.7. `localStorage`

```js
localStorage.setItem("tema", "oscuro");
const tema = localStorage.getItem("tema");
localStorage.removeItem("tema");
```

Solo almacena cadenas. Para datos estructurados:

```js
const favoritas = ["A01", "A03"];
localStorage.setItem("favoritas", JSON.stringify(favoritas));

const guardadas = JSON.parse(
  localStorage.getItem("favoritas") ?? "[]"
);
```

## 7.8. Lectura segura del almacenamiento

Los datos pueden estar dañados o haber sido modificados:

```js
function cargarFavoritas() {
  try {
    const datos = JSON.parse(localStorage.getItem("favoritas") ?? "[]");
    return Array.isArray(datos) ? datos : [];
  } catch {
    return [];
  }
}
```

## 7.9. Limitaciones y privacidad

- `localStorage` pertenece al origen de la página.
- Persiste entre sesiones hasta que se elimina.
- El usuario o el navegador pueden borrarlo o restringirlo.
- No debe almacenar contraseñas, tokens sensibles o información privada.
- Es síncrono; no es adecuado para grandes volúmenes.
- No sustituye una base de datos ni un servidor.

## 7.10. Estado inicial

```js
let actividades = [];
let favoritas = cargarFavoritas();

async function iniciar() {
  try {
    actividades = await cargarActividades();
    renderizarActividades(actividades);
  } catch (error) {
    mostrarError(error.message);
  }
}

iniciar();
```

## 7.11. Actividades

1. Carga un JSON local con `fetch`.
2. Controla una respuesta no válida.
3. Muestra estados de carga, error y vacío.
4. Guarda una lista de identificadores en `localStorage`.
5. Recupera el almacenamiento controlando JSON dañado.

