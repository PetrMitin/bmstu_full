select count(*) as amount, date_of_birth from students
group by date_of_birth
having count(*) > 2;