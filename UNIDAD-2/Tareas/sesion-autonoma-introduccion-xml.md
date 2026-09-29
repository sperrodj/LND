# Sesión autónoma. Introducción práctica a XML

[← Volver al índice de la unidad](README.md)

> **Duración:** 2 sesiones de 55 minutos  
> **Modalidad:** trabajo individual y autónomo  
> **Herramientas:** navegador, Visual Studio Code, Git y GitHub  
> **Producto final:** documentación en Markdown y cuatro archivos XML

## Indicaciones para el profesor o profesora de guardia

El alumnado dispone en este documento de todas las explicaciones e instrucciones necesarias. No es necesario impartir contenido teórico.

Al comienzo de la sesión deberá recordarse:

1. El trabajo es individual.
2. Cada estudiante debe trabajar en su repositorio de Lenguajes de Marcas.
3. Deben seguir las fases en orden y respetar los tiempos orientativos.
4. Al terminar, todo debe estar subido a GitHub.

Alrededor del minuto 55, conviene comprobar que han llegado, como mínimo, a la **fase 4**. Durante los últimos diez minutos deben realizar el commit, subir los cambios y revisar el enlace.

Si alguien tiene un problema técnico con la extensión de XML, puede continuar utilizando el resaltado básico de VS Code y el navegador. El problema deberá quedar anotado en su `README.md`.

---

# Instrucciones para el alumnado

## 1. ¿Qué vas a aprender?

Hoy comenzarás la Unidad 2 trabajando de forma práctica con XML. Al finalizar deberás ser capaz de:

- Explicar con tus palabras qué es XML y para qué se utiliza.
- Reconocer elementos, etiquetas, atributos y contenido.
- Crear un documento XML sencillo.
- Interpretar su estructura como un árbol.
- Detectar y corregir errores de buena formación.
- Documentar el proceso con Markdown, código y capturas.
- Crear de forma independiente un documento XML sobre un tema elegido.

> [!IMPORTANT]
> No te limites a copiar código. Escribe siempre las explicaciones solicitadas y comprueba qué sucede en cada paso.

## 2. Organización y tiempos

| Tiempo | Fase | Trabajo |
|---:|---|---|
| 0–10 min | Preparación | Repositorio, carpetas y extensión XML |
| 10–25 min | Investigación | Qué es XML, diferencias y usos |
| 25–45 min | Primer documento | Crear, abrir y analizar un XML |
| 45–60 min | Modificación guiada | Ampliar elementos, atributos y colecciones |
| 60–80 min | Laboratorio de errores | Provocar, observar y corregir errores |
| 80–105 min | Actividad independiente | Diseñar un XML temático propio |
| 105–110 min | Entrega | Revisar, hacer commit y subir a GitHub |

Los tiempos son orientativos. Si terminas una fase antes, continúa con la siguiente.

## 3. Estructura de trabajo

Dentro de tu repositorio `lenguajes-de-marcas`, crea esta estructura:

```text
unidad-02/
└── sesion-01-introduccion-xml/
    ├── README.md
    ├── primer-documento.xml
    ├── catalogo-ampliado.xml
    ├── errores.xml
    ├── actividad-final.xml
    └── img/
        ├── 01-extension-xml.png
        ├── 02-primer-xml.png
        ├── 03-error-xml.png
        └── 04-actividad-final.png
```

Los nombres de las capturas deben mantenerse para que los enlaces del Markdown sean fáciles de revisar.

## 4. Preparar el repositorio y VS Code — 10 minutos

### Paso 1. Abre tu repositorio

Abre en Visual Studio Code la carpeta local de tu repositorio.

Si ya lo tienes descargado, abre una terminal integrada mediante **Terminal → New Terminal** y actualízalo:

```bash
git pull
```

Después, comprueba su estado:

```bash
git status
```

Si aparece un error, copia el mensaje en tu `README.md` y continúa creando los archivos desde VS Code. No borres ni reinicies el repositorio.

### Paso 2. Crea la estructura

Desde el explorador de archivos de VS Code:

1. Crea `unidad-02` si todavía no existe.
2. Dentro, crea `sesion-01-introduccion-xml`.
3. Crea la carpeta `img`.
4. Crea los cinco archivos indicados en la estructura.

### Paso 3. Instala la extensión XML

1. Abre **Extensions** con `Ctrl + Shift + X`.
2. Busca `XML`.
3. Instala **XML**, publicada por **Red Hat**.
4. Comprueba que aparece habilitada.

El identificador de la extensión es:

```text
redhat.vscode-xml
```

Realiza una captura en la que se vea la extensión instalada y guárdala como:

```text
img/01-extension-xml.png
```

En el `README.md`, comienza con:

```markdown
# Sesión 1. Introducción práctica a XML

## 1. Preparación del entorno

He instalado la extensión **XML de Red Hat** para disponer de resaltado,
formateo y detección de errores en Visual Studio Code.

![Extensión XML instalada](img/01-extension-xml.png)
```

> [!TIP]
> Para previsualizar el Markdown utiliza `Ctrl + Shift + V`. Revisa periódicamente que las imágenes y los bloques de código se muestran correctamente.

## 5. Investigación guiada — 15 minutos

XML significa **eXtensible Markup Language**. Es un lenguaje de marcas extensible utilizado para representar información estructurada mediante texto.

Antes de programar, realiza una búsqueda breve utilizando al menos **dos fuentes diferentes**. Puedes comenzar con:

- Documentación de MDN sobre XML.
- Introducción a XML del W3C.
- Documentación de la extensión XML de Red Hat.

No copies párrafos completos. Lee, compara y redacta con tus propias palabras.

### Añade al `README.md`

Crea el apartado:

```markdown
## 2. Investigación inicial
```

Responde:

1. ¿Qué significa XML?
2. ¿Por qué se considera un lenguaje extensible?
3. ¿Cuál es la diferencia principal entre XML y HTML?
4. Escribe tres usos reales de XML.
5. ¿Qué significa que un documento sea legible por personas y máquinas?
6. ¿Por qué XML no debe considerarse automáticamente una base de datos?

Después añade:

```markdown
### Fuentes consultadas

- [Título de la primera fuente](URL)
- [Título de la segunda fuente](URL)
```

### Resultado mínimo esperado

Tu explicación debe dejar claras estas ideas:

- XML permite crear vocabularios propios.
- Sus datos se organizan de manera jerárquica.
- Las etiquetas describen el contenido.
- Es estricto con los errores de sintaxis.
- Se utiliza para intercambio, configuración, documentos y formatos especializados.

## 6. Primer documento XML — 20 minutos

### Paso 1. Escribe el código

Abre `primer-documento.xml` y escribe manualmente:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<videojuego>
  <titulo>Hollow Knight</titulo>
  <desarrolladora>Team Cherry</desarrolladora>
  <genero>Metroidvania</genero>
  <precio moneda="EUR">14.99</precio>
</videojuego>
```

Guarda el archivo con `Ctrl + S`.

### Paso 2. Observa el resaltado

Comprueba que VS Code muestra con colores diferentes:

- La declaración XML.
- Las etiquetas.
- El nombre del atributo.
- El valor del atributo.
- El contenido textual.

Si todo aparece con el mismo color, comprueba en la esquina inferior derecha que el modo de lenguaje sea **XML**.

### Paso 3. Ábrelo en el navegador

Desde el explorador de archivos del sistema, abre `primer-documento.xml` con Firefox o Chrome. El navegador deberá mostrar el árbol del documento o su contenido estructurado.

Realiza una captura y guárdala como:

```text
img/02-primer-xml.png
```

### Paso 4. Documenta el resultado

Añade al `README.md`:

```markdown
## 3. Mi primer documento XML

![Primer XML abierto en el navegador](img/02-primer-xml.png)
```

Debajo de la captura:

1. Copia el código dentro de un bloque `xml`.
2. Identifica el elemento raíz.
3. Enumera todos los elementos.
4. Identifica el atributo y su valor.
5. Explica qué relación existe entre `videojuego` y `titulo`.
6. Indica qué elementos son hermanos.

### Conceptos que debes comprender

#### Declaración XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

Indica la versión de XML y la codificación de caracteres.

#### Elemento

```xml
<titulo>Hollow Knight</titulo>
```

El elemento completo incluye la etiqueta de apertura, el contenido y la etiqueta de cierre.

#### Atributo

```xml
<precio moneda="EUR">14.99</precio>
```

`moneda` es un atributo y `EUR` es su valor.

#### Elemento raíz

`videojuego` es el único elemento de nivel superior y contiene todos los demás.

## 7. Modificación guiada — 15 minutos

Abre `catalogo-ampliado.xml` y crea un catálogo con varios videojuegos:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<catalogo actualizado="2026-09-29">
  <videojuego id="V001" disponible="true">
    <titulo>Hollow Knight</titulo>
    <desarrolladora>Team Cherry</desarrolladora>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>Switch</plataforma>
    </plataformas>
    <precio moneda="EUR">14.99</precio>
  </videojuego>

  <videojuego id="V002" disponible="true">
    <titulo>Celeste</titulo>
    <desarrolladora>Extremely OK Games</desarrolladora>
    <plataformas>
      <plataforma>PC</plataforma>
      <plataforma>Switch</plataforma>
    </plataformas>
    <precio moneda="EUR">19.99</precio>
  </videojuego>
</catalogo>
```

### Modificaciones obligatorias

Sin copiar otro ejemplo, añade un tercer videojuego que incluya:

- Un identificador diferente.
- Título y desarrolladora.
- Al menos tres plataformas.
- Precio y moneda.
- Un elemento opcional `descripcion`.
- Un comentario XML útil antes del tercer videojuego.

Ejemplo de comentario:

```xml
<!-- Juego añadido durante la sesión de introducción -->
```

### Documentación

Añade al `README.md`:

```markdown
## 4. Ampliación del catálogo
```

Incluye:

1. El código XML final.
2. Una explicación de por qué `plataformas` funciona como contenedor.
3. La diferencia entre `id` y `titulo` en este diseño.
4. El número de elementos `videojuego` y `plataforma` utilizados.
5. Una lista de las modificaciones realizadas.

## 8. Laboratorio de errores — 20 minutos

Ahora comprobarás que XML es estricto. Copia en `errores.xml` exactamente este código incorrecto:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<equipo nombre="Vengadores">
  <heroe id=H01>
    <alias>Iron Man</Alias>
    <nombre>Tony Stark</nombre>
    <habilidad>Tecnología & estrategia</habilidad>
  </heroe>
  <heroe id="H02">
    <alias>Capitana Marvel</alias>
    <nombre>Carol Danvers
  </heroe>
</equipo>
```

### Paso 1. Observa los errores

1. Guarda el archivo.
2. Observa los subrayados de VS Code.
3. Abre el panel **Problems** con `Ctrl + Shift + M`.
4. Lee el primer mensaje de error.
5. Realiza una captura antes de corregir y guárdala como:

   ```text
   img/03-error-xml.png
   ```

### Paso 2. Documenta antes de corregir

Añade al `README.md`:

```markdown
## 5. Laboratorio de errores

![Errores detectados por VS Code](img/03-error-xml.png)
```

Crea una tabla:

```markdown
| Error detectado | Regla que incumple | Corrección realizada |
|---|---|---|
| ... | ... | ... |
```

Localiza al menos **cuatro errores diferentes**.

### Paso 3. Corrige el archivo

Corrige uno a uno los errores. Después de cada cambio, guarda y observa si disminuye el número de problemas.

El archivo final deberá cumplir:

- Todos los valores de atributos están entre comillas.
- Las mayúsculas coinciden en apertura y cierre.
- Los caracteres reservados se representan correctamente.
- Todos los elementos están cerrados.
- El documento tiene una única raíz.

No incluyas la solución copiada de otra persona: el historial de Git debe reflejar tu trabajo.

## 9. Actividad final independiente — 25 minutos

Ha llegado el momento de crear un documento sin plantilla completa.

### Elige una temática

- Marvel.
- League of Legends.
- Jujutsu Kaisen.
- Fútbol.
- Otra temática aprobada por la profesora en sesiones posteriores.

### Enunciado

En `actividad-final.xml`, representa una colección relacionada con el tema elegido.

El documento deberá incluir:

1. Declaración XML con `UTF-8`.
2. Un único elemento raíz con un nombre significativo.
3. Al menos tres registros principales.
4. Un atributo identificador diferente en cada registro.
5. Al menos seis nombres de elementos diferentes.
6. Una colección interna con elementos repetidos.
7. Un dato compuesto mediante dos o más elementos hijos.
8. Un elemento opcional que no aparezca en todos los registros.
9. Un comentario XML.
10. Un texto con `&`, escrito correctamente como `&amp;`.
11. Indentación clara y consistente.
12. Un documento completamente bien formado.

### Ejemplos de colecciones posibles

| Tema | Raíz | Registros | Colección interna |
|---|---|---|---|
| Marvel | `universo` | `heroe` | `habilidades` |
| League of Legends | `campeones` | `campeon` | `roles` o `habilidades` |
| Jujutsu Kaisen | `registro-jjk` | `personaje` | `tecnicas` |
| Fútbol | `competicion` | `equipo` | `jugadores` |

La tabla solo orienta. El diseño concreto lo decides tú.

### Documentación obligatoria

Añade al `README.md`:

```markdown
## 6. Actividad final independiente
```

Incluye:

1. Tema elegido.
2. Explicación de qué representa el documento.
3. Árbol mediante una lista anidada o Mermaid.
4. Código completo dentro de un bloque `xml`.
5. Tabla con tres decisiones de diseño:

   ```markdown
   | Dato | Elemento o atributo | Justificación |
   |---|---|---|
   | ... | ... | ... |
   ```

6. Explicación del elemento opcional.
7. Recuento de registros, elementos diferentes y atributos.
8. Una captura del XML abierto en VS Code o en el navegador:

   ```markdown
   ![Actividad final XML](img/04-actividad-final.png)
   ```

## 10. Revisión final y entrega — 5 minutos

### Comprueba los archivos

- [ ] El `README.md` contiene los seis apartados solicitados.
- [ ] Las cuatro capturas se muestran correctamente.
- [ ] Los códigos están dentro de bloques con `xml`.
- [ ] `primer-documento.xml` está bien formado.
- [ ] `catalogo-ampliado.xml` contiene tres videojuegos.
- [ ] `errores.xml` está corregido.
- [ ] `actividad-final.xml` cumple los doce requisitos.
- [ ] Las respuestas están escritas con tus propias palabras.
- [ ] Las fuentes consultadas están enlazadas.

### Comprueba el estado de Git

En la terminal:

```bash
git status
```

Añade únicamente la carpeta de esta sesión:

```bash
git add unidad-02/sesion-01-introduccion-xml
```

Crea el commit:

```bash
git commit -m "Completa la sesión inicial de XML"
```

Sube los cambios:

```bash
git push
```

Vuelve a ejecutar:

```bash
git status
```

El resultado esperado es:

```text
nothing to commit, working tree clean
```

### Enlace de entrega

Comprueba en GitHub que puedes abrir:

```text
https://github.com/tu-usuario/lenguajes-de-marcas/tree/main/unidad-02/sesion-01-introduccion-xml
```

Si el aula virtual solicita una entrega, pega ese enlace.

## 11. Evidencias que deben existir al finalizar

| Evidencia | Ubicación |
|---|---|
| Investigación y fuentes | `README.md` |
| Extensión instalada | `img/01-extension-xml.png` |
| Primer documento en navegador | `img/02-primer-xml.png` |
| Error detectado por VS Code | `img/03-error-xml.png` |
| Actividad independiente | `img/04-actividad-final.png` |
| Ejemplos funcionales | Cuatro archivos `.xml` |
| Explicaciones y decisiones | `README.md` |
| Historial del trabajo | Commit de Git y repositorio remoto |

## 12. Criterios de revisión de la sesión

| Aspecto | Peso orientativo |
|---|---:|
| Investigación y explicaciones propias | 20 % |
| Primer documento y análisis | 15 % |
| Catálogo ampliado | 15 % |
| Detección y corrección de errores | 20 % |
| Actividad final independiente | 25 % |
| Organización, capturas y entrega | 5 % |

> [!TIP]
> Si te bloqueas, vuelve al último archivo que funcionaba, compara las etiquetas de apertura y cierre y corrige siempre el primer error antes de continuar con los siguientes.

---

[← Volver al índice de la unidad](README.md)
