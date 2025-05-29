ALTER TABLE bookings
ADD COLUMN billing_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

SELECT 
	TO_CHAR(billing_date, 'DD "Day" MM "Month" YYYY "Year" HH24:MI:SS') AS "Billing Day"
FROM
	bookings;