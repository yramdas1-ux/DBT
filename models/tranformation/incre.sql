{{ config(
    materialized='incremental',
    alias='emp_incremental'
) }}

SELECT *
FROM ram.raw.emp

{% if is_incremental() %}
  WHERE hire_date > (SELECT MAX(hire_date) FROM {{ this }})
{% endif %}
