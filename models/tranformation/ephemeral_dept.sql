{{ config( materialized = 'ephemeral' )}}

select d.dept_id,department_name,avg(salary)as avg_sal from ram.raw.emp e join ram.raw.department d 
on e.dept_id = d.dept_id 
group by 1,2
