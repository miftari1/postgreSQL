SELECT
	population,
	CHAR_LENGTH(population::TEXT) AS "length"
	-- CHAR_LENGTH(CAST(population AS TEXT)) as "length"
FROM
	countries;