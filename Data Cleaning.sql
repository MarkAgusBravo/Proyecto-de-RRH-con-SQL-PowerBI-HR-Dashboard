create database project;

use project;

select * from hr;

-- data cleaning / limpieza de datos

alter table hr  -- renombramos la columna ï»¿id a emp_id (id de empleado)
CHANGE COLUMN ï»¿id emp_id varchar(20)null;

describe hr; -- con esto checkeo el tipo de datos de la tabla ( data types) para editarlos
             -- vemos que birthdate,hire_date esta como text y no como date , hay que modificarla:

select birthdate from hr; -- seleccionamos esta columna para editarla como vimos en la consulta anterior es de tipo text asi que es un str (string)
                          -- actualmente esta ordenada mes,dia,año , vamos a ordernarla:


set sql_safe_updates = 0; -- desactivamos el modo seguro (caracteristica de MySQL) = 0 (false/desactivado) , =1 (true/activado) 

update hr
SET birthdate = CASE   -- aca editamos/actualizamos la columna birthdatw , hicimos un analisis por caso porque los datos tenian 2 separaciones por "/" y "-" 
 WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
 WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
 ELSE NULL    -- la editamos de tal manera que acomodamos los valores que se muestran de otro orden
END;   -- cuando ejecutamos la consulta nos pide que safe update mode por razones de seguridad

select birthdate from hr; -- columna actualizada , año-mes-dia , columna actualizada


alter table hr
modify column birthdate DATE;

describe hr;  -- ahora birthdate es date es correcto

update hr -- hacemos lo mismo que hicimos en la otra columna acomodamos los datos
SET hire_date = CASE   -- aca editamos/actualizamos la columna  , hicimos un analisis por caso porque los datos tenian 2 separaciones por "/" y "-" 
 WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
 WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
 ELSE NULL    -- la editamos de tal manera que acomodamos los valores que se muestran de otro orden
END;


select hire_date from hr;

alter table hr
modify column hire_date DATE;

select termdate from hr; -- vemos que tiene columnas vacias

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00') -- los datos nulos apareceran como 0000-00-00
WHERE true; -- la condicion se cumple para todas las filas

SET sql_mode = 'ALLOW_INVALID_DATES'; -- permite modificar datos

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

alter table hr add column age INT; -- careamos una columna en la tabla

update hr
set age = timestampdiff(YEAR, birthdate, CURDATE()) -- usamos la funcion timestampdiff para calcular la edad(tiempo real con la fecha de nacimiento)
;

select birthdate, age from hr;

select   -- hacemos una consulta del valor maximo y el valor minimo
 min(age) as youngest,
 max(age) as oldest
from hr;

select count(*) from hr where age < 18; -- cuenta los valores que son mayores a 18 en la tabla age




