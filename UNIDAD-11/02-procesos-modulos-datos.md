# 2. Procesos, módulos y datos empresariales

## 2.1. Pensar en procesos

Un proceso es una secuencia de actividades que transforma una entrada en un resultado. Un ERP no debe estudiarse como una colección de pantallas, sino como una herramienta que soporta procesos.

Ejemplo de venta:

```text
Contacto → oportunidad → presupuesto → pedido → entrega → factura → cobro
```

Cada transición puede requerir datos, permisos, comprobaciones y documentos.

## 2.2. Procesos transversales

Los procesos atraviesan departamentos:

### De compra a pago

```text
Necesidad → solicitud → pedido a proveedor → recepción → factura → pago
```

### De venta a cobro

```text
Oportunidad → oferta → pedido → entrega → factura → cobro
```

### De incidencia a solución

```text
Aviso → clasificación → asignación → intervención → validación → cierre
```

## 2.3. Módulos e integración

```text
CRM ──► Ventas ──► Inventario ──► Facturación
 │          │            │              │
 └──────── Contactos y productos ───────┘
```

Los módulos comparten información. Por ejemplo, una venta puede reservar existencias y generar una entrega y una factura.

## 2.4. Datos maestros

Los datos maestros describen entidades relativamente estables reutilizadas en muchos procesos:

- Clientes y proveedores.
- Productos y servicios.
- Tarifas e impuestos.
- Empleados y departamentos.
- Almacenes y ubicaciones.
- Cuentas contables.

Un dato maestro incorrecto afecta a numerosas operaciones.

## 2.5. Datos transaccionales

Representan hechos u operaciones:

- Presupuestos.
- Pedidos.
- Movimientos de almacén.
- Facturas y pagos.
- Partes de trabajo.
- Actividades comerciales.

Normalmente tienen fecha, estado, responsable y relación con datos maestros.

## 2.6. Datos de configuración

Definen el comportamiento:

- Secuencias de numeración.
- Monedas e idiomas.
- Políticas de facturación.
- Etapas de oportunidades.
- Reglas de reabastecimiento.
- Roles y permisos.
- Plantillas y automatizaciones.

Una mala configuración puede producir errores aunque los datos introducidos sean correctos.

## 2.7. Ciclo de vida de un documento

Un documento cambia de estado:

```text
Borrador → enviado → confirmado → completado
                       └─────────► cancelado
```

Cada cambio puede:

- Bloquear o permitir edición.
- Reservar recursos.
- Crear documentos relacionados.
- Registrar usuario y fecha.
- Lanzar notificaciones.

## 2.8. Trazabilidad

La trazabilidad permite responder:

- ¿Quién creó o modificó el registro?
- ¿Cuándo cambió de estado?
- ¿Qué documento originó la operación?
- ¿Qué entrega corresponde a una factura?
- ¿Qué lote llegó a un cliente?

No debe confundirse con vigilar indiscriminadamente a las personas. El registro debe responder a necesidades legítimas y respetar la normativa.

## 2.9. Calidad de datos

Dimensiones habituales:

- Exactitud.
- Completitud.
- Consistencia.
- Actualidad.
- Unicidad.
- Validez.

Ejemplo: un contacto duplicado con dos correos distintos afecta a campañas, informes e historial comercial.

## 2.10. Gobierno del dato

Debe definirse:

- Quién es responsable de cada dato.
- Quién puede crearlo, consultarlo y modificarlo.
- Reglas de nomenclatura y codificación.
- Campos obligatorios.
- Procedimiento de corrección y deduplicación.
- Tiempo de conservación.
- Condiciones de archivo o eliminación.

## 2.11. Automatización

Una automatización puede ahorrar tiempo, pero debe diseñarse con controles:

```text
Si una oportunidad supera 10.000 €
→ solicitar aprobación de dirección
→ registrar la decisión
→ continuar o devolver a revisión
```

Automatizar un proceso defectuoso puede multiplicar sus errores.

## 2.12. Ejemplo de modelo de datos conceptual

```text
Cliente 1 ── N Oportunidad
Cliente 1 ── N Pedido
Pedido  1 ── N Línea de pedido
Producto 1 ── N Línea de pedido
Pedido  1 ── N Factura
```

El ERP puede implementar un modelo mucho más complejo, pero esta representación ayuda a comprender las relaciones.

## 2.13. Actividades

1. Distingue datos maestros, transaccionales y de configuración.
2. Diseña estados para una solicitud de mantenimiento.
3. Define reglas de calidad para contactos y productos.
4. Identifica módulos implicados en una venta.
5. Propón una automatización con control y trazabilidad.

