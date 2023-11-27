-- Using Constraints

 create table student(
  
  s_id int primary key identity(1,1),
  s_subject varchar(20),
  s_chapters int,
  Constraint check_chapters Check(s_chapters between 1 and 10),
  Constraint check_subject Check( s_subject LIKE 's%')
 );


create table teachers(
  
  tech_id int primary key identity(1,1),
  tech_name varchar(20),
  s_id int Foreign Key References student(s_id)
 );


 
drop table if exists teachers;
drop table if exists student;

truncate table student;

select * from teachers;
select * from student;


 
insert into student(s_subject, s_chapters) 
values 
('snglish', 5),
('sath', 6),
('sio', 10);

insert into teachers(tech_name, s_id) 
values 
('salil deogade',3),
('salil deogade11',1),
('salil deogade22',2); 


 