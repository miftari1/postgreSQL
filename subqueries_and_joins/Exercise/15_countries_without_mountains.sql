SELECT
	COUNT(c.id) AS countries_without_mountains
FROM
	mountains_countries AS mc
RIGHT JOIN
	countries AS c
	USING (country_code)
WHERE
	mountain_id IS NULL;