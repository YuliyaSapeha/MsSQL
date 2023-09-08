/*1. ������� �������� ���������, � ������� ������ ������ ������������� �Edward Hopper�*/
select 
       LectureRoom.Name as '�������� ���������'
from LectureRoom join Schedules on LectureRoom.Id=Schedules.LectureRoomId
                 join Lectures on Schedules.LectureId=Lectures.Id
			     join Teachers on Teachers.Id=Lectures.TeacherId
where Teachers.Surname ='�������' and
      Teachers.Name = '����'
GO

SELECT LectureRoom.Name as [�������� ���������]
FROM Teachers join Lectures on Teachers.Id=Lectures.Id
                 join Schedules on LectureId=Schedules.LectureId
				 join LectureRoom on Schedules.LectureRoomId=LectureRoom.Id
WHERE Teachers.Name LIKE '��������' AND Teachers.Surname LIKE '�������'
go

/*2. ������� ������� �����������, �������� ������ � ������ �F505�.*/
select 
       Teachers.Surname as '������� �����������'
from Assistants join Teachers on Teachers.Id=Assistants.TeacherId
                join Lectures on Lectures.TeacherId=Teachers.Id
				join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
				join Groups on GroupsLectures.GroupId=Groups.Id
where  Assistants.TeacherId <>0 and
       Groups.Name='QA-223'
GO       

/*3. ������� ����������, ������� ������ ������������� �Alex Carmack� ��� ����� 5-�� �����.*/
select distinct Subjects.Name  as '�������� ����������'
from  Subjects join Lectures on Subjects.Id=Lectures.SubjectId
              join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			  join Groups on GroupsLectures.GroupId=Groups.Year
where Groups.Year=5
union all
select Teachers.Name + ' ' + Teachers.Surname as '������� � ��� �������������'
from Teachers
where Teachers.Name + ' ' + Teachers.Surname = '���� ��������'
GO

/*4. ������� ������� ��������������, ������� �� ������ ������ �� �������������.*/
select  Teachers.Surname as '������� �������������'
from Teachers join Lectures on Teachers.Id=Lectures.TeacherId
              join Schedules on Lectures.Id=Schedules.LectureId
where  Schedules.DayOfWeek<> '1'
GO

/*5. ������� �������� ���������, � ��������� �� ��������, � ������� ��� ������ � ����� 
������ ������ �� ������� ����.*/
select LectureRoom.Name as '�������� ���������',
       LectureRoom.Building as '�������'
from LectureRoom join Schedules on LectureRoom.Id=Schedules.LectureRoomId
where EXISTS 
(select * from Schedules where Schedules.DayOfWeek <> 3
and Schedules.Week <> 2
and Schedules.Class <> 3)
GO

/*6. ������� ������ ����� �������������� ���������� �Computer Science�, ������� �� �������� ������ ������� �Software 
Development�.*/
select Teachers.Surname +' '+ Teachers.Name as '������ ����� ��������������'
from Teachers join Lectures on Teachers.Id=Lectures.TeacherId
              join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			  join Groups on GroupsLectures.GroupId=Groups.Id
			  join Departments on Groups.DepartmentId=Departments.Id
			  join Faculties on Departments.FacultyId=Faculties.Id
where Faculties.Name = '��������-�������������� ���������'
UNION ALL
select  Teachers.Name + '   ' + Teachers.Surname as '������ ����� ��������������'
from Teachers join Curators on Teachers.Id=Curators.TeacherId
              join GroupsCurators on Curators.Id=GroupsCurators.CuratorId
where GroupsCurators.id not like '������� �������� ����� � ����������'
GO

/*7. ������� ������ ������� ���� ��������, ������� ������� � �������� �����������, ������ � ���������.*/
select Faculties.Building as '������ ����������',
������� Departments.Building as '������ ������',
������� LectureRoom.Building as '������ ���������'
from Faculties join Departments on Faculties.Id=Departments.FacultyId
�������������� join Groups on Groups.DepartmentId=Departments.Id
�������������� join GroupsLectures on Groups.Id=GroupsLectures.GroupId
�������������� join Lectures on Lectures.Id=GroupsLectures.LectureId
�������������� join Schedules on Schedules.LectureId=Lectures.Id
�������������� join LectureRoom on LectureRoom.Id=Schedules.LectureId
GO

/*8. ������� ������ ����� �������������� � ��������� �������: ������ �����������, ���������� ���������, �������������, ��������, ����������.*/
select '����� ����������' as '���������',�
������� Teachers.Surname + ' ' + Teachers.Name as '������ ��� �������������'
from Teachers � JOIN Deans on Teachers.Id=Deans.TeacherId
������������������� JOIN Faculties on Deans.Id = Faculties.DeanId
union all
select '���������� �������', Teachers.Surname + ' ' + Teachers.Name�
from Teachers  JOIN Deans  on Teachers.Id = Deans.TeacherId
���������������JOIN Faculties on Deans.Id = Faculties.DeanId
���������������JOIN Departments  on Faculties.Id = Departments.Id
���������������JOIN Heads  on Departments.Id = Heads .Id
union all
select '�������������', Teachers.Surname + ' ' + Teachers.Name�
from Teachers 
union all
select '�������', Teachers.Surname + ' ' + Teachers.Name�
from Teachers JOIN Curators on Teachers.Id = Curators .TeacherId
union all
select '���������', Teachers.Surname + ' ' + Teachers.Name
from Teachers JOIN Assistants on Teachers.Id = Assistants .TeacherId
GO
       
/*9. ������� ��� ������ (��� ����������), � ������� ������� ������� � ���������� �A311� � �A104� ������� 6.*/
select DISTINCT Schedules.DayOfWeek
from LectureRoom join Schedules on LectureRoom .Id=Schedules.LectureRoomId
where LectureRoom.Name in ('�001','�002','�003') and
      LectureRoom.Building = 6
GO
