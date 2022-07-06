-- creating snapshot  

create or replace view general_student_view
as
  select st.first_name,
         st.surname,
         sj.name,
         rs.mark
  from   student st
         inner join results rs
                 on st.id = rs.student_id
         inner join subject sj
                 on rs.subject_id = sj.id 

                 
-- testing view 
                 
select * from general_student_view gsv ;
                 
-- function for avg mark for inputed student name
                 
create or replace function avg_mark_per_student_name(first_name text, OUT avg_mark_value integer)
as 
$$
begin
	select into avg_mark_value avg(rs.mark) from results rs inner join student st on rs.student_id = st.id where st.first_name = $1;
END;
$$ 
language plpgsql;

-- return 3, because student have mark 2 and mark 5
select avg_mark_per_student_name('first_name_1091')


-- function for avg mark for inputed subject name

create or replace function avg_mark_per_subject_name(name text, OUT avg_mark_value integer)
as 
$$
begin
	select into avg_mark_value avg(rs.mark) from results rs inner join subject sj on rs.subject_id = sj.id where sj.name = $1;
END;
$$ 
language plpgsql;

select avg_mark_per_subject_name('subject_name_651')

-- funtion for student from red zone

create or replace function red_zone_students()
returns table(first_name varchar, surname varchar) as 
$$
begin return query 
select st.first_name,
       st.surname
from   (select st.id        as student_id,
               count(st.id) as count_marks
        from   student st
               inner join results rs
                       on st.id = rs.student_id
        where  rs.mark <= 3
        group  by st.id) subquary
       inner join student st
               on ( subquary.student_id = st.id
                    and subquary.count_marks >= 2 ); 
end;
$$
language plpgsql;

select * from red_zone_students();