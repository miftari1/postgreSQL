CREATE OR REPLACE FUNCTION
	fn_is_game_over(is_game_over BOOL)
RETURNS TABLE(
	name VARCHAR(50),
	game_type_id INT,
	is_finished BOOL
)
AS
$$
	BEGIN
		RETURN QUERY
			SELECT
				g.name,
				g.game_type_id,
				g.is_finished
			FROM
				games AS g
			WHERE
				is_game_over = g.is_finished;
	END
$$
LANGUAGE PLPGSQL;