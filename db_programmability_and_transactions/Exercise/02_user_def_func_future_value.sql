CREATE OR REPLACE FUNCTION fn_calculate_future_value(
	initial_sum INT, 
	yearly_interest_rate NUMERIC,
	number_of_years INT
	)
RETURNS NUMERIC
AS
$$
	DECLARE
		future_value NUMERIC;
	BEGIN
		SELECT
			initial_sum * ((1 + yearly_interest_rate)^number_of_years) 
			INTO 
				future_value;
		RETURN
			TRUNC(future_value, 4);
	END;
$$
LANGUAGE PLPGSQL;