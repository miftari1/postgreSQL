WITH "row_number" 
AS (
	SELECT
		cou.country_name,
		COALESCE(p.peak_name, '(no highest peak)') AS highest_peak_name,
		COALESCE(p.elevation, 0) AS highest_peak_elevation,
		COALESCE(m.mountain_range, '(no mountain)') AS mountain,
		ROW_NUMBER() OVER(PARTITION BY cou.country_name ORDER BY p.elevation DESC) AS row_num
	FROM
		countries AS cou
		LEFT JOIN
			mountains_countries AS mc
			USING (country_code)
		LEFT JOIN
			peaks AS p
			USING (mountain_id)
		LEFT JOIN
			mountains AS m
			ON
				p.mountain_id = m.id
		)
SELECT
	country_name,
	highest_peak_name,
	highest_peak_elevation,
	mountain
FROM
	"row_number"
WHERE
	row_num = 1
ORDER BY
	country_name,
	highest_peak_elevation DESC;
	