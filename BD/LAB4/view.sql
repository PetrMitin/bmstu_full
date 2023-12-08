create or replace view name_to_short_name as (
	SELECT name, short_name
	FROM faculties
	ORDER BY name
);
 
select * from name_to_short_name;