CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE (
	total_cash NUMERIC
)
AS
$$
	BEGIN
		RETURN QUERY
			SELECT
				ROUND(SUM(cash), 2)
			FROM
				(SELECT
					g.name,
					ug.cash,
					ROW_NUMBER () OVER(
						ORDER BY
							ug.cash DESC
					)
				FROM 
					users_games AS ug
				JOIN
					games AS g
					ON
						ug.game_id = g.id
				WHERE
					g.name = game_name
				ORDER BY
					cash DESC) AS ugc
				WHERE
					row_number % 2 != 0;
	END
$$
LANGUAGE PLPGSQL;