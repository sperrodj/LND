# 8. Seguridad, copias, protección de datos y análisis

## 8.1. Seguridad por capas

Un ERP concentra información sensible y operaciones críticas. La seguridad incluye:

- Personas y procedimientos.
- Identidades y permisos.
- Aplicación y configuración.
- Sistema, contenedores y base de datos.
- Red y cifrado.
- Copias y recuperación.
- Monitorización y respuesta.

## 8.2. Controles de acceso

- Cuentas individuales.
- Contraseñas robustas y autenticación multifactor cuando esté disponible.
- Menor privilegio.
- Revisión periódica de permisos.
- Baja inmediata de cuentas que ya no proceden.
- Separación de funciones.
- Sesiones y dispositivos controlados.
- Registro de acciones relevantes.

## 8.3. Actualizaciones

Actualizar reduce vulnerabilidades, pero un cambio sin pruebas puede interrumpir el servicio.

Procedimiento:

1. Revisar notas y compatibilidad.
2. Realizar copia.
3. Probar en un entorno separado.
4. Planificar ventana y reversión.
5. Aplicar.
6. Ejecutar pruebas funcionales.
7. Monitorizar.

Una actualización de versión mayor de ERP suele requerir un proyecto de migración, no solo sustituir la imagen.

## 8.4. Copias de seguridad

Una copia completa de Odoo debe contemplar:

- Base PostgreSQL.
- Filestore y adjuntos.
- Configuración necesaria.
- Addons propios.
- Información de versión.

Copiar solo la base puede dejar documentos sin sus archivos.

## 8.5. Estrategia 3-2-1

Como referencia general:

- Tres copias de los datos.
- Dos tipos de soporte o ubicaciones independientes.
- Una copia fuera del entorno principal.

Debe adaptarse a riesgos, normativa y necesidades reales.

## 8.6. RPO y RTO

- **RPO:** pérdida máxima de datos asumible medida en tiempo.
- **RTO:** tiempo máximo para restaurar el servicio.

Ejemplo:

```text
RPO de 4 horas → copias o réplica con frecuencia suficiente.
RTO de 8 horas → procedimiento, infraestructura y personal para recuperar antes.
```

## 8.7. Una copia no existe hasta probarla

Prueba de restauración:

1. Seleccionar una copia.
2. Restaurar en entorno aislado.
3. Verificar usuarios, registros y adjuntos.
4. Ejecutar operaciones representativas.
5. Medir tiempo.
6. Documentar resultado e incidencias.

## 8.8. Protección de datos

Principios aplicables al tratamiento:

- Licitud, lealtad y transparencia.
- Limitación de la finalidad.
- Minimización.
- Exactitud.
- Limitación del plazo de conservación.
- Integridad y confidencialidad.
- Responsabilidad proactiva.

No debe recopilarse información simplemente porque el ERP disponga de un campo para guardarla.

## 8.9. Privacidad desde el diseño y por defecto

- Recoger el mínimo de campos.
- Limitar accesos desde el inicio.
- Definir plazos de conservación.
- Evitar datos reales en pruebas.
- Pseudonimizar o anonimizar cuando proceda.
- Informar y gestionar derechos.
- Evaluar proveedores y encargados.
- Preparar gestión de brechas.

El cumplimiento requiere análisis jurídico y organizativo; una configuración técnica por sí sola no lo garantiza.

## 8.10. Indicadores

Un indicador debe tener:

- Objetivo.
- Fórmula.
- Fuente.
- Frecuencia.
- Responsable.
- Interpretación y límites.

Ejemplos:

```text
Tasa de conversión = oportunidades ganadas / oportunidades cerradas × 100
Rotación = salidas del periodo / inventario medio
Plazo medio de cobro = promedio de días hasta el pago
```

## 8.11. Cuadros de mando

Un buen cuadro:

- Responde a preguntas concretas.
- Presenta pocos indicadores relevantes.
- Permite conocer periodo y filtros.
- No mezcla magnitudes incompatibles.
- Ofrece detalle cuando hace falta.
- Mantiene permisos sobre datos sensibles.

## 8.12. Interpretación crítica

- Correlación no implica causalidad.
- Los datos incompletos producen indicadores engañosos.
- Una media puede ocultar valores extremos.
- Un objetivo mal elegido puede incentivar comportamientos contraproducentes.
- Los paneles no sustituyen conocimiento del proceso.

## 8.13. Plan de continuidad

Debe responder:

- ¿Qué procesos son críticos?
- ¿Quién declara la incidencia?
- ¿Cómo se trabaja temporalmente?
- ¿Dónde están copias y credenciales de emergencia?
- ¿Quién puede restaurar?
- ¿Cómo se valida la recuperación?
- ¿Cómo se comunica?

## 8.14. Lista de auditoría

- [ ] Cuentas individuales y permisos revisados.
- [ ] Administradores mínimos.
- [ ] Actualizaciones planificadas.
- [ ] Copias de base, archivos y configuración.
- [ ] Restauración probada.
- [ ] RPO y RTO definidos.
- [ ] Datos de prueba anonimizados.
- [ ] Conservación y eliminación documentadas.
- [ ] Exportaciones controladas.
- [ ] Incidentes y brechas con procedimiento.
- [ ] Indicadores con fórmula y fuente.

## 8.15. Actividades

1. Diseña una política de copias con RPO y RTO.
2. Prepara una prueba de restauración.
3. Aplica minimización a una ficha de contacto.
4. Define tres indicadores con fórmula.
5. Analiza un cuadro de mando que premie solo el volumen de llamadas.

