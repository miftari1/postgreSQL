CREATE VIEW get_account_info
AS
SELECT
	full_name,
	SUM(balance) AS total_balance
FROM
	(SELECT
		CONCAT(ah.first_name, ' ', ah.last_name) AS full_name,
		ac.balance
	FROM
		account_holders AS ah
	JOIN
		accounts AS ac
		ON ac.account_holder_id = ah.id
	ORDER BY
		ah.first_name,
		ah.last_name)
GROUP BY
	full_name
ORDER BY
	full_name
;
	

CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
AS
$$
	DECLARE
		acc RECORD;
	BEGIN
		FOR acc IN (get_account_info)
		LOOP
			IF 
				acc.total_balance > searched_balance
			THEN
				RAISE NOTICE '% - %', acc.full_name, acc.total_balance;
			END IF;
		END LOOP;	
	END
$$
LANGUAGE PLPGSQL;