UPDATE countries
SET 
	country_name = 'Burma'
WHERE 
	country_name = 'Myanmar';

INSERT INTO
	monasteries(monastery_name, country_code)
VALUES
	('Hanga Abbey', (SELECT 
						country_code 
					FROM 
						countries
					WHERE 
						country_name = 'Tanzania')),
	('Myin-Tin-Daik', (SELECT 
						country_code 
					FROM 
						countries
					WHERE 
						country_name = 'Myanmar'));

SELECT
	continent_name,
	country_name,
	COUNT(m.*) AS monasteries_count
FROM
	continents AS con
JOIN
	countries AS cou
	USING (continent_code)
	LEFT JOIN
		monasteries AS m
		USING (country_code)
	WHERE
		NOT cou.three_rivers
	GROUP BY
		continent_name,
		country_name
	ORDER BY
		monasteries_count DESC,
		country_name;