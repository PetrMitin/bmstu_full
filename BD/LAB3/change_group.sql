create or replace procedure change_group(
	in _group_id bigint,
	in _name varchar(255),
	in _field_of_study varchar(255)
)
as $$
begin
	if _group_id is null then
		raise notice 'Group id is null';
	elseif (select count(*) as count from groups where group_id=_group_id) < 1 then
		raise notice 'Group with such id does not exist!';
	else 
		if _name is not null then
			update groups set name=_name where group_id=_group_id;
		end if;
		if _field_of_study is not null then
			update groups set field_of_study=_field_of_study where group_id=_group_id;
		end if;
	end if;
end;
$$ language plpgsql;

do
$$
begin
	CALL change_group(1014, 'Ух ты!', 'Индусы и китайцы');
end;
$$;

select * from groups where name='Ух ты!';