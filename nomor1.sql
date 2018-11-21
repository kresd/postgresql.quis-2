----NOMOR 1
SELECT
	e.employee_id AS "Kode Karyawan",
	d.department_name AS "Nama Department",
	CONCAT (e.first_name, ' ', e.last_name) AS "Nama Lengkap",
	TO_CHAR(e.salary, '999,999,999') AS "Gaji sebulan",
	CASE 
		WHEN e.commission_pct IS NULL
			THEN 'Tidak punya komisi'
	ELSE
		TO_CHAR((e.commission_pct * e.salary), '999,999,999')
	END AS "Mendapatkan Komisi",

TO_CHAR(e.salary + (COALESCE(e.commission_pct, 0) * e.salary), '999,999,999') as gaji_terima
FROM
	employees e, departments d
WHERE
  d.department_id = e.department_id AND
  e.salary + (e.salary * COALESCE(e.commission_pct, 0)) >= 12000
ORDER BY gaji_terima;
