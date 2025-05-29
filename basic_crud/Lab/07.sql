CREATE VIEW "Get top paid employees" AS
SELECT
	*
FROM
	employees
ORDER BY
	salary DESC
LIMIT 1
;

SELECT * FROM "Get top paid employees";