CREATE or replace FUNCTION trigger_before_insert_student() RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
	IF TG_LEVEL != 'ROW' OR TG_WHEN != 'BEFORE' THEN
		RAISE EXCEPTION 'Ошибка в установки триггера';
		RETURN NULL;
	END IF;
	
	IF TG_OP = 'INSERT' THEN
		if NEW.date_of_birth > current_date then
			raise notice 'Incorrect birth date';
			return NULL;
		elseif NEW.year_of_enrollment > date_part('year', current_date) then
			raise notice 'Incorrect enrollment year';
			return NULL;
		else
			return new;
		end if;
	END IF;
	
	RETURN NULL;
END;
$$;

CREATE or replace TRIGGER before_insert_student 
BEFORE INSERT
ON students
FOR EACH ROW
EXECUTE FUNCTION trigger_before_insert_student();

insert into students (name, 
					 city, 
					 date_of_birth, 
					 year_of_enrollment, 
					 citizenships, 
					 parents, 
					 motivational_letter) values (
					'Vasya Pupkin 14', 
					'Moscow',
					'2004-12-31', 
					 2024, 
					'{"Russia"}', 
					'{"mother": "Mama", "father": "Papa"}', 
					'Letter');
