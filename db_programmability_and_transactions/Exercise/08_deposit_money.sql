CREATE OR REPLACE PROCEDURE sp_deposit_money(account_id INT, money_amount NUMERIC)
AS
$$
	BEGIN
		UPDATE accounts
		SET 
			balance = balance + TRUNC(money_amount, 4)
		WHERE
			id = account_id;
		COMMIT;
	END
$$
LANGUAGE PLPGSQL;