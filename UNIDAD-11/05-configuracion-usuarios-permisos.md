# 5. Configuración, usuarios y permisos

## 5.1. Configurar antes de operar

La configuración inicial define cómo se registrarán las operaciones. Debe documentarse y probarse antes de introducir datos reales.

Elementos habituales:

- Empresa, dirección e identificación fiscal.
- Idioma, zona horaria y moneda.
- Aplicaciones o módulos.
- Equipos y departamentos.
- Usuarios, grupos y permisos.
- Productos, servicios, categorías y tarifas.
- Etapas, secuencias y plantillas.

## 5.2. Base de datos de formación

Para el aula:

- Utilizar una empresa ficticia.
- No introducir datos reales de clientes.
- No enviar correos a direcciones reales.
- Marcar claramente la base como formación.
- Mantener un procedimiento para reiniciarla.

## 5.3. Usuarios, grupos y roles

Un usuario representa una identidad concreta. Un grupo reúne permisos. Un rol empresarial describe responsabilidades y puede corresponder a varios grupos.

Ejemplo:

| Rol | Necesidades |
|---|---|
| Comercial | Contactos, oportunidades y presupuestos propios |
| Responsable comercial | Visión del equipo, reasignación e informes |
| Almacén | Productos, existencias y movimientos |
| Administración | Facturación y cobros |
| Administrador técnico | Configuración y mantenimiento |

## 5.4. Menor privilegio

Cada persona debe disponer solo de los accesos necesarios para sus funciones.

Beneficios:

- Reduce errores accidentales.
- Limita el impacto de una cuenta comprometida.
- Protege información sensible.
- Mejora la separación de funciones.

No debe compartirse una única cuenta de administrador entre toda la organización.

## 5.5. Separación de funciones

Para operaciones sensibles puede evitarse que una persona complete todo el proceso:

```text
Persona A crea proveedor
Persona B aprueba pedido
Persona C registra pago
```

La separación debe ser proporcional al riesgo y al tamaño de la organización.

## 5.6. Matriz de permisos

| Recurso | Comercial | Responsable | Administración |
|---|---:|---:|---:|
| Contactos | Lectura/escritura limitada | Completo | Lectura |
| Oportunidades | Propias | Equipo | Lectura |
| Presupuestos | Crear | Aprobar | Consultar |
| Facturas | Sin acceso | Lectura | Crear/validar |
| Configuración | Sin acceso | Sin acceso | Limitada |

La matriz se traduce después a grupos, reglas de registro y permisos de modelo.

## 5.7. Datos maestros

Antes de crear productos o contactos se definen reglas:

- Código único.
- Nombre normalizado.
- Campos obligatorios.
- Categorías permitidas.
- Responsable de altas y modificaciones.
- Procedimiento de duplicados.

Ejemplo de código:

```text
ALQ-BICI-URBANA
REP-FRENO
ACC-CASCO
```

## 5.8. Contactos

Un contacto puede representar una persona o una organización. Debe evitarse recopilar información «por si acaso».

Campos posibles:

- Nombre o razón social.
- Identificación fiscal cuando sea necesaria.
- Correo y teléfono.
- Dirección de facturación o entrega.
- Idioma.
- Comercial responsable.
- Etiquetas justificadas.

## 5.9. Productos y servicios

Decisiones:

- Producto almacenable, consumible o servicio.
- Unidad de medida.
- Precio de venta y coste.
- Impuestos.
- Categoría.
- Política de facturación.
- Seguimiento de lote o serie si corresponde.

## 5.10. Entornos y cambios

Una organización madura separa:

- Desarrollo.
- Pruebas.
- Producción.

Un cambio se documenta, prueba, aprueba, aplica y revisa. No se experimenta directamente con procesos críticos en producción.

## 5.11. Auditoría de configuración

Lista inicial:

- [ ] Empresa y localización correctas.
- [ ] Usuarios nominativos.
- [ ] Administradores mínimos.
- [ ] Permisos probados con cada rol.
- [ ] Datos maestros sin duplicados.
- [ ] Secuencias y estados definidos.
- [ ] Correos de prueba controlados.
- [ ] Cambios documentados.

## 5.12. Actividades

1. Diseña cuatro roles para una empresa pequeña.
2. Construye una matriz de permisos.
3. Define una nomenclatura de productos.
4. Detecta permisos excesivos en un caso propuesto.
5. Explica por qué probar con una cuenta administradora no valida los permisos reales.

