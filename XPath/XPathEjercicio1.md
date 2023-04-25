# XPath

_Soluciones de la actividad XML - XPath 1._

### Ejercicio 1

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

```
<?xml version="1.0" encoding="UTF-8"?>
<ies>
    <nombre>IES Puerto de la Cruz – Telesforo Bravo</nombre>
    <web>https://www3.gobiernodecanarias.org/medusa/edublog/iespuertodelacruztelesforobravo/</web>
    <ciclos>
        <ciclo id="ASIR">
            <nombre>Administración de Sistemas Informáticos en Red</nombre>
            <grado>Superior</grado>
            <decretoTitulo año="2009" />
        </ciclo>
        <ciclo id="DAM">
            <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
            <grado>Superior</grado>
            <decretoTitulo año="2010" />
        </ciclo>
        <ciclo id="SMR">
            <nombre>Sistemas Microinformáticos y Redes</nombre>
            <grado>Medio</grado>
            <decretoTitulo año="2008" />
        </ciclo>
    </ciclos>
</ies>
  ```
### 1. Nombre del instituto
```
```
### 2. Página web del instituto
```
```
### 3. Nombre de los Ciclos Formativos
```
```
### 4. Siglas por las que se conocen los Ciclos Formativos
```
```
### 5. Años en los que se publicaron los decretos de título de los Ciclos Formativos
```
```
### 6. Ciclos Formativos de Grado Medio (se trata de obtener el elemento <ciclo> completo)
```
```
### 7. Nombre de los Ciclos Formativos de Grado Superior
```
```
### 8. Nombre de los Ciclos Formativos anteriores a 2010
```
```
### 9. Nombre de los Ciclos Formativos de 2008 o 2010
```
```

### Ejercicio 2

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
```
### 2. Nombre de los módulos del ciclo ASIR
```
```
### 3. Nombre de los módulos que se imparten en el segundo curso de cualquier ciclo
```
```
### 4. Nombre de los módulos de menos de 5 horas semanales
```
```
### 5. Nombre de los módulos que se imparten en el primer curso de ASIR
```
```
### 6. Horas semanales de los módulos de más de 3 horas semanales
```
```

