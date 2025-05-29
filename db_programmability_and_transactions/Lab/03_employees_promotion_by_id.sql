CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
AS
$$
	BEGIN
		UPDATE employees
		SET
			salary = salary * 1.05
		WHERE
			employee_id = id;
		IF NOT EXISTS
			(SELECT 1 FROM employees WHERE employee_id = id)
			THEN
				ROLLBACK;
				RETURN;
		END IF;
	COMMIT;
	END;
$$
LANGUAGE PLPGSQL;