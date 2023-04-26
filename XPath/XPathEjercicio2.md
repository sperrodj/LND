# XPath

_Soluciones de la actividad XML - XPath 2._

### Ejercicio 1

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

```
<?xml version="1.0" encoding="UTF-8"?>
<ies>
    <modulos>
        <modulo id="0228">
            <nombre>Aplicaciones web</nombre>
            <curso>2</curso>
            <horasSemanales>4</horasSemanales>
            <ciclo>SMR</ciclo>
        </modulo>
        <modulo id="0372">
            <nombre>Gestión de bases de datos</nombre>
            <curso>1</curso>
            <horasSemanales>5</horasSemanales>
            <ciclo>ASIR</ciclo>
        </modulo>
        <modulo id="0373">
            <nombre>Lenguajes de marcas y sistemas de gestión de información</nombre>
            <curso>1</curso>
            <horasSemanales>3</horasSemanales>
            <ciclo>ASIR</ciclo>
            <ciclo>DAM</ciclo>
        </modulo>
        <modulo id="0376">
            <nombre>Implantación de aplicaciones web</nombre>
            <curso>2</curso>
            <horasSemanales>5</horasSemanales>
            <ciclo>ASIR</ciclo>
        </modulo>
    </modulos>
</ies>
  ```
### 1. Nombre de los módulos que se imparten en el instituto
```
//nombre/text()
```
### 2. Nombre de los módulos del ciclo ASIR
```
//nombre[../ciclo="ASIR"]/text()
```
### 3. Nombre de los módulos que se imparten en el segundo curso de cualquier ciclo
```
//nombre[../curso=2]/text()
```
### 4. Nombre de los módulos de menos de 5 horas semanales
```
//nombre[../horasSemanales<5]/text()
```
### 5. Nombre de los módulos que se imparten en el primer curso de ASIR
```
//nombre[../ciclo="ASIR" and ../curso=1]/text()
```
### 6. Horas semanales de los módulos de más de 3 horas semanales
```
//horasSemanales[.>3]/text()
```

