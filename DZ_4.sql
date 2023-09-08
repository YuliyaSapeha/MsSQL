/*1. Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета */
Select Faculties.Name
FROM Faculties join Departments  on Faculties.Id=Departments.FacultyId
where Departments.Financing > Faculties.Financing
    go          

    
	
/*2. Вывести фамилии кураторов групп и названия групп, которые они курируют.*/
Select
       Curators.Surname,
	   Groups.Name
from 
      Curators  join GroupsCurators on GroupsCurators.CuratorId=Curators.Id
	            join Groups on Curators.Id=Groups.Id
go
/*3. Вывести имена и фамилии преподавателей, которые читают лекции у группы “P107”.*/
select 
         Teachers.Name,
		 Teachers.Surname,
		 Groups.Name
from  Teachers join Lectures on Teachers.Id=Lectures.TeacherId
               join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			   join Groups on Groups.Id=GroupsLectures.GroupId
where   Groups.Name ='БиБ'
GO
          
/*4. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.*/
select 
       Teachers.Surname,
	   Faculties.Name
from Teachers join Lectures on Teachers.Id=Lectures.TeacherId
              join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
			  join Groups on Groups.Id=GroupsLectures.GroupId
			  join Departments on Groups.DepartmentId=Departments.Id
			  join Faculties on Departments.FacultyId=Faculties.Id
GO

            
/*5. Вывести названия кафедр и названия групп, которые к ним относятся.*/
select 
       Departments.Name AS 'Название кафедры',
	   Groups.Name AS 'Название группы'
from 
     Departments join Groups on Departments.Id=Groups.DepartmentId

GO


/*6. Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.*/
select 
       Subjects.Name
from	
      Subjects join Lectures on Subjects.Id=Lectures.SubjectId
	           join Teachers on Teachers.Id=Lectures.TeacherId
where
      Teachers.Surname = 'Комнатный' and Teachers.Name='Егор'
 GO

/*7. Вывести названия кафедр, на которых читается дисциплина “Database Theory”.*/
select 
       Departments.Name as 'Название кафедры'
from
     Departments join Groups on Departments.Id=Groups.DepartmentId
	             join GroupsLectures on  Groups.Id=GroupsLectures.GroupId
				 join Lectures on GroupsLectures.LectureId=Lectures.Id
				 join Subjects on Subjects.Id=Lectures.SubjectId
where
      Subjects.Name like'История %'
	  GO

/*8. Вывести названия групп, которые относятся к факультету “Computer Science”.*/
select 
       Groups.Name as 'Название групп'
from 
     Groups join Departments on Groups.DepartmentId=Departments.Id
	        join Faculties on Departments.FacultyId=Faculties.Id
where
       Faculties.Name = 'Биологический факультет'
	   GO

/*9. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.*/
select 
       Groups.Name as 'Название групп',
	   Faculties.Name as 'Название факультетов'
from 
      Groups join Departments on Groups.DepartmentId=Departments.Id
	         join Faculties on Departments.FacultyId=Faculties.Id
where
        Groups.Year=5 
go

/*10. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп), причем отобрать 
только те лекции, которые читаются в аудитории “B103”.*/

select Teachers.Name +' '+ Teachers.Surname as 'Преподаватель',
       Subjects.Name as 'Дисциплина',
	   Groups.Name as 'Группа'
from
      Teachers join Lectures on Lectures.TeacherId=Teachers.Id
	           join Subjects on Lectures.SubjectId=Subjects.Id
			   join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			   join Groups on Groups.Id=GroupsLectures.GroupId
where
      Lectures.LectureRoom='Аудитория геологии и географии'
	  GO
