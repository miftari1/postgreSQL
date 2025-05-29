SELECT
	job_title,
	CASE
		WHEN AVG(salary) < 27500 THEN 'Need Improvement'
		WHEN AVG(salary) BETWEEN 27500 AND 45800 THEN 'Medium'
		ELSE 'Good'
	END AS category
FROM
	employees
GROUP BY
	job_title
ORDER BY
	category,
	job_title
;