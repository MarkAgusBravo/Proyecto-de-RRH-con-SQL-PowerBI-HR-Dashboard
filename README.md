# RHH-PROYECTO-MySQL-PowerBI - Limpieza y Analisis de RRH

 ![1714777378213-39ee6615-230e-48b5-98f8-ecca6c3b081f_1](https://github.com/MarkAgusBravo/Proyecto-de-RRH-con-SQL-PowerBI-HR-Dashboard/assets/101859664/fc6a04c0-284e-4fe8-8a95-9fba01b9d393)

 ![1714777401989-ae2c61b0-f27c-4a18-b94c-44d91b8dece1_1](https://github.com/MarkAgusBravo/Proyecto-de-RRH-con-SQL-PowerBI-HR-Dashboard/assets/101859664/3dbef33a-c4ea-4de0-ab97-1fb20310de6e)






# Aclaracion los datos estan resueltos en ingles por mi  y traducidos por mi

## Datos usados

**Datos** - Datos de Recursos humanosmas de  22000 columnas del año 2000 al 2020.

**Analisis de datos y limpieza de datos/Data Cleaning & Analysis** - Analisis y limpieza de datos utilizada con MySQL 

**Visualizacion de datos/Data Visualization** - PowerBI, Visualizacion de datos realizada con Power BI

## Preguntas

- 1.¿Cuál es la proporción de género entre los empleados de la empresa?
- 2.¿Cuál es la distribución racial/étnica de los empleados en la empresa?
- 3.¿Cómo se distribuye la edad de los empleados en la empresa?
- 4.¿Cuántos empleados trabajan en la sede central versus ubicaciones remotas?
- 5.¿Cuál es la duración promedio del empleo para los empleados que han sido despedidos?
- 6.¿Cómo varía la distribución de género en diferentes departamentos y cargos?
- 7.¿Cuál es la distribución de cargos en la empresa?
- 8.¿Qué departamento tiene la tasa de rotación más alta?
- 9.¿Cuál es la distribución de empleados por ubicaciones según el estado?
- 10.¿Cómo ha cambiado el número de empleados de la empresa con el tiempo basado en las fechas de contratación y finalización?
- 11.¿Cuál es la distribución de la permanencia en cada departamento?

## Conclusiones del analisis.
- Existen más empleados masculinos que femeninos.
- La raza blanca es la más predominante, mientras que los nativos hawaianos y los indígenas americanos son los menos predominantes.
- El empleado más joven tiene 20 años y el más anciano tiene 57 años.
- Se crearon 5 grupos de edad (18-24, 25-34, 35-44, 45-54, 55-64). Un gran número de empleados se encontraban entre los 25 y 34 años, seguido por el grupo de 35-44 años, mientras que el grupo más pequeño estaba en el rango de 55-64 años.
- Un gran número de empleados trabaja en la sede central en comparación con los que trabajan de forma remota.
- La duración promedio de empleo para los empleados despedidos es de alrededor de 7 años.
- La distribución de género en los departamentos es bastante equilibrada, pero generalmente hay más empleados masculinos que femeninos.
- El departamento de Marketing tiene la tasa de rotación más alta, seguido por el de Capacitación. Las tasas de rotación más bajas se encuentran en los departamentos de Investigación y Desarrollo, Soporte y Legal.
- Un gran número de empleados proviene del estado de Ohio.
- El cambio neto en empleados ha aumentado con el tiempo.
- La permanencia promedio en cada departamento es de alrededor de 8 años, con Legal y Auditoría teniendo la más alta y Servicios, Ventas y Marketing teniendo la más baja.


## Limitaciones y modificaciones que se hicieron en el analisis

- Algunos registros tenían edades negativas y fueron excluidos durante la consulta (967 registros). Las edades utilizadas fueron de 18 años en adelante.
- Algunas fechas de término estaban muy en el futuro y no se incluyeron en el análisis (1599 registros). Las únicas fechas de término utilizadas fueron aquellas menores o iguales a la fecha actual.
