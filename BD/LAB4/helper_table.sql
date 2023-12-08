create table if not exists students_groups_count (
	students_count bigint,
	groups_count bigint
);

--delete from students_groups_count;

-- insert into students_groups_count values (
-- 	(select count(*) from students)::bigint, 
-- 	(select count(*) from groups)::bigint);

CREATE or replace FUNCTION trigger_before_insert_student_group() RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
	if tg_table_name='students' then
		update students_groups_count set students_count=(select students_count)+1;
	elseif tg_table_name='groups' then
		update students_groups_count set groups_count=(select groups_count)+1;
	end if;
	return new;
END;
$$;

CREATE or replace TRIGGER before_insert_student_do
AFTER INSERT
ON students
FOR EACH ROW
EXECUTE FUNCTION trigger_before_insert_student_group();

CREATE or replace TRIGGER before_insert_group_do
AFTER INSERT
ON groups
FOR EACH ROW
EXECUTE FUNCTION trigger_before_insert_student_group();

-- insert into students (name, 
-- 					 city, 
-- 					 date_of_birth, 
-- 					 year_of_enrollment, 
-- 					 citizenships, 
-- 					 parents, 
-- 					 motivational_letter) values ('Vasya Pupkin 15', 
-- 					'Moscow', '2004-12-31', 
-- 					 2020, 
-- 					'{"Russia"}', 
-- 					'{"mother": "Mama", "father": "Papa"}', 
-- 					'Letter'
-- 				   );
-- insert into groups (name, 
-- 					 field_of_study,
-- 					 department_id) values (
-- 					 'New group 3', 'New field', 12);
select * from students_groups_count;