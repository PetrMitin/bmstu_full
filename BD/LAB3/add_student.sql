create or replace procedure add_student(
	in _date_of_birth date, 
	in _year_of_enrollment integer, 
	in _citizenships text[],
	in _parents jsonb,
	in _motivational_letter text,
	in _name varchar(255),
	in _city varchar(255)
)
as $$
begin
	if _date_of_birth is null 
		or _year_of_enrollment is null 
		or _citizenships is null 
		or _parents is null 
		or _motivational_letter is null 
		or _name is null 
		or _city is null then
		raise notice 'Some of params is null!';
	elseif _date_of_birth > current_date then
		raise notice 'Incorrect birth date';
	elseif _year_of_enrollment > date_part('year', current_date) then
		raise notice 'Incorrect enrollment year';
	elseif (select count(*) as count from students where name=_name) > 0 then
		raise notice 'Student with such name exists!';
	else 
		INSERT INTO students 
                    (name, 
					 city, 
					 date_of_birth, 
					 year_of_enrollment, 
					 citizenships, 
					 parents, 
					 motivational_letter) 
                VALUES
				(_name, 
				 _city, 
				 _date_of_birth, 
				 _year_of_enrollment, 
				 _citizenships, 
				 _parents, 
				 _motivational_letter);
	end if;
end;
$$ language plpgsql;

do
$$
begin
-- 	CALL add_student('2004-12-31', 
-- 					 2020, 
-- 					'{"Russia"}', 
-- 					'{"mother": "Mama", "father": "Papa"}', 
-- 					'Letter', 
-- 					'Vasya Pupkin', 
-- 					'Moscow'
-- 				   );
end;
$$;

--delete from students where name='Vasya Pupkin';
select * from students where name='Vasya Pupkin';