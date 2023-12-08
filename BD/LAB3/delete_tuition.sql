create or replace procedure delete_tuition(
	in _tuition_id bigint
)
as $$
begin
	if _tuition_id is null then
		raise notice 'Tuition id is null!';
	elseif (select count(*) from tuitions where tuition_id=_tuition_id) < 1 then
		raise notice 'There is no such tuition';
	else 
		delete from tuitions where tuition_id=_tuition_id;
	end if;
end;
$$ language plpgsql;

do
$$
begin
	CALL delete_tuition(1);
end;
$$;

select * from tuitions where tuition_id=1;