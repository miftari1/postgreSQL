ALTER TABLE 
	countries
ADD CONSTRAINT 
	fk_countries_country_code
FOREIGN KEY
	(currency_code)
	REFERENCES
		currencies(currency_code)
		ON DELETE CASCADE;

ALTER TABLE
	countries
ADD CONSTRAINT
	fk_countries_continents
	FOREIGN KEY
		(continent_code)
		REFERENCES
			continents(continent_code)
			ON DELETE CASCADE;