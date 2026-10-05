{{config (materialized = 'table')}}
select d.department, count(*) as count_dpt
from ram.raw.emp e
join ram.raw.department d on e.deptno = d.deptno
group by d.department
