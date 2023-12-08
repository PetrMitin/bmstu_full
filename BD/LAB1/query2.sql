select flight_no, count(*) as amount from flights
where aircraft_code = '321'
group by flight_no;