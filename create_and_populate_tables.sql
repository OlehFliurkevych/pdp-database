DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS subject;

CREATE TABLE IF NOT EXISTS student (
  id serial primary key,
  first_name varchar(45) not null,
  surname varchar(45) not null,
  data_of_birth date not null,
  phone_numbers varchar(450) not null,
  primary_skill varchar(45) not null,
  created_datetime time not null,
  updated_datetime time not null
);

CREATE INDEX idx_student_name ON student(first_name);
CREATE INDEX idx_student_surname ON student(surname);
CREATE INDEX idx_student_phone_numbers ON student(phone_numbers);

CREATE TABLE IF NOT EXISTS subject (
  id serial not null primary key,
  name varchar(45) not null,
  tutor varchar(45) not null
);

CREATE INDEX idx_subject_name ON subject(name);

CREATE TABLE IF NOT EXISTS results (
  student_id integer not null,
  subject_id integer not null,
  mark integer not null,
  primary key(student_id, subject_id),
  constraint fk_subject foreign key(subject_id) references subject(id),
  constraint fk_student foreign key(student_id) references student(id)
);

insert into student(first_name, 
					surname,
					data_of_birth, 
					phone_numbers, 
					primary_skill, 
					created_datetime, 
					updated_datetime)
SELECT 
  'first_name_' || round(random()*2000),
  'surname_' || round(random()*70000),
  DATE '2000-01-01' + (random() * 1200)::integer,
  round(random()*100000 + 38000000),
  (ARRAY['Java','JavaScript','PHP','C++','C#', 'Go'])[floor(random()* 5) + 1],
  now(),
  now()
FROM generate_series(1,100000);

insert into subject(name, tutor)
SELECT 
  'subject_name_' || round(random()*1000),
  'tutor_' || round(random()*700)
FROM generate_series(1,1000);

insert into results(student_id, subject_id, mark)
SELECT 
  floor(random()* 100000) + 1,
  floor(random()* 1000) + 1,
  floor(random()* 5) + 1
FROM generate_series(1,20000);