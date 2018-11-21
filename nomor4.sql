----NOMOR 4
SELECT
	salary * 12 AS gaji_setahun,
	COUNT(*) AS jumlah_karyawan
FROM employees
	WHERE COALESCE(commission_pct,0) != 0
GROUP BY gaji_setahun
ORDER BY gaji_setahun DESC;
