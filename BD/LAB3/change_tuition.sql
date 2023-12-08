create or replace procedure change_tuition(
	in _tuition_id bigint,
	in _scholarship_amount real,
	in _year integer,
	in _semester integer
)
as $$
begin
	if _tuition_id is null then
		raise notice 'Tuition id is null';
	elseif (select count(*) as count from tuitions where tuition_id=_tuition_id) < 1 then
		raise notice 'Tuition with such id does not exist!';
	else 
		if _scholarship_amount is not null then
			update tuitions set scholarship_amount=_scholarship_amount 
			where tuition_id=_tuition_id;
		end if;
		if _year is not null then
			update tuitions set year=_year 
			where tuition_id=_tuition_id;
		end if;
		if _semester is not null then
			update tuitions set semester=_semester 
			where tuition_id=_tuition_id;
		end if;
	end if;
end;
$$ language plpgsql;

do
$$
begin
	CALL change_tuition(1, 420, 3, 7);
end;
$$;

select * from tuitions where tuition_id=1;