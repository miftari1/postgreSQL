CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
RETURNS VARCHAR
AS
$$
	BEGIN
		IF 
			first_name IS NULL AND last_name IS NULL
		THEN
			RETURN NULL;
		ELSIF
			first_name IS NULL
		THEN
			RETURN INITCAP(last_name);
		ELSIF
			last_name IS NULL
		THEN
			RETURN INITCAP(first_name);
		ELSE
			RETURN INITCAP(CONCAT(first_name, ' ', last_name));
		END IF;
	END
$$
LANGUAGE
	PLPGSQL;