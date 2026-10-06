{{ config(
    materialized='table',
    pre_hook=["insert into ram.raw.pre_post_table values('emp_count','started', current_timestamp)"],
    post_hook=["insert into ram.raw.pre_post_table values('emp_count','completed', current_timestamp)"]
) }}

SELECT d.department_name,
       COUNT(*) AS count_dpt
FROM ram.raw.emp e
JOIN ram.raw.department d
  ON e.dept_id = d.dept_id
GROUP BY d.department_name
