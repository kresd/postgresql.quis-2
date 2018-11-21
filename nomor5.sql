----NOMOR 5
SELECT
	e.employee_id AS kode_karyawan,
	CONCAT(first_name, ' ', last_name) AS nama_lengkap,
	TO_CHAR(e.salary, '99,999,999') AS gaji_karyawan,
	j.job_title AS nama_jabatan,
	e.email AS email
FROM employees e JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary >= (
  SELECT max(e2.salary)
  FROM employees e2
  WHERE e2.job_id = 'IT_PROG'
)
  AND commission_pct IS NOT NULL

ORDER BY gaji_karyawan, e.job_id;
