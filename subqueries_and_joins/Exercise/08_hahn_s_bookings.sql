SELECT
	COUNT(b.booking_id)
FROM
	bookings AS b
JOIN
	customers AS c
	USING (customer_id)
WHERE
	c.last_name = 'Hahn';
	
	