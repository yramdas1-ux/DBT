{{ config(
    materialized='incremental',
    alias='emp_stream',
    unique_key='emp_id'
) }}

SELECT emp_id,
       emp_name,
       dept_id,
       manager_id,
       job_title,
       salary,
       hire_date,
       load_date
FROM ram.raw.s_emp

{% if is_incremental() %}
  WHERE metadata$action != 'DELETE'
{% endif %}
