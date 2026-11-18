# 4. Arquitectura, despliegue y Odoo

## 4.1. Arquitectura general

Una aplicación empresarial web suele incluir:

```text
Navegador → servidor de aplicación → base de datos
                    │
                    ├── archivos adjuntos
                    ├── correo
                    └── servicios externos
```

En Odoo, PostgreSQL almacena los datos estructurados y el *filestore* conserva archivos asociados a la base de datos.

## 4.2. Formas de utilizar Odoo

- Servicio en línea gestionado.
- Plataforma gestionada para desarrollo y despliegue.
- Instalación mediante paquetes.
- Instalación desde código fuente.
- Imagen Docker.

La elección depende de finalidad, control, soporte y conocimientos disponibles.

## 4.3. Contenedores

Un contenedor empaqueta una aplicación y sus dependencias, pero no es una máquina virtual completa. Docker Compose permite definir varios servicios relacionados mediante YAML.

En el laboratorio:

- Servicio `odoo`: aplicación.
- Servicio `db`: PostgreSQL.
- Volumen `odoo-data`: datos de aplicación y filestore.
- Volumen `db-data`: base de datos.

## 4.4. Estructura del laboratorio

```text
odoo-laboratorio/
├── compose.yaml
├── config/
│   └── odoo.conf
├── addons/
└── copias/
```

No se deben guardar contraseñas reales en un repositorio público.

## 4.5. `compose.yaml` didáctico

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_DB: postgres
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: odoo-aula
    volumes:
      - db-data:/var/lib/postgresql/data
    restart: unless-stopped

  odoo:
    image: odoo:19.0
    depends_on:
      - db
    ports:
      - "8069:8069"
    environment:
      HOST: db
      USER: odoo
      PASSWORD: odoo-aula
    volumes:
      - odoo-data:/var/lib/odoo
      - ./config:/etc/odoo
      - ./addons:/mnt/extra-addons
    restart: unless-stopped

volumes:
  db-data:
  odoo-data:
```

> Las credenciales son únicamente para un entorno local de aula. No son apropiadas para producción.

## 4.6. Configuración mínima

`config/odoo.conf`:

```ini
[options]
admin_passwd = cambiar-esta-clave-maestra
db_host = db
db_port = 5432
db_user = odoo
db_password = odoo-aula
addons_path = /usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons
```

La contraseña maestra protege operaciones de administración de bases de datos. Debe ser robusta y mantenerse fuera de repositorios.

## 4.7. Comandos

```bash
docker compose config
docker compose pull
docker compose up -d
docker compose ps
docker compose logs -f odoo
```

Acceso local:

```text
http://localhost:8069
```

Detener sin eliminar volúmenes:

```bash
docker compose stop
```

Reanudar:

```bash
docker compose start
```

Eliminar contenedores y red, conservando volúmenes:

```bash
docker compose down
```

`docker compose down -v` elimina también los volúmenes del proyecto y, por tanto, puede destruir los datos. Solo debe usarse si se desea reiniciar el laboratorio y se ha comprobado el objetivo.

## 4.8. Persistencia

Sin volúmenes, eliminar un contenedor puede eliminar sus datos. Los volúmenes nombrados mantienen la información al recrear servicios.

```bash
docker volume ls
docker compose volumes
```

Un volumen no sustituye una copia de seguridad: también puede dañarse o eliminarse.

## 4.9. Diagnóstico

```bash
docker compose ps
docker compose logs --tail=100 db
docker compose logs --tail=100 odoo
docker compose exec db pg_isready -U odoo
```

Problemas frecuentes:

- Puerto 8069 ocupado.
- Error de indentación YAML.
- Contraseñas distintas entre servicios y configuración.
- Permisos en carpetas montadas.
- Base de datos aún no preparada.
- Imagen no descargada.

## 4.10. Producción

Un despliegue real requiere, entre otros aspectos:

- HTTPS y proxy inverso.
- Gestión segura de secretos.
- Restricción del gestor de bases.
- Copias automatizadas y restauraciones probadas.
- Monitorización y alertas.
- Correo correctamente configurado.
- Actualizaciones planificadas.
- Alta disponibilidad si se requiere.
- Protección de red y endurecimiento.
- Cumplimiento legal.

## 4.11. Actividades

1. Explica la función de cada servicio y volumen.
2. Valida el Compose antes de iniciarlo.
3. Comprueba la persistencia recreando contenedores sin borrar volúmenes.
4. Provoca un error de puerto y diagnósticalo.
5. Enumera diferencias entre este laboratorio y producción.

