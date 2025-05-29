SELECT
	SUM(booked_for) AS total_value
FROM
	bookings
GROUP BY
	apartment_id
HAVING
	apartment_id = 90
;