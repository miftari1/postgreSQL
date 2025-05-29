SELECT
	first_name,
	last_name,
	EXTRACT(YEAR FROM born) as year
FROM
	authors;