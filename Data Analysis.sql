-- Aca pondre preguntas que nos puede hacer un empleador en ingles, ya que puedo leer documentacion en español/ingles
-- repondere abajo de la pregunta poniendo el script de consulta que responde a la pregunta.

-- Questions/Preguntas 

-- 1. what is the gender breakdown of employee of company? (¿Cual es el analisis de genero de los empleados de la compañia?)
select gender, count(*) as count                 
from hr
where age >= 18 and termdate = '0000-00-00'   
group by gender;      
-- 2. What is the race/etnicity breakdown of employees in the company? (¿Cuál es la distribución de razas/etnias entre los empleados de la empresa? 
Select race, count(*) as count
from hr
where age >= 18 and termdate ='0000-00-00'
group by race
order by count(*) desc;
-- 3. What is the age distribution of employees in the company? (¿Cuales son las edades de los empleados de la compañia?)
select  -- consultamos cual es el minimo de edad de un empleado y su maximo, para luego hacer otro script
   min(age) as youngest,
   max(age) as oldest
 from hr
 where age >= 18 and termdate = '0000-00-00';
 
 
 select -- hacemos un script para ordenar , creando una tabla y contando los grupos de edad hasta 44-54
  case
   when age >= 18 and age <= 24 then '18-24'
   when age >= 25 and age <= 34 then '25-34'
   when age >= 35 and age <= 44 then '35-44'
   when age >= 45 and age <= 54 then '44-54'
   when age >= 55 and age <= 64 then '55-64'
   else '65+'
  end as age_group,
 count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by age_group
order by age_group;

-- 4. How many employees work at headquartes versus remote locations? (¿Cuantos empleados trabajan remotamente vs oficina?)

select location, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by location;

-- 5. what is the avergate lenght of employment for employees who have been terminated? (Cuantos años esta un empleado en la compañia) o (cuanto dura los contratos de los empleados en la compàñia?
select
 round(avg(datediff(termdate, hire_date))/365,0) as avg_lenght_employment
from hr
where termdate <= curdate() and termdate <> '0000-00-00' and age >= 18;

-- 6. How does the gender distribution vary across departments and job titles?
select department, gender, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by department, gender
order by department;

-- 7. What is the distribution of job titles across the company? (cual es la distribucion de tituos en la compañia?)

select jobtitle, count(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by jobtitle
order by jobtitle desc;

-- 8. Which department has the highest turnover rate? (¿Cual deparmento es el que tiene mayor tiempo de turno?)

select department,
 total_count,
 terminated_count,
 terminated_count/total_count AS termination_rate
from (
select department,
count(*) as total_count,
sum(case when termdate <> '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminated_count
from hr
where age >= 18
group by department
) as subquery
order by termination_rate desc;

-- 9. What is the distribution of employees across locations by city and state?

select `location_state;`, COUNT(*) as count
from hr
where age >= 18 and termdate = '0000-00-00'
group by `location_state;`
order by count desc;

-- 10. How has the company's employee count changed over time based on hire and term dates? (¿Cómo ha cambiado el número de empleados de la empresa con el tiempo basándose en las fechas de contratación y finalización?)
select
 year,
 hires,
 terminations,
 hires - terminations as net_change,
 round((hires - terminations)/hires * 100,2) as net_change_percent
from(
     select 
      year(hire_date) as year,
      count(*) as hires,
      sum(case when termdate <> '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminations
      from hr
      where age >= 18
      group by year(hire_date)
	) as subquery
order by year asc;
 
 -- 11. What is the tenure distribution for each department?
 
 select department, round(avg(datediff(termdate, hire_date)/365),0) as avg_tenure
 from hr
 where termdate <= curdate() and termdate <> '0000-00-00' and age >= 18
 group by department;
 
