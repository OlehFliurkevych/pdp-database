-- 1 trigger that will update column updated_datetime to current date in case of updating any of student

create or replace function update_datetime() returns trigger
as 
$body$
begin
	new.updated_datetime = now();
return new;
END;
$body$ 
language plpgsql;
  
create or replace trigger trig_update_datetime 
before update on student 
for each row execute procedure update_datetime()

-- test trigger 1

update student
set    primary_skill = 'PHP'
where  first_name = 'first_name_784'
       and surname = 'surname_67515'; 

select *
from   student s
where  s.first_name = 'first_name_784'
       and s.surname = 'surname_67515';
      
-- end testing of trigger 1
      
-- 2 trigger validate inputed first_name (reject student name with next characters '@', '#', '$')

create or replace function validate_first_name() returns trigger
as 
$body$
begin
	if new.first_name ~ '[@,#,$]'   THEN
		RAISE EXCEPTION 'First name can''t contains of specific characters';
	end if;
return new;
END;
$body$ 
language plpgsql;
  
create or replace trigger trig_validate_first_name 
before insert or update on student 
for each row execute procedure validate_first_name()

-- test trigger 2

update student
set    first_name = '23423sdfsdf'
where  id = 2; 

select *
from   student s
where  id = 4039;

-- end testing of trigger 2