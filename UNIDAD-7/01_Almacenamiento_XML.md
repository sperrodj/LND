# 1. Almacenamiento de información XML

## 1.1. Datos persistentes

Los datos son persistentes cuando continúan disponibles después de cerrar el programa que los creó.

Ejemplos:

- Un archivo XML guardado en disco.
- Una tabla de una base de datos.
- Un documento almacenado en una base XML.
- Un recurso guardado en un servicio remoto.

## 1.2. Almacenamiento en archivos

La forma más sencilla consiste en guardar cada documento como un archivo:

```text
archivo-museo/
├── coleccion.xml
├── exposiciones.xml
├── artistas.xml
└── restauraciones.xml
```

Ejemplo:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<coleccion museo="Museo Atlántico">
  <obra id="O001">
    <titulo>Mareas de invierno</titulo>
    <artista>Elena Martín</artista>
    <anio>2018</anio>
    <tecnica>Óleo sobre lienzo</tecnica>
  </obra>
</coleccion>
```

### Ventajas

- Es fácil de crear y transportar.
- No requiere instalar un gestor.
- Puede abrirse con cualquier editor.
- Resulta adecuado para proyectos pequeños.
- Puede versionarse con Git.

### Limitaciones

- Las búsquedas pueden ser lentas cuando hay muchos archivos.
- Controlar accesos simultáneos es complicado.
- No existen automáticamente índices ni transacciones.
- Mantener relaciones entre documentos requiere trabajo adicional.
- La aplicación debe gestionar lectura, escritura y concurrencia.

## 1.3. Almacenamiento relacional

Una base de datos relacional organiza la información en tablas.

El XML puede:

- Descomponerse en filas y columnas.
- Guardarse como texto.
- Almacenarse en un tipo XML si el gestor lo admite.

### Conversión a tablas

Documento:

```xml
<obra id="O001">
  <titulo>Mareas de invierno</titulo>
  <artista>Elena Martín</artista>
  <anio>2018</anio>
</obra>
```

Representación relacional:

| id | titulo | artista | anio |
|---|---|---|---:|
| O001 | Mareas de invierno | Elena Martín | 2018 |

Esta conversión funciona bien cuando todos los registros presentan una estructura regular.

### Dificultades

XML puede contener:

- Elementos anidados.
- Colecciones de tamaño variable.
- Elementos opcionales.
- Contenido mixto.
- Orden significativo.

Una estructura jerárquica compleja puede necesitar muchas tablas y relaciones.

## 1.4. Bases de datos XML nativas

Una base de datos XML nativa almacena los documentos conservando su estructura de árbol.

```text
documento
└── coleccion
    ├── obra
    │   ├── titulo
    │   ├── artista
    │   └── tecnica
    └── obra
```

Estas bases suelen ofrecer:

- Colecciones de documentos.
- Índices de elementos, atributos y texto.
- Consultas XPath y XQuery.
- Actualizaciones controladas.
- Gestión de usuarios.
- Copias de seguridad.
- Acceso mediante API.

## 1.5. Bases orientadas a documentos

Las bases orientadas a documentos almacenan unidades completas, normalmente JSON o formatos similares.

Ejemplo conceptual:

```json
{
  "id": "O001",
  "titulo": "Mareas de invierno",
  "artista": "Elena Martín",
  "anio": 2018
}
```

Se adaptan bien a información semiestructurada, aunque su modelo y lenguajes de consulta no son idénticos a los de una base XML nativa.

## 1.6. Datos estructurados, semiestructurados y no estructurados

### Estructurados

Tienen un esquema fijo:

```text
Código | Fecha | Temperatura | Humedad
```

### Semiestructurados

Tienen organización, pero los registros pueden variar:

```xml
<obra>
  <titulo>...</titulo>
  <audioguia idioma="es">...</audioguia>
</obra>
```

Otra obra podría no tener audioguía.

### No estructurados

No siguen una estructura de campos claramente definida:

- Fotografías.
- Vídeos.
- Grabaciones.
- Texto libre.

## 1.7. Criterios para elegir

| Criterio | Pregunta |
|---|---|
| Volumen | ¿Cuántos documentos se almacenarán? |
| Estructura | ¿Los registros son regulares o jerárquicos? |
| Consultas | ¿Qué búsquedas se realizarán? |
| Concurrencia | ¿Cuántas personas accederán a la vez? |
| Integridad | ¿Se necesitan transacciones? |
| Seguridad | ¿Hay información sensible? |
| Intercambio | ¿Debe compartirse con otros sistemas? |
| Rendimiento | ¿Se necesitan índices? |

## 1.8. Metadatos

Los metadatos describen otros datos.

```xml
<documento>
  <metadatos>
    <creado>2026-11-18</creado>
    <autor>Departamento de Colecciones</autor>
    <version>3</version>
  </metadatos>
  <contenido>...</contenido>
</documento>
```

Pueden indicar:

- Autoría.
- Fecha de creación.
- Versión.
- Licencia.
- Idioma.
- Estado.
- Procedencia.

## 1.9. Integridad y copias de seguridad

Almacenar información implica protegerla.

Buenas prácticas:

- Validar antes de guardar.
- Mantener identificadores únicos.
- Controlar permisos.
- Realizar copias periódicas.
- Registrar cambios importantes.
- Probar la restauración.
- Separar copias y datos originales.

## 1.10. Actividades

1. Explica cuándo usarías archivos XML en lugar de una base de datos.
2. Indica dos dificultades de almacenar XML jerárquico en tablas.
3. Define base de datos XML nativa.
4. Diferencia datos estructurados y semiestructurados.
5. Propón metadatos para el archivo digital de un museo.

