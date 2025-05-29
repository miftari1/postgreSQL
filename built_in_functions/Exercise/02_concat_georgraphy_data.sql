CREATE VIEW view_continents_countries_currencies_details AS
SELECT
	CONCAT(con.continent_name, ': ', con.continent_code) AS continent_details,
	CONCAT_WS(' - ', cou.country_name, cou.capital, cou.area_in_sq_km, 'km2') AS country_information,
	FORMAT('%s (%s)', curr.description, curr.currency_code) As currencies
FROM
	continents As con
JOIN 
	countries AS cou
ON
	cou.continent_code = con.continent_code
JOIN
	currencies AS curr
ON
	cou.currency_code = curr.currency_code
ORDER BY
	country_information,
	currencies
;