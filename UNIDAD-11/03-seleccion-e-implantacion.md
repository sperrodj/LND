# 3. Selección e implantación de una solución

## 3.1. El error de empezar por el producto

Antes de elegir una herramienta se deben entender objetivos, procesos, datos, personas y restricciones. Una demostración atractiva no demuestra que la solución encaje.

## 3.2. Análisis inicial

Preguntas:

- ¿Qué problema se intenta resolver?
- ¿Qué procesos se incluyen y cuáles quedan fuera?
- ¿Cuántas personas usarán el sistema y con qué perfiles?
- ¿Qué volumen de operaciones existe?
- ¿Qué datos deben migrarse?
- ¿Qué sistemas necesitan integrarse?
- ¿Qué obligaciones legales o sectoriales existen?
- ¿Qué disponibilidad y tiempos de recuperación se necesitan?
- ¿Qué presupuesto y plazo son realistas?

## 3.3. Requisitos

### Funcionales

Describen lo que debe hacer:

```text
RF-01. El sistema debe permitir registrar oportunidades y asignarlas a un comercial.
RF-02. El sistema debe generar presupuestos a partir de productos y tarifas.
```

### No funcionales

Describen cualidades o restricciones:

```text
RNF-01. El acceso debe utilizar conexión cifrada.
RNF-02. La recuperación de una copia debe probarse trimestralmente.
RNF-03. La interfaz debe estar disponible en español.
```

### Restricciones

```text
RES-01. Debe integrarse con el sistema contable existente.
RES-02. Los datos deben alojarse en el Espacio Económico Europeo.
```

## 3.4. Priorización

Método MoSCoW:

- **Must:** imprescindible.
- **Should:** importante, pero existe alternativa temporal.
- **Could:** deseable.
- **Won't for now:** fuera de alcance actual.

La priorización evita convertir todos los deseos en requisitos críticos.

## 3.5. Coste total de propiedad

No incluye solo licencias:

- Implantación y consultoría.
- Infraestructura o suscripción.
- Migración y limpieza de datos.
- Integraciones.
- Personalizaciones.
- Formación.
- Soporte y actualizaciones.
- Seguridad y copias.
- Tiempo del personal interno.
- Coste de salida o cambio futuro.

## 3.6. Matriz de evaluación

| Criterio | Peso | Solución A | Solución B |
|---|---:|---:|---:|
| Cobertura funcional | 30 % | 4 | 3 |
| Integración | 20 % | 3 | 5 |
| Coste total | 15 % | 4 | 2 |
| Usabilidad | 15 % | 3 | 4 |
| Soporte | 10 % | 4 | 4 |
| Portabilidad de datos | 10 % | 3 | 5 |

Las puntuaciones deben basarse en pruebas y evidencias, no solo en material comercial.

## 3.7. Prueba de concepto

Una prueba de concepto debe utilizar escenarios representativos:

1. Importar contactos reales anonimizados o datos de prueba equivalentes.
2. Crear una oportunidad.
3. Convertirla en presupuesto.
4. Aplicar permisos por roles.
5. Generar un informe.
6. Exportar datos.
7. Probar una integración crítica.

## 3.8. Estrategias de implantación

### Cambio total

Todo el sistema entra en funcionamiento en una fecha. Es rápido, pero concentra el riesgo.

### Por fases

Se implantan módulos, departamentos o sedes progresivamente. Reduce el impacto, aunque exige convivir con sistemas diferentes.

### Piloto

Un grupo controlado prueba procesos antes de ampliar el alcance.

### Paralelo

Sistema antiguo y nuevo funcionan simultáneamente durante un tiempo. Aporta comparación, pero duplica trabajo y puede crear divergencias.

## 3.9. Fases del proyecto

```text
Diagnóstico → diseño → configuración → migración → pruebas
→ formación → puesta en marcha → soporte → mejora continua
```

## 3.10. Migración

Proceso ETL simplificado:

```text
Extraer → limpiar y transformar → validar → cargar → reconciliar
```

No basta con que la importación termine sin error. Deben compararse totales, muestras, relaciones y reglas de negocio.

## 3.11. Gestión del cambio

- Comunicar motivo y alcance.
- Involucrar usuarios clave.
- Formar por tareas y roles.
- Preparar manuales y soporte.
- Recoger incidencias.
- Medir adopción.
- Evitar culpabilizar a las personas por problemas de diseño.

## 3.12. Criterios de aceptación

```text
Dado un comercial con permisos de ventas,
cuando confirma un presupuesto válido,
entonces se crea el pedido y queda vinculado al cliente.
```

Los criterios deben ser observables y comprobables.

## 3.13. Actividades

1. Redacta cinco requisitos funcionales y cinco no funcionales.
2. Priorízalos con MoSCoW.
3. Diseña una matriz con criterios y pesos.
4. Compara implantación total y por fases.
5. Define pruebas de aceptación para un ciclo comercial.

