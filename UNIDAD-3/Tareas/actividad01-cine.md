# 7.12. Reto final de la unidad: Gestión de un cine

## Objetivo de la actividad

En este reto final pondrás en práctica los conocimientos adquiridos sobre **XML, DTD y XSD**. Diseñarás un documento XML para gestionar la cartelera, las salas, las sesiones y las reservas de un cine. Después, crearás un **DTD** y un **XSD** para definir y validar su estructura, y documentarás las comprobaciones realizadas con `xmllint`.

**Entrega:** enlace a la carpeta del proyecto en tu repositorio de GitHub, a través del aula virtual.

## 1. Enunciado

El cine **Cinépolis** quiere organizar digitalmente su cartelera y sus reservas. Para ello, necesita registrar las películas que ofrece, las salas con sus butacas, las sesiones programadas y las entradas reservadas por los clientes.

Tu misión es crear los archivos `cine.xml`, `cine.dtd` y `cine.xsd`, de forma que **el mismo XML sea válido tanto con el DTD como con el XSD**.

No se proporciona código de partida: deberás decidir cómo organizar los elementos y atributos respetando los requisitos siguientes.

## 2. Información que debe contener el XML

El elemento raíz será `<cine>` y tendrá un atributo `id` obligatorio. En su interior aparecerán, **en este orden**, los bloques que se describen a continuación.

### 2.1. Información del cine

Incluye el nombre, la dirección, la localidad y el teléfono de contacto.

### 2.2. Cartelera

Cada película debe contener:

- Un identificador único obligatorio (`id`).
- Título, director, género, duración en minutos y fecha de estreno.
- Sinopsis, de carácter opcional.
- Los atributos `clasificacion` (TP, 7, 12, 16 o 18), `idioma` (ES, VOSE o VO) y `disponible` (booleano, con valor predeterminado `true`).

### 2.3. Salas y butacas

Cada sala debe contener:

- Un identificador único obligatorio (`id`).
- Nombre o número de la sala y su capacidad.
- Un listado de butacas.

Cada butaca debe disponer de:

- Un identificador único obligatorio (`id`).
- Una fila identificada por una letra y un número de asiento.
- Un atributo `tipo` con uno de estos valores: `normal`, `premium` o `adaptada`.

### 2.4. Sesiones

Cada sesión debe contener:

- Un identificador único obligatorio (`id`).
- Fecha de proyección, hora de inicio y precio de entrada.
- Un atributo obligatorio `pelicula` que haga referencia al identificador de una película.
- Un atributo obligatorio `sala` que haga referencia al identificador de una sala.
- En el precio, un atributo `moneda` cuyo valor será `EUR`.

### 2.5. Reservas

Cada reserva debe contener:

- Un identificador único obligatorio (`id`).
- Nombre y correo electrónico del cliente.
- Fecha de la reserva.
- Una o varias entradas.
- Un atributo obligatorio `sesion` que haga referencia al identificador de una sesión.
- Un atributo `estado` con los valores `pendiente`, `confirmada` o `cancelada`.

Cada entrada debe indicar:

- La butaca reservada mediante un atributo de referencia al identificador de una butaca existente.
- Un atributo `tipo` que podrá ser `general`, `infantil` o `reducida`.

## 3. Condiciones obligatorias

Tu XML deberá cumplir **todas** las condiciones siguientes:

1. Incluir **4 películas**, pertenecientes como mínimo a **3 géneros distintos**.
2. Incluir **una película no disponible**, **una clasificada para mayores de 18 años** y **una sin sinopsis**.
3. Definir **2 salas**, con **4 butacas cada una**.
4. Incluir butacas de tipo `normal`, `premium` y al menos una `adaptada`.
5. Registrar **4 sesiones**. Deben utilizarse ambas salas y debe haber, al menos, una película proyectada en más de una sesión.
6. Crear **3 reservas**, una de ellas con **2 entradas** como mínimo, y utilizar al menos dos estados diferentes.
7. Utilizar identificadores únicos para el cine, las películas, las salas, las butacas, las sesiones y las reservas.
8. Hacer que todas las referencias apunten a identificadores existentes en el documento.
9. Evitar reservar la misma butaca dos veces para una misma sesión y asegurarte de que cada butaca reservada pertenece a la sala de la sesión correspondiente. **Estas dos últimas comprobaciones deberás realizarlas revisando tus datos**, porque no quedan garantizadas por los tipos básicos `ID` e `IDREF`.

## 4. Creación del DTD

Crea `cine.dtd` para describir:

- La jerarquía y el orden de los elementos.
- Los elementos obligatorios, opcionales y repetibles.
- Los atributos obligatorios, opcionales y con valor predeterminado.
- Los identificadores `ID` y las referencias `IDREF`.
- Las enumeraciones de los atributos cuando corresponda.

> Recuerda: el DTD permite definir la estructura, pero no puede expresar con la misma precisión que un XSD restricciones como fechas, decimales o rangos numéricos.

## 5. Creación del XSD

Crea `cine.xsd` para validar el mismo XML. Además de la estructura anterior, aplica estas restricciones:

| Campo | Restricción |
|---|---|
| Identificadores | `xs:ID`, obligatorios |
| Referencias a película, sala, sesión y butaca | `xs:IDREF`, obligatorias |
| Duración | Entero entre 30 y 240 minutos |
| Fecha de estreno, fecha de sesión y fecha de reserva | `xs:date` |
| Clasificación | TP, 7, 12, 16 o 18 |
| Idioma | ES, VOSE o VO |
| Disponible | `xs:boolean`, valor predeterminado `true` |
| Capacidad | Entero positivo, máximo 300 |
| Número de asiento | Entero positivo |
| Tipo de butaca | normal, premium o adaptada |
| Hora de inicio | `xs:time` |
| Precio | Decimal mayor que 0 |
| Moneda | Valor fijo `EUR` |
| Estado de reserva | pendiente, confirmada o cancelada |
| Tipo de entrada | general, infantil o reducida |
| Sinopsis | Opcional |

Utiliza `xs:sequence`, `xs:complexType`, `xs:simpleType`, restricciones y `minOccurs`/`maxOccurs` cuando sea necesario.

**Importante:** los mínimos concretos del reto (4 películas, 2 salas, etc.) deberán cumplirse en tus datos XML. No es obligatorio codificar todos esos mínimos como restricciones adicionales en el XSD.

## 6. Validación y capturas

Abre la terminal en la carpeta que contiene tus archivos y ejecuta:

**Validación con DTD:**

```bash
xmllint --noout --dtdvalid cine.dtd cine.xml
```

Si la validación es correcta, puede que no aparezca ningún mensaje. Puedes ejecutar `echo $?` inmediatamente después para comprobar que el código de salida es `0`.

**Validación con XSD:**

```bash
xmllint --noout --schema cine.xsd cine.xml
```

Si todo es correcto, verás un mensaje similar a `cine.xml validates`.

Realiza y guarda las **4 capturas** siguientes:

1. `validacion-dtd.png`: validación correcta con DTD (comando y código de salida `0`).
2. `validacion-xsd.png`: validación correcta con XSD.
3. `error-dtd.png`: error provocado temporalmente al eliminar un elemento obligatorio, cambiar el orden o introducir un atributo no permitido.
4. `error-xsd.png`: error provocado temporalmente al indicar, por ejemplo, una duración de `500`, un precio negativo o una clasificación no admitida.

**Después de capturar los errores, deshaz los cambios:** la versión final de `cine.xml` debe validar correctamente frente a ambos archivos.

## 7. Entrega en GitHub

Crea esta estructura dentro del repositorio del módulo:

```text
reto-final-cine/
├── cine.xml
├── cine.dtd
├── cine.xsd
├── README.md
└── capturas/
    ├── validacion-dtd.png
    ├── validacion-xsd.png
    ├── error-dtd.png
    └── error-xsd.png
```

El `README.md` deberá contener:

- Una breve presentación del proyecto.
- Una explicación de la organización del XML y de las referencias entre elementos.
- Los comandos utilizados en las validaciones.
- Las cuatro capturas con una explicación de qué demuestra cada una.
- Una reflexión breve sobre las diferencias entre DTD y XSD observadas durante el trabajo.

**En el aula virtual entrega únicamente el enlace a la carpeta `reto-final-cine` de tu repositorio de GitHub.**

## 8. Criterios de evaluación

| Criterio | Puntuación |
|---|---:|
| Estructura del XML y cumplimiento de las condiciones | 2 puntos |
| Definición correcta del DTD | 2 puntos |
| Definición correcta del XSD y sus restricciones | 3 puntos |
| Validaciones, detección de errores y capturas | 2 puntos |
| Organización del repositorio y documentación | 1 punto |
| **Total** | **10 puntos** |

> **Recuerda:** que un XML esté bien formado no significa que sea válido. Para superar el reto, deberás demostrar que cumple las reglas de **ambos** esquemas y explicar los errores detectados durante la validación.
