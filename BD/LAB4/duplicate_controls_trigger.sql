CREATE or replace FUNCTION trigger_before_insert_group() RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
	if (select count(*) from groups where name=NEW.name) > 0 then
		raise notice 'Duplicate';
		RETURN NULL;
	else
		return new;
	end if;
	RETURN NEW;
END;
$$;

CREATE or replace TRIGGER before_insert_group 
BEFORE INSERT
ON groups
FOR EACH ROW
EXECUTE FUNCTION trigger_before_insert_group();

insert into groups (department_id, name, 
					 field_of_study) values (10, 'Ух ты, говорящая рыба!', 'Индусы');