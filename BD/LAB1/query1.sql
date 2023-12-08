SELECT model, count(*) as amount 
from bookings.aircrafts_data
group by model;