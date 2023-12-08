with richest_tuition_group_ids as 
(select group_id from tuitions where scholarship_amount = (select max(scholarship_amount) from tuitions))

select * from groups where id = (select group_id from richest_tuition_group_ids);