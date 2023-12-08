CREATE or replace FUNCTION get_groups_by_student(_student_name varchar(255)) RETURNS 
	table (group_id bigint, group_name varchar(255), student_name varchar(255)) AS $$
	with groups_tuitions as (
		select groups.group_id as group_id, groups.name as group_name, student_id 
		from tuitions inner join groups on tuitions.group_id=groups.group_id)
    SELECT distinct group_id, group_name, students.name as student_name
	from ( students inner join groups_tuitions
		  on groups_tuitions.student_id=students.student_id) where students.name=_student_name;
$$ LANGUAGE SQL;

select * from get_groups_by_student('Vasya Pupkin');