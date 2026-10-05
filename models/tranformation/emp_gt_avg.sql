select e.emp_name,e.salary,d.avg_sal,'more_than' as label from ram.raw.emp e join {{ ref("ephemeral_dept")  }} d 

on e.deptno = d.deptno
where e.salary > d.avg_sal