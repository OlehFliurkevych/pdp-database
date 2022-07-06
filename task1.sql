-- get student by name (exact)

select s.first_name,
       s.surname,
       s.phone_numbers,
       s.primary_skill
from   student s
where  s.first_name = 'first_name_784' 

-- get student by surname (partial)

select s.first_name,
       s.surname,
       s.phone_numbers,
       s.primary_skill
from   student s
where  s.surname like 'surname_4459%' 

-- get student by phone number (partial)

select s.first_name,
       s.surname,
       s.phone_numbers,
       s.primary_skill
from   student s
where  s.phone_numbers like '3809872%' 

-- get user with marks by surname (partial) 

select s.first_name,
       s.surname,
       s.phone_numbers,
       s.primary_skill,
       r.mark
from   student s
       inner join results r
               on s.id = r.student_id
where  s.surname like 'surname_751%'