CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR)
AS
$$
	BEGIN
		UPDATE employees
		SET 
			salary = salary * 1.05
		WHERE
			department_id = (SELECT 
								department_id 
							FROM 
								departments AS d
							WHERE
								d.name = department_name);
	END
$$
LANGUAGE PLPGSQL;