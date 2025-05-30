SELECT
	COUNT(*) AS countries_without_rivers
FROM
	countries AS c
LEFT JOIN
	countries_rivers AS cr
ON 
	c.country_code = cr.country_code
WHERE
	river_id IS NULL;