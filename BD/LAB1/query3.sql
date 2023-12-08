SELECT *, max(amount) OVER(PARTITION BY fare_conditions ORDER BY
amount) as Data FROM ticket_flights;