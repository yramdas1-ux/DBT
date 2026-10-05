SELECT d.department, COUNT(*) AS count_dpt
FROM ram.raw.emp e
JOIN ram.raw.department d
  ON e.deptno = d.department   -- match by department name
GROUP BY d.department;