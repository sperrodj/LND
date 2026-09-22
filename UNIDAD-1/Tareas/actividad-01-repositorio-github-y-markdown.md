# Actividad 01. Repositorio de GitHub y primer documento Markdown

## ¿Qué vas a hacer?

En esta actividad crearás el repositorio de GitHub que utilizarás durante el módulo de **Lenguajes de Marcas y Sistemas de Gestión de Información**.

También redactarás un archivo `README.md` utilizando las principales posibilidades de Markdown y prepararás una estructura inicial para organizar el trabajo del curso.

Al terminar tendrás:

- Un repositorio correctamente configurado.
- Un `README.md` que funcionará como portada.
- Una estructura para guardar unidades y prácticas.
- Varios commits con mensajes descriptivos.
- Un enlace que la profesora podrá consultar.

> [!IMPORTANT]
> Sigue los pasos en orden y lee cada instrucción completa antes de realizarla.

## Objetivos

- Crear y configurar un repositorio en GitHub.
- Comprender la función de un archivo `README.md`.
- Utilizar la sintaxis principal de Markdown.
- Previsualizar un documento antes de publicarlo.
- Registrar cambios mediante commits.
- Organizar correctamente los archivos del módulo.
- Compartir el repositorio con la profesora.

## Antes de comenzar

Necesitas:

- Una cuenta de [GitHub](https://github.com/).
- Acceso al correo asociado a la cuenta.
- Un navegador web.
- La [chuleta de Markdown](https://github.com/sperrodj/LND/blob/main/UNIDAD-1/Apuntes/chuleta-markdown-1daw.md).
- El usuario de GitHub de la profesora si decides utilizar un repositorio privado.

No necesitas instalar Git ni utilizar la terminal. Esta primera actividad se realiza desde la web de GitHub.

---

# Parte 1. Crear el repositorio

## Paso 1. Inicia sesión

1. Abre [GitHub](https://github.com/).
2. Pulsa **Sign in**.
3. Introduce tus datos de acceso.
4. Comprueba que aparece tu avatar en la esquina superior derecha.

Si todavía no tienes cuenta, selecciona **Sign up**, completa el registro y verifica tu correo electrónico.

> [!CAUTION]
> No compartas tu contraseña con la profesora ni con tus compañeros.

## Paso 2. Crea el repositorio

1. Pulsa el símbolo **+** situado en la esquina superior derecha.
2. Selecciona **New repository**.
3. Comprueba que en **Owner** aparece tu cuenta.
4. Escribe este nombre:

   ```text
   lenguajes-de-marcas
   ```

5. Añade como descripción:

   ```text
   Repositorio de trabajo del módulo Lenguajes de Marcas de 1.º DAW.
   ```

6. Selecciona una visibilidad:

   - **Public:** cualquier persona con el enlace podrá consultar el repositorio.
   - **Private:** solamente podrán verlo las personas autorizadas y deberás invitar a la profesora.

7. Marca **Add a README file**.
8. Deja `.gitignore` en **None**.
9. Deja la licencia en **None**, salvo que la profesora indique otra cosa.
10. Pulsa **Create repository**.

> [!WARNING]
> No incluyas tu nombre en el nombre del repositorio. El repositorio ya está asociado a tu cuenta.

La dirección tendrá una forma similar a:

```text
https://github.com/tu-usuario/lenguajes-de-marcas
```

## Paso 3. Da acceso a la profesora

### Si el repositorio es público

No necesitas añadir colaboradores. La profesora podrá acceder mediante el enlace.

### Si el repositorio es privado

1. Entra en el repositorio.
2. Abre **Settings**.
3. Selecciona **Collaborators** o **Collaborators and teams**.
4. Pulsa **Add people**.
5. Introduce el usuario indicado por la profesora.
6. Selecciona la cuenta correcta.
7. Envía la invitación.
8. Comprueba que aparece como pendiente o aceptada.

---

# Parte 2. Crear el `README.md`

## Paso 4. Abre el editor

1. Regresa a la pestaña **Code** del repositorio.
2. Pulsa sobre `README.md`.
3. Pulsa el icono del lápiz: **Edit this file**.
4. Elimina el contenido inicial.
5. Consulta los requisitos del apartado siguiente antes de empezar a redactar.

## Paso 5. Diseña el contenido de tu `README.md`

Elabora tu propio documento Markdown. No tienes que reproducir una plantilla: decide cómo organizarlo y redacta el contenido con tus propias palabras.

Tu `README.md` debe incluir obligatoriamente:

1. Un **título principal** que identifique el módulo y el curso.
2. Una breve **presentación del repositorio**, explicando qué contenido guardarás en él.
3. Un apartado de **presentación personal académica** que incluya:
   - Tu nombre o un alias apropiado.
   - El ciclo y el curso que estudias.
   - Dos o tres intereses relacionados con la tecnología.
   - Algo que te gustaría aprender durante el módulo o el ciclo.
4. Un apartado con los **contenidos principales del módulo**. Puedes consultar los temas publicados en el aula virtual.
5. Una explicación de la **organización del repositorio**, indicando para qué se utilizarán las carpetas `unidad-01` y `practicas`.
6. Una relación de las **tecnologías o herramientas** que utilizarás durante el curso.
7. Un pequeño **fragmento de código** relacionado con desarrollo web.
8. Una sección de **seguimiento** con tareas completadas y pendientes.
9. Una frase final con el **curso académico 2026-2027**.

### Recursos de Markdown obligatorios

Para demostrar que conoces la sintaxis básica, el documento debe contener al menos:

- Un encabezado de nivel 1 y varios encabezados de nivel 2.
- Texto en **negrita** y en *cursiva*.
- Una cita.
- Una lista sin ordenar.
- Una lista numerada.
- Un enlace con texto descriptivo.
- Una tabla de al menos dos columnas.
- Código en línea.
- Un bloque de código con el lenguaje indicado.
- Una lista de tareas con elementos completados y pendientes.
- Una línea horizontal.

Puedes consultar la [chuleta de Markdown]([chuleta-markdown-1daw.md](https://github.com/sperrodj/LND/blob/main/UNIDAD-1/Apuntes/chuleta-markdown-1daw.md)), pero debes decidir dónde y cómo utilizar cada recurso.

> [!TIP]
> Hazlo tuyo. Estos requisitos son solamente el punto de partida: puedes añadir una imagen, insignias, una frase que te represente, tus objetivos, enlaces útiles, tecnologías que quieras aprender o cualquier otro apartado que aporte información y personalidad al repositorio.

> [!WARNING]
> No publiques tu dirección, teléfono, contraseñas, tokens ni otros datos personales sensibles.

## Paso 6. Previsualiza el resultado

Antes de guardar, pulsa **Preview** o **Preview changes** y comprueba:

- El título aparece como encabezado principal.
- Los apartados están correctamente separados.
- La tabla muestra dos columnas alineadas.
- El código HTML aparece en un bloque diferenciado.
- El enlace de GitHub funciona.
- Las tareas completadas aparecen marcadas.
- Están incluidos todos los contenidos y recursos Markdown obligatorios.

Si algo no se muestra correctamente, regresa a **Edit** y corrígelo.

## Paso 7. Crea el primer commit

1. Pulsa **Commit changes…**.
2. Escribe como mensaje:

   ```text
   Crea la presentación inicial del repositorio
   ```

3. Selecciona **Commit directly to the main branch**, si aparece.
4. Confirma mediante **Commit changes**.

Un buen mensaje explica qué se ha cambiado. Evita mensajes como `cosas`, `cambio`, `prueba` o `asdf`.

---

# Parte 3. Organizar el repositorio

GitHub no conserva carpetas vacías. Para crear una carpeta, debes añadir un archivo dentro de ella.

## Paso 8. Crea `unidad-01/README.md`

1. Pulsa **Add file**.
2. Selecciona **Create new file**.
3. En el nombre escribe:

   ```text
   unidad-01/README.md
   ```

4. Añade este contenido:

   ```markdown
   # Unidad 1. Introducción a los lenguajes de marcas

   En esta carpeta guardaré las actividades de la primera unidad.
   ```

5. Realiza el commit con el mensaje:

   ```text
   Crea la carpeta de la unidad 1
   ```

## Paso 9. Crea `practicas/README.md`

Repite el procedimiento utilizando:

```text
practicas/README.md
```

Contenido:

```markdown
# Prácticas

Índice de prácticas realizadas durante el módulo.
```

Mensaje del commit:

```text
Crea el índice de prácticas
```

## Estructura final esperada

```text
lenguajes-de-marcas/
├── unidad-01/
│   └── README.md
├── practicas/
│   └── README.md
└── README.md
```

---

# Entrega

Entrega en el aula virtual la dirección completa del repositorio:

```text
https://github.com/tu-usuario/lenguajes-de-marcas
```

## Comprobación del acceso

### Repositorio público

1. Copia la dirección.
2. Ábrela en una ventana privada o de incógnito.
3. Comprueba que se puede consultar sin iniciar sesión.

### Repositorio privado

Comprueba que la invitación a la profesora aparece como pendiente o aceptada.

---

# Lista de comprobación

- [ ] El repositorio se llama `lenguajes-de-marcas`.
- [ ] Incluye una descripción clara.
- [ ] Es público o la profesora está añadida como colaboradora.
- [ ] La raíz contiene un `README.md` personalizado.
- [ ] El documento incluye encabezados y párrafos.
- [ ] Incluye una lista numerada y otra no numerada.
- [ ] Incluye un enlace, una tabla y un bloque de código.
- [ ] Incluye una lista de tareas.
- [ ] Están incluidos todos los contenidos y recursos Markdown obligatorios.
- [ ] Existen `unidad-01/README.md` y `practicas/README.md`.
- [ ] Hay al menos tres commits con mensajes descriptivos.
- [ ] El enlace entregado funciona correctamente.
- [ ] No se ha publicado información sensible.

# Evaluación

| Criterio | Puntuación |
|---|---:|
| Repositorio creado y accesible | 2 puntos |
| `README.md` completo y personalizado | 2 puntos |
| Uso correcto de Markdown | 3 puntos |
| Organización inicial del repositorio | 1 punto |
| Commits claros y diferenciados | 1 punto |
| Presentación, ortografía y revisión | 1 punto |
| **Total** | **10 puntos** |

# Errores frecuentes

- Crear `README.txt` en lugar de `README.md`.
- No dejar un espacio después de `#`.
- No dejar una línea en blanco antes de una lista o tabla.
- Olvidar cerrar un bloque de código.
- Limitarse a copiar el trabajo de otra persona sin personalizar el contenido.
- Crear un repositorio privado y no invitar a la profesora.
- Utilizar mensajes de commit poco descriptivos.
- Incluir contraseñas, tokens o datos personales sensibles.

> [!TIP]
> La documentación no es un adorno. Ayuda a comprender, utilizar, mantener y compartir un proyecto.
