create or replace view name_to_short_name as (
	SELECT name, short_name
	FROM faculties
	ORDER BY name
);

-- insert into name_to_short_name
-- values ('Test fac', 'TF'); 

-- update name_to_short_name
-- set short_name = 'TF1'
-- where name = 'Test fac';

-- delete from name_to_short_name
-- where name = 'Test fac';

select * from name_to_short_name;
