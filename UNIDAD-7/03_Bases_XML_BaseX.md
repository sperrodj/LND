# 3. Bases de datos XML y BaseX

## 3.1. ¿Qué es BaseX?

BaseX es un sistema gestor de bases de datos XML nativo. Permite:

- Almacenar documentos XML.
- Crear bases con varios documentos.
- Consultar mediante XPath y XQuery.
- Crear índices.
- Actualizar nodos.
- Utilizar una interfaz gráfica, consola o servidor.

## 3.2. Componentes

### BaseX GUI

Interfaz gráfica para crear bases, editar consultas y visualizar resultados.

### BaseX

Consola interactiva:

```bash
basex
```

### BaseXClient

Cliente para conectarse a un servidor BaseX.

### BaseXServer

Proceso servidor para acceso remoto.

## 3.3. Documento de ejemplo

Usaremos una red de transporte:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<red nombre="Movilidad Insular">
  <linea id="L101" tipo="guagua">
    <nombre>Norte Express</nombre>
    <origen>Puerto de la Cruz</origen>
    <destino>Santa Cruz</destino>
    <duracion unidad="min">55</duracion>
    <paradas>
      <parada orden="1">La Orotava</parada>
      <parada orden="2">La Laguna</parada>
    </paradas>
  </linea>

  <linea id="L202" tipo="tranvia">
    <nombre>Metropolitana</nombre>
    <origen>La Laguna</origen>
    <destino>Santa Cruz</destino>
    <duracion unidad="min">40</duracion>
    <paradas>
      <parada orden="1">Hospital Universitario</parada>
      <parada orden="2">La Cuesta</parada>
    </paradas>
  </linea>

  <linea id="L303" tipo="guagua">
    <nombre>Ruta Sur</nombre>
    <origen>Los Cristianos</origen>
    <destino>Aeropuerto Sur</destino>
    <duracion unidad="min">25</duracion>
    <paradas>
      <parada orden="1">Las Chafiras</parada>
    </paradas>
  </linea>
</red>
```

Guarda el archivo como `red-transporte.xml`.

## 3.4. Crear una base desde la interfaz

En BaseX GUI:

1. Abre **Database → New**.
2. Selecciona `red-transporte.xml`.
3. Escribe `movilidad` como nombre.
4. Activa el análisis del documento si aparece disponible.
5. Confirma la creación.

El nombre de la base:

- No debe contener espacios.
- Debe ser descriptivo.
- No tiene que coincidir con el archivo.

## 3.5. Crear una base desde consola

En la consola interactiva:

```text
CREATE DB movilidad red-transporte.xml
```

Desde una única orden:

```bash
basex -c "CREATE DB movilidad red-transporte.xml"
```

Abrir la base:

```text
OPEN movilidad
```

Mostrar información:

```text
INFO DB
```

Listar bases:

```text
LIST
```

Cerrar:

```text
CLOSE
```

## 3.6. Consultar documentos

Con la base abierta:

```xquery
/red/linea/nombre
```

Acceso explícito:

```xquery
db:get("movilidad")
```

Seleccionar líneas:

```xquery
db:get("movilidad")/red/linea
```

Con versiones antiguas de BaseX puede encontrarse `db:open()` en lugar de `db:get()`.

## 3.7. Consultas iniciales

### Nombres

```xquery
db:get("movilidad")/red/linea/nombre
```

### Identificadores

```xquery
db:get("movilidad")/red/linea/@id
```

### Líneas de guagua

```xquery
db:get("movilidad")/red/linea[@tipo = "guagua"]
```

### Duración inferior a 45 minutos

```xquery
db:get("movilidad")/red/linea[duracion < 45]/nombre
```

### Líneas que pasan por La Laguna

```xquery
db:get("movilidad")/red/linea[
  origen = "La Laguna"
  or destino = "La Laguna"
  or paradas/parada = "La Laguna"
]/nombre
```

## 3.8. Añadir documentos

Con la base abierta:

```text
ADD horarios.xml
```

Especificando una ruta interna:

```text
ADD TO datos/horarios.xml horarios.xml
```

BaseX puede guardar varios documentos y mantener rutas dentro de una base.

## 3.9. Eliminar recursos

```text
DELETE datos/horarios.xml
```

Eliminar una base completa:

```text
DROP DB movilidad
```

Estas operaciones son destructivas. Antes de ejecutarlas debe comprobarse el nombre y conservar una copia si es necesario.

## 3.10. Índices

Los índices mejoran determinadas consultas.

BaseX puede mantener índices de:

- Texto.
- Atributos.
- Nombres de elementos.
- Texto completo.

Consultar opciones:

```text
INFO INDEX
```

Un índice:

- Acelera búsquedas.
- Ocupa espacio.
- Debe actualizarse cuando cambian los datos.
- No mejora todas las consultas por igual.

## 3.11. Colecciones y documentos

Funciones útiles:

```xquery
collection("movilidad")
```

```xquery
db:get("movilidad")
```

```xquery
db:list("movilidad")
```

`collection()` obtiene los documentos de una colección. Las funciones del módulo `db` permiten operaciones específicas de BaseX.

## 3.12. Ejecutar consultas guardadas

Guarda una consulta como `consulta.xq`:

```xquery
xquery version "3.1";

for $linea in db:get("movilidad")/red/linea
return $linea/nombre
```

Ejecútala:

```bash
basex consulta.xq
```

## 3.13. Copias de seguridad

Desde consola:

```text
CREATE BACKUP movilidad
```

Listar copias:

```text
LIST BACKUPS
```

Restaurar:

```text
RESTORE movilidad
```

Las copias deben probarse. Una copia que nunca se ha restaurado no ofrece una garantía completa.

## 3.14. Buenas prácticas

- Utilizar nombres de bases descriptivos.
- Validar documentos antes de importarlos.
- Mantener identificadores únicos.
- Documentar la estructura.
- Crear copias antes de actualizaciones masivas.
- Evitar trabajar siempre con permisos de administrador.
- No almacenar contraseñas en XML público.
- Revisar las consultas antes de modificar datos.

## 3.15. Actividades

1. Crea la base `movilidad`.
2. Obtén las tres líneas.
3. Muestra las líneas cuyo destino sea Santa Cruz.
4. Cuenta las líneas de guagua.
5. Obtén todas las paradas sin repetir.
6. Realiza una copia de seguridad.

