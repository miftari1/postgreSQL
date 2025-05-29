CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS BOOLEAN
AS
$$
	BEGIN
		IF TRIM(LOWER(word), LOWER(set_of_letters)) = ''
		THEN
			RETURN TRUE;
		ELSE
			RETURN FALSE;
		END IF;
	END
$$
LANGUAGE PLPGSQL;



-- CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
-- RETURNS BOOLEAN
-- AS
-- $$
-- 	DECLARE
-- 		letter_index INT := 1;
-- 		successfull_matches INT := 0;
-- 		current_letter CHAR(1);
-- 	BEGIN
-- 		WHILE letter_index <= LENGTH(word) LOOP
-- 			current_letter := SUBSTRING(word, letter_index, 1);
-- 			IF 
-- 				POSITION(LOWER(current_letter) IN LOWER(set_of_letters)) = 0
-- 			THEN
-- 				RETURN FALSE;
-- 			END IF;
-- 			letter_index := letter_index + 1;
-- 		END LOOP;
-- 		RETURN TRUE;
-- 	END
-- $$
-- LANGUAGE PLPGSQL;