# 9. Práctica guiada: empresa de alquiler y reparación de bicicletas

## 9.1. Escenario

La empresa ficticia **Viento Norte Bicicletas** alquila bicicletas, vende accesorios y ofrece reparaciones. Actualmente utiliza hojas de cálculo separadas. Se implantará un entorno didáctico para gestionar contactos, productos, oportunidades y ventas.

## 9.2. Objetivos

- Desplegar Odoo y PostgreSQL con Docker Compose.
- Crear y documentar una base de formación.
- Configurar empresa, usuarios y permisos.
- Crear o importar contactos y productos.
- Diseñar un pipeline comercial.
- Registrar una oportunidad y convertirla en presupuesto.
- Exportar información controlada.
- Realizar y comprobar una copia de seguridad.
- Definir indicadores y medidas de protección de datos.

## 9.3. Estructura del repositorio

```text
viento-norte-erp/
├── README.md
├── compose.yaml
├── config/
│   └── odoo.conf.example
├── datos/
│   ├── contactos.csv
│   └── productos.csv
├── docs/
│   ├── requisitos.md
│   ├── permisos.md
│   ├── procesos.md
│   ├── copias.md
│   └── proteccion-datos.md
├── img/
│   └── capturas.png
└── copias/
    └── README.md
```

No se suben contraseñas, datos reales ni copias completas al repositorio público.

## 9.4. Requisitos

En `docs/requisitos.md`:

```markdown
# Requisitos

## Funcionales

- RF-01. Registrar clientes particulares y organizaciones.
- RF-02. Gestionar oportunidades de alquiler para grupos.
- RF-03. Crear presupuestos de alquiler, reparación y accesorios.
- RF-04. Consultar productos y servicios.
- RF-05. Asignar oportunidades a comerciales.

## No funcionales

- RNF-01. Cada persona utilizará una cuenta individual.
- RNF-02. Los permisos seguirán el principio de menor privilegio.
- RNF-03. Se documentará una copia y una restauración de prueba.
- RNF-04. La base de aula no contendrá datos personales reales.
```

## 9.5. Despliegue

Utiliza el `compose.yaml` explicado en el capítulo 4 y crea `odoo.conf` local a partir de `odoo.conf.example`.

```bash
docker compose config
docker compose pull
docker compose up -d
docker compose ps
docker compose logs --tail=100 odoo
```

Accede a:

```text
http://localhost:8069
```

Crea una base llamada de forma inequívoca:

```text
viento_norte_formacion
```

No uses una contraseña real en las capturas o documentación.

## 9.6. Aplicaciones

Instala únicamente las necesarias para el ejercicio:

- Contactos.
- CRM.
- Ventas.
- Inventario, si se trabajará con accesorios almacenables.

Cada módulo añadido amplía configuración, datos y mantenimiento. No se instalan aplicaciones sin objetivo.

## 9.7. Empresa

Configura:

- Nombre: Viento Norte Bicicletas.
- Moneda: EUR.
- Idioma: español.
- Zona horaria: Atlantic/Canary.
- Dirección y datos fiscales ficticios.

Captura la pantalla sin mostrar credenciales.

## 9.8. Usuarios y permisos

Crea cuentas ficticias:

| Usuario | Rol | Acceso esperado |
|---|---|---|
| comercial.aula | Comercial | CRM y ventas propias |
| responsable.aula | Responsable | CRM y ventas del equipo |
| taller.aula | Taller | Productos y operaciones necesarias |
| admin.aula | Administración técnica | Configuración limitada al ejercicio |

En `docs/permisos.md`, incluye una matriz y pruebas realizadas con cada cuenta. No basta con capturar la configuración desde la cuenta administradora.

## 9.9. Contactos CSV

`datos/contactos.csv`:

```csv
referencia,nombre,tipo,correo,telefono
C001,Club Pedal Norte,empresa,info@pedal.example,922000001
C002,Asociación Costa Azul,empresa,contacto@costa.example,922000002
C003,Marina Suárez,persona,marina@example.org,922000003
C004,Daniel León,persona,daniel@example.org,922000004
```

Todos los datos son ficticios y utilizan el dominio reservado `.example`.

Antes de importar:

1. Revisar separador y codificación UTF-8.
2. Mapear columnas.
3. Ejecutar la prueba de importación.
4. Corregir incidencias.
5. Importar.
6. Verificar cuatro registros y referencias.

## 9.10. Productos CSV

```csv
referencia,nombre,tipo,precio,categoria
ALQ-URBANA,Alquiler bicicleta urbana,servicio,18.00,Alquiler
ALQ-ELECTRICA,Alquiler bicicleta eléctrica,servicio,38.00,Alquiler
REP-FRENO,Ajuste de frenos,servicio,22.00,Taller
REP-REVISION,Revisión general,servicio,45.00,Taller
ACC-CASCO,Casco urbano,producto,35.00,Accesorios
ACC-LUZ,Juego de luces,producto,19.50,Accesorios
```

Comprueba tipos de producto, precios, categorías e impuestos de aula.

## 9.11. Pipeline CRM

Configura etapas:

```text
Nueva consulta → Necesidad confirmada → Presupuesto enviado
→ Negociación → Ganada / Perdida
```

Documenta en `docs/procesos.md` qué condición permite pasar a cada etapa.

## 9.12. Oportunidades

Crea al menos tres:

| Oportunidad | Cliente | Importe esperado | Estado inicial |
|---|---|---:|---|
| Ruta escolar de fin de curso | Club Pedal Norte | 1.800 € | Necesidad confirmada |
| Alquiler corporativo | Asociación Costa Azul | 2.400 € | Presupuesto enviado |
| Revisión de flota | Cliente ficticio | 750 € | Nueva consulta |

Cada oportunidad debe tener:

- Comercial.
- Fecha prevista.
- Próxima actividad.
- Notas pertinentes y profesionales.
- Probabilidad coherente con la etapa.

## 9.13. Ciclo comercial

Con «Alquiler corporativo»:

1. Revisa contacto y necesidad.
2. Programa seguimiento.
3. Crea presupuesto con 25 alquileres urbanos y accesorios.
4. Comprueba cantidades, precios e impuestos.
5. Simula aceptación en el entorno de formación.
6. Marca la oportunidad como ganada.
7. Verifica vínculos entre cliente, oportunidad, presupuesto y pedido.

No se emiten documentos reales ni se envían correos fuera del entorno de prueba.

## 9.14. Motivo de pérdida

Cierra otra oportunidad como perdida y utiliza un motivo normalizado, por ejemplo:

- Sin disponibilidad en la fecha.
- Presupuesto insuficiente.
- Necesidad aplazada.
- Eligió otra solución.

No se deben escribir valoraciones personales sobre el contacto.

## 9.15. Exportación

Exporta únicamente:

- Referencia.
- Nombre de oportunidad.
- Etapa.
- Ingreso esperado.
- Responsable.

Guarda el archivo solo durante la comprobación y explica en el README por qué una exportación debe protegerse y eliminarse cuando deja de ser necesaria.

## 9.16. Copia de seguridad

Antes de actuar:

- Confirma que es la base de formación.
- Crea la carpeta `copias/` fuera de control de versiones cuando contenga archivos reales.
- Registra fecha, versión y responsable.
- Incluye base y filestore.

Puede utilizarse el gestor de bases del entorno local o procedimientos documentados de PostgreSQL y volúmenes. La copia debe restaurarse en una base aislada de prueba.

En `docs/copias.md`:

```markdown
# Prueba de copia y restauración

- Fecha:
- Versión de Odoo:
- Base de origen:
- Formato:
- Ubicación protegida:
- Base de restauración:
- Tiempo empleado:
- Contactos comprobados:
- Oportunidades comprobadas:
- Adjuntos comprobados:
- Resultado:
- Incidencias:
```

Una captura del mensaje «copia completada» no demuestra que pueda restaurarse.

## 9.17. Protección de datos

En `docs/proteccion-datos.md`:

- Finalidad del tratamiento.
- Categorías mínimas de datos.
- Roles con acceso.
- Conservación orientativa que tendría que aprobar la organización.
- Riesgos y medidas.
- Procedimiento de baja o rectificación.
- Gestión de exportaciones.
- Diferencia entre datos de aula y producción.

## 9.18. Indicadores

Calcula o consulta:

- Número de oportunidades abiertas.
- Valor total esperado.
- Ingreso ponderado.
- Oportunidades ganadas y perdidas.
- Actividades pendientes y vencidas.
- Motivos de pérdida.

Para cada indicador explica fórmula, fuente y limitación.

## 9.19. README

Debe contener:

- Descripción y alcance.
- Arquitectura del laboratorio.
- Requisitos previos.
- Instrucciones de arranque y parada.
- Aplicaciones instaladas.
- Usuarios y roles, sin contraseñas.
- Datos importados.
- Proceso comercial probado.
- Copia y restauración.
- Protección de datos.
- Capturas sin información sensible.
- Problemas y soluciones.

## 9.20. Comprobaciones

- [ ] `docker compose config` no muestra errores.
- [ ] Los servicios están activos.
- [ ] Los datos persisten tras recrear contenedores.
- [ ] La base está identificada como formación.
- [ ] No hay datos ni contraseñas reales.
- [ ] Los permisos se prueban con cada usuario.
- [ ] Contactos y productos se importan correctamente.
- [ ] El pipeline tiene criterios documentados.
- [ ] La oportunidad se vincula con presupuesto y pedido.
- [ ] La exportación contiene solo campos necesarios.
- [ ] La copia incluye datos y archivos.
- [ ] La restauración ha sido verificada.
- [ ] Los indicadores incluyen fórmula y limitaciones.
- [ ] El repositorio no contiene secretos ni copias de la base.

## 9.21. Propuesta de evaluación

| Criterio | Peso orientativo |
|---|---:|
| Análisis y documentación de procesos | 15 % |
| Despliegue y persistencia | 15 % |
| Configuración, usuarios y permisos | 15 % |
| Datos maestros e importación | 15 % |
| CRM y ciclo comercial | 15 % |
| Copia, restauración y seguridad | 15 % |
| Protección de datos, indicadores y README | 10 % |

