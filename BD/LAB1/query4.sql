with moscow_timezone_airports as (
	select city,
	airport_code as code
	from airports_data
	where timezone='Europe/Moscow'
)

select * from moscow_timezone_airports
where city='{"en": "Moscow", "ru": "Москва"}';