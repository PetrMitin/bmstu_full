create or replace procedure add_tuition(
	in _student_id bigint,
	in _group_id bigint,
	in _scholarship_amount real,
	in _year integer,
	in _semester integer
)
as $$
begin
	if _student_id is null 
		or _group_id is null 
		or _scholarship_amount is null 
		or _year is null 
		or _semester is null 
		then
		raise notice 'Some of params is null!';
	elseif (select count(*) as count from students where student_id=_student_id) < 1 then
		raise notice 'Student with such id does not exist!';
	elseif (select count(*) as count from groups where group_id=_group_id)  < 1 then
		raise notice 'Group with such id does not exist!';
	elseif (select count(*) as count from tuitions where group_id=_group_id and student_id=_student_id) > 0 then
		raise notice 'There is such tuition already!';
	else 
		INSERT INTO tuitions
                    (student_id, group_id, scholarship_amount, year, semester) 
                VALUES
				(_student_id, _group_id, _scholarship_amount, _year, _semester);
	end if;
end;
$$ language plpgsql;

do
$$
begin
	CALL add_tuition(1000001, 1, 420, 1, 1);
end;
$$;