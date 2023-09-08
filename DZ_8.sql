/*1. Вывести названия аудиторий, в которых читает лекции преподаватель “Edward Hopper”*/
select 
       LectureRoom.Name as 'Название аудиторий'
from LectureRoom join Schedules on LectureRoom.Id=Schedules.LectureRoomId
                 join Lectures on Schedules.LectureId=Lectures.Id
			     join Teachers on Teachers.Id=Lectures.TeacherId
where Teachers.Surname ='Овалова' and
      Teachers.Name = 'Алла'
GO

SELECT LectureRoom.Name as [Название аудиторий]
FROM Teachers join Lectures on Teachers.Id=Lectures.Id
                 join Schedules on LectureId=Schedules.LectureId
				 join LectureRoom on Schedules.LectureRoomId=LectureRoom.Id
WHERE Teachers.Name LIKE 'Геннадий' AND Teachers.Surname LIKE 'Штатный'
go

/*2. Вывести фамилии ассистентов, читающих лекции в группе “F505”.*/
select 
       Teachers.Surname as 'Фамилии ассистентов'
from Assistants join Teachers on Teachers.Id=Assistants.TeacherId
                join Lectures on Lectures.TeacherId=Teachers.Id
				join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
				join Groups on GroupsLectures.GroupId=Groups.Id
where  Assistants.TeacherId <>0 and
       Groups.Name='QA-223'
GO       

/*3. Вывести дисциплины, которые читает преподаватель “Alex Carmack” для групп 5-го курса.*/
select distinct Subjects.Name  as 'Название дисциплины'
from  Subjects join Lectures on Subjects.Id=Lectures.SubjectId
              join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			  join Groups on GroupsLectures.GroupId=Groups.Year
where Groups.Year=5
union all
select Teachers.Name + ' ' + Teachers.Surname as 'Фамилия и имя преподавателя'
from Teachers
where Teachers.Name + ' ' + Teachers.Surname = 'Егор Крылатов'
GO

/*4. Вывести фамилии преподавателей, которые не читают лекции по понедельникам.*/
select  Teachers.Surname as 'Фамилия преподавателя'
from Teachers join Lectures on Teachers.Id=Lectures.TeacherId
              join Schedules on Lectures.Id=Schedules.LectureId
where  Schedules.DayOfWeek<> '1'
GO

/*5. Вывести названия аудиторий, с указанием их корпусов, в которых нет лекций в среду 
второй недели на третьей паре.*/
select LectureRoom.Name as 'Название аудиторий',
       LectureRoom.Building as 'Корпуса'
from LectureRoom join Schedules on LectureRoom.Id=Schedules.LectureRoomId
where EXISTS 
(select * from Schedules where Schedules.DayOfWeek <> 3
and Schedules.Week <> 2
and Schedules.Class <> 3)
GO

/*6. Вывести полные имена преподавателей факультета “Computer Science”, которые не курируют группы кафедры “Software 
Development”.*/
select Teachers.Surname +' '+ Teachers.Name as 'Полные имена преподавателей'
from Teachers join Lectures on Teachers.Id=Lectures.TeacherId
              join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			  join Groups on GroupsLectures.GroupId=Groups.Id
			  join Departments on Groups.DepartmentId=Departments.Id
			  join Faculties on Departments.FacultyId=Faculties.Id
where Faculties.Name = 'Механико-математический факультет'
UNION ALL
select  Teachers.Name + '   ' + Teachers.Surname as 'Полные имена преподавателей'
from Teachers join Curators on Teachers.Id=Curators.TeacherId
              join GroupsCurators on Curators.Id=GroupsCurators.CuratorId
where GroupsCurators.id not like 'Кафедра русского языка и литературы'
GO

/*7. Вывести список номеров всех корпусов, которые имеются в таблицах факультетов, кафедр и аудиторий.*/
select Faculties.Building as 'Корпус факультета',
        Departments.Building as 'Корпус кафедр',
        LectureRoom.Building as 'Корпус аудиторий'
from Faculties join Departments on Faculties.Id=Departments.FacultyId
               join Groups on Groups.DepartmentId=Departments.Id
               join GroupsLectures on Groups.Id=GroupsLectures.GroupId
               join Lectures on Lectures.Id=GroupsLectures.LectureId
               join Schedules on Schedules.LectureId=Lectures.Id
               join LectureRoom on LectureRoom.Id=Schedules.LectureId
GO

/*8. Вывести полные имена преподавателей в следующем порядке: деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты.*/
select 'Декан факультета' as 'Должность', 
        Teachers.Surname + ' ' + Teachers.Name as 'Полное имя преподавателя'
from Teachers   JOIN Deans on Teachers.Id=Deans.TeacherId
                    JOIN Faculties on Deans.Id = Faculties.DeanId
union all
select 'Заведующий кафедры', Teachers.Surname + ' ' + Teachers.Name 
from Teachers  JOIN Deans  on Teachers.Id = Deans.TeacherId
               JOIN Faculties on Deans.Id = Faculties.DeanId
               JOIN Departments  on Faculties.Id = Departments.Id
               JOIN Heads  on Departments.Id = Heads .Id
union all
select 'Преподаватель', Teachers.Surname + ' ' + Teachers.Name 
from Teachers 
union all
select 'Куратор', Teachers.Surname + ' ' + Teachers.Name 
from Teachers JOIN Curators on Teachers.Id = Curators .TeacherId
union all
select 'Ассистент', Teachers.Surname + ' ' + Teachers.Name
from Teachers JOIN Assistants on Teachers.Id = Assistants .TeacherId
GO
       
/*9. Вывести дни недели (без повторений), в которые имеются занятия в аудиториях “A311” и “A104” корпуса 6.*/
select DISTINCT Schedules.DayOfWeek
from LectureRoom join Schedules on LectureRoom .Id=Schedules.LectureRoomId
where LectureRoom.Name in ('С001','С002','С003') and
      LectureRoom.Building = 6
GO
