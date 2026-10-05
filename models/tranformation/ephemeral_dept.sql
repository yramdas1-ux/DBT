{{ config( materialized = 'ephemeral' )}}

select d.deptno,department,avg(salary)as avg_sal from ram.raw.emp e join ram.raw.department d 
on e.deptno = d.deptno 
group by 1,2
