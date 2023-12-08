create or replace procedure delete_group(
	in _name varchar(255)
)
as $$
begin
	if _name is null then
		raise notice 'Name is null!';
	elseif (select count(*) from groups where name=_name) < 1 then
		raise notice 'There is no such group';
	elseif (
		select count(*) from tuitions where group_id in 
			(select group_id from groups where name = _name)
	) > 0 then
		raise notice 'There are tuitions to delete!';
	else 
		delete from groups where name=_name;
	end if;
end;
$$ language plpgsql;

do
$$
begin
	CALL delete_group('Ух ты!');
end;
$$;

select * from groups where name='Ух ты!';