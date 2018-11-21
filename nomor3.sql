----NOMOR 3
SELECT
	d.department_id AS dep_id,
	d.department_name AS dep_name,
	SUM(e.salary) AS total_gaji
FROM employees e JOIN departments d ON e.department_id = d.department_id
GROUP BY dep_id, dep_name
ORDER BY total_gaji DESC;
