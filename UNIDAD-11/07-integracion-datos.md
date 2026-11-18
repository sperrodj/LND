# 7. Importación, exportación e integración

## 7.1. Por qué integrar

Un ERP rara vez funciona aislado. Puede relacionarse con:

- Comercio electrónico.
- Bancos y pasarelas de pago.
- Transportistas.
- Correo y calendario.
- Plataformas fiscales.
- Herramientas de BI.
- Aplicaciones propias.
- Proveedores y clientes.

## 7.2. Métodos

| Método | Uso |
|---|---|
| Importación CSV/XLSX | Cargas iniciales o periódicas controladas |
| Exportación | Análisis, migración o intercambio |
| API | Comunicación estructurada entre aplicaciones |
| Webhook | Notificación ante un evento |
| ETL/ELT | Integración y transformación de grandes conjuntos |
| Automatización | Conexión mediante plataforma intermedia |

## 7.3. Importación CSV

Ejemplo de contactos:

```csv
referencia,nombre,tipo,correo,telefono
C001,Club Pedal Norte,empresa,info@pedal.example,922000001
C002,Marina Suárez,persona,marina@example.org,922000002
```

Antes de importar:

1. Descargar una plantilla o exportar una muestra.
2. Definir identificadores estables.
3. Normalizar formatos.
4. Eliminar duplicados.
5. Validar campos obligatorios.
6. Probar con pocas filas.
7. Revisar el resultado.
8. Conservar registro del archivo y fecha.

## 7.4. Identificadores

Los nombres pueden repetirse o cambiar. Para actualizar datos se necesita una clave estable:

- Identificador externo.
- Código interno.
- Clave proporcionada por el sistema.
- Identificador fiscal, solo cuando sea legítimo y adecuado.

No debe usarse el correo como clave universal sin analizar el proceso.

## 7.5. Relaciones

Para importar oportunidades vinculadas a contactos:

```csv
referencia,titulo,cliente_referencia,ingreso
OP001,Alquiler evento escolar,C001,2400
```

El contacto `C001` debe existir o crearse de forma controlada. Una carga correcta sintácticamente puede dejar relaciones equivocadas si el mapeo no se comprueba.

## 7.6. Validación posterior

- Número de filas importadas y rechazadas.
- Duplicados.
- Campos obligatorios.
- Relaciones.
- Totales económicos.
- Fechas, zonas horarias y monedas.
- Muestras manuales.
- Informe de errores.

## 7.7. Exportación

Antes de exportar:

- Definir finalidad.
- Seleccionar solo campos necesarios.
- Comprobar permisos.
- Proteger el archivo.
- Establecer conservación y eliminación.
- Evitar compartir por canales inadecuados.

Una exportación puede eludir controles del sistema y crear una nueva copia de datos personales.

## 7.8. API

Conceptos:

- Endpoint.
- Método u operación.
- Autenticación.
- Parámetros.
- Cuerpo de solicitud.
- Respuesta.
- Código de estado.
- Límite de solicitudes.
- Versionado.

Ejemplo conceptual:

```json
{
  "cliente": "C001",
  "productos": [
    { "codigo": "ALQ-BICI-URBANA", "cantidad": 25 }
  ],
  "fecha": "2027-03-18"
}
```

## 7.9. Autenticación y secretos

- No incluir claves en repositorios.
- Utilizar cuentas técnicas separadas.
- Otorgar permisos mínimos.
- Rotar credenciales.
- Registrar y revisar uso.
- Cifrar comunicaciones.
- Revocar accesos que ya no se necesiten.

## 7.10. Sincronización

Debe decidirse:

- Sistema maestro de cada dato.
- Dirección del flujo.
- Frecuencia.
- Resolución de conflictos.
- Reintentos.
- Idempotencia.
- Registro y alertas.

Una integración bidireccional sin sistema maestro puede sobrescribir cambios de forma imprevisible.

## 7.11. Idempotencia

Una operación idempotente puede repetirse sin duplicar el efecto esperado. Si una solicitud se reintenta por un fallo de red, debe evitarse crear dos pedidos.

Posibles mecanismos:

- Identificador externo único.
- Clave de idempotencia.
- Comprobación previa.
- Restricción de unicidad.

## 7.12. Errores e incidencias

Una integración necesita:

- Logs comprensibles.
- Estado de cada operación.
- Cola de errores o registros pendientes.
- Reintentos limitados.
- Alertas.
- Procedimiento manual de corrección.

## 7.13. Actividades

1. Diseña un CSV de productos con identificadores.
2. Define validaciones previas y posteriores.
3. Decide el sistema maestro en una integración.
4. Explica cómo evitar pedidos duplicados.
5. Analiza el riesgo de exportar contactos a una hoja de cálculo.

