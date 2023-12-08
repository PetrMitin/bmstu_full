create or replace procedure add_group(
	in _department_id bigint,
	in _name varchar(255),
	in _field_of_study varchar(255)
)
as $$
begin
	if _department_id is null 
		or _field_of_study is null 
		or _name is null then
		raise notice 'Some of params is null!';
	elseif (select count(*) as count from departments where department_id=_department_id) < 1 then
		raise notice 'Department with such id does not exist!';
	elseif (select count(*) as count from groups where name=_name) > 0 then
		raise notice 'Group with such name already exists!';
	else 
		INSERT INTO groups
                    (name, 
					 field_of_study,
					 department_id) 
                VALUES
				(_name, 
				_field_of_study,
				_department_id);
	end if;
end;
$$ language plpgsql;

do
$$
begin
	CALL add_group(9, 'Ух ты!', 'Индусы');
end;
$$;
select * from groups where name='Ух ты!';
--delete from groups where name='Ух ты!';