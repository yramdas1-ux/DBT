{{ config (materialized = 'table')}}
select e.emp_name,e.salary,d.avg_sal,'more_than' as label from ram.raw.emp e join {{ ref("ephemeral_dept")  }} d 

on e.dept_id = d.dept_id
where e.salary < d.avg_sal