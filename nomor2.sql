----NOMOR 2
SELECT
	k.employee_id AS "Kode Karyawan",
	concat(k.first_name, ' ', k.last_name) AS nama_karyawan,
	INITCAP(d.department_name) AS "Nama Bagian",
	CASE 
		WHEN m.employee_id is null
		THEN 'Saya tidak punya manager'
	ELSE
		CONCAT(m.first_name, ' ', m.last_name)
	END AS manager_name,

UPPER(j.job_title) AS "Nama Jabatan"
FROM employees k
  JOIN departments d ON k.department_id = d.department_id
  LEFT OUTER JOIN employees m ON k.employee_id = m.manager_id
  JOIN jobs j ON k.job_id = j.job_id

ORDER BY manager_name, nama_karyawan;

