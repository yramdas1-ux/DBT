{{ config(
    materialized='incremental',
    alias='emp_incremental_1',
    unique_key ='emp_id'
) }}

SELECT *
FROM ram.raw.emp

{% if is_incremental() %}
  WHERE load_date > (SELECT MAX(load_date) FROM {{ this }})
{% endif %}
