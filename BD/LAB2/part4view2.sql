create or replace view number_of_students_by_group
as (
	select group_id, count(*) as number_of_students
	from tuitions
	group by group_id
	order by group_id
);

-- insert into number_of_students_by_group
-- values ('069b8eda-e993-473f-a40a-b02093e606c5', 30);

select * from number_of_students_by_group;