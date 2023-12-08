-- create type student as (
-- 	student_id bigint,
-- 	date_of_birth date, 
-- 	year_of_enrollment integer, 
-- 	citizenships text[],
-- 	parents jsonb,
-- 	motivational_letter text,
-- 	name varchar(255),
-- 	city varchar(255)
-- );
CREATE or replace FUNCTION get_students(_student_id bigint) RETURNS student AS $$
    SELECT * from students where student_id=_student_id limit 1;
$$ LANGUAGE SQL;

CREATE or replace FUNCTION get_students(_city varchar(255)) RETURNS setof student AS $$
    SELECT * from students where city=_city;
$$ LANGUAGE SQL;

CREATE or replace FUNCTION get_students_by_group(_group_name varchar(255)) RETURNS setof student AS $$
    SELECT distinct * from students
	where student_id in 
	(select student_id from tuitions where group_id in 
	 (select group_id from groups where name=_group_name));
$$ LANGUAGE SQL;

select * from get_students_by_group('Name0');
