# UT5 · Actividad evaluable de XSLT
## Una noche de cine en Disney+

Crea desde cero una cartelera web con tu propia selección de películas de Disney+. Tú eliges las películas, las categorías, la estructura del XML y el diseño de la página. El catálogo se guarda en XML y la hoja XSLT lo transforma en una página HTML con tus estilos CSS.

## 1. Crea tu catálogo XML

- Incluye **al menos 4 categorías** y **3 películas por categoría**, con un mínimo de **12 títulos distintos en total**. Puedes organizar la selección por géneros, temáticas, estudios u otro criterio que tenga sentido para tu cartelera.
- De cada película recoge **título, año de estreno, duración en minutos, una sinopsis breve escrita con tus palabras y al menos dos integrantes del reparto**. En las películas de animación puedes indicar actores o actrices de voz.
- Incluye **un cartel o imagen representativa por película**. Guarda su ruta o URL en el XML.
- Asigna a cada película un **identificador único**. Decide qué datos guardas como elementos y cuáles como atributos.

## 2. Transforma el catálogo en una página web

- Usa **XSLT y XPath** para generar una página HTML que muestre las categorías y las películas que pertenecen a cada una. Recorre el catálogo con XSLT y muestra toda la información de cada película a partir de los datos del XML.
- Usa la ruta o URL del XML para mostrar la imagen de cada película en el HTML generado. Añade un texto alternativo que identifique la película.
- Aplica **una ordenación dentro de cada categoría** mediante XSLT. Elige tú el criterio, por ejemplo, por título o por año de estreno.
- Da estilo a la cartelera con **CSS propio**. Elige la distribución, la paleta, la tipografía y la forma de presentar las películas. Distingue visualmente los títulos de las categorías y de las películas, cuida el contraste del texto y deja espacio suficiente entre los bloques.

Antes de entregar, abre el HTML generado en el navegador y revisa que se ven todas las categorías, las películas, sus imágenes y el reparto. Añade una película a una categoría y vuelve a ejecutar la transformación para comprobar que aparece en el lugar que le corresponde.

## 3. Entrega

Entrega el enlace a tu repositorio de GitHub con el **XML**, la **hoja XSLT**, el **HTML generado** y el **CSS** si lo has escrito en un archivo independiente. Si usas imágenes locales, incluye también esos archivos en el repositorio. Incluye un `README.md` breve en el que expliques cómo ejecutar la transformación y qué criterio de agrupación y ordenación has elegido.

## 4. Rúbrica

| Criterio | Qué se valora | Puntos |
|---|---|---:|
| Catálogo XML | El XML está bien formado e incluye las categorías, las películas y todos los datos pedidos | 3 |
| Transformación XSLT | La hoja genera el HTML a partir del XML y muestra correctamente las categorías y sus películas, con los datos completos y sus imágenes | 3 |
| Ordenación | XSLT aplica el criterio elegido dentro de cada categoría | 1 |
| HTML y CSS | La página tiene una estructura clara, un diseño propio y contenido legible | 2 |
| Entrega | El repositorio incluye los archivos solicitados y el README permite reproducir la transformación | 1 |
| **Total** | | **10** |
