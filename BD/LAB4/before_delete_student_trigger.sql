CREATE or replace FUNCTION trigger_before_delete_student() RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
	if (select count(*) from tuitions where OLD.student_id=student_id) > 0 then
		raise notice 'Still tuitions to delete';
		RETURN NULL;
	else
		return old;
	end if;
	RETURN NEW;
END;
$$;

CREATE or replace TRIGGER before_delete_student 
BEFORE DELETE
ON students
FOR EACH ROW
EXECUTE FUNCTION trigger_before_delete_student();

delete from students where name='Vasya Pupkin';