create user test;
GRANT ALL PRIVILEGES ON DATABASE bd_lab3 TO test;

reset role; 
create role test_user login;
grant select, update, insert on tuitions to test_user;
grant select(name, short_name), update(name, short_name) on departments to test_user;
grant select(dean) on faculties to test_user;
grant update(short_name), select(name) on name_to_short_name to test_user;
SET ROLE test_user;

--update tuitions set scholarship_amount=6000 where tuition_id=1;
--update departments set short_name='SN420' where name='Name1';
--select dean from faculties;
--update name_to_short_name set short_name = 'FacTest' where name='Faculty 0';

--insert into departments (name, short_name, head) values ('Test name', 'Test SN', 'Test head');
--update faculties set dean='Proletarskiy' where name='Name1';