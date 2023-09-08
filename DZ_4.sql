/*1. ������� �������� �����������, ���� �������������� ������ ������� ��������� ���� �������������� ���������� */
Select Faculties.Name
FROM Faculties join Departments  on Faculties.Id=Departments.FacultyId
where Departments.Financing > Faculties.Financing
    go          

    
	
/*2. ������� ������� ��������� ����� � �������� �����, ������� ��� ��������.*/
Select
       Curators.Surname,
	   Groups.Name
from 
      Curators  join GroupsCurators on GroupsCurators.CuratorId=Curators.Id
	            join Groups on Curators.Id=Groups.Id
go
/*3. ������� ����� � ������� ��������������, ������� ������ ������ � ������ �P107�.*/
select 
         Teachers.Name,
		 Teachers.Surname,
		 Groups.Name
from  Teachers join Lectures on Teachers.Id=Lectures.TeacherId
               join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			   join Groups on Groups.Id=GroupsLectures.GroupId
where   Groups.Name ='���'
GO
          
/*4. ������� ������� �������������� � �������� ����������� �� ������� ��� ������ ������.*/
select 
       Teachers.Surname,
	   Faculties.Name
from Teachers join Lectures on Teachers.Id=Lectures.TeacherId
              join GroupsLectures on GroupsLectures.LectureId=Lectures.Id
			  join Groups on Groups.Id=GroupsLectures.GroupId
			  join Departments on Groups.DepartmentId=Departments.Id
			  join Faculties on Departments.FacultyId=Faculties.Id
GO

            
/*5. ������� �������� ������ � �������� �����, ������� � ��� ���������.*/
select 
       Departments.Name AS '�������� �������',
	   Groups.Name AS '�������� ������'
from 
     Departments join Groups on Departments.Id=Groups.DepartmentId

GO


/*6. ������� �������� ���������, ������� ������ ������������� �Samantha Adams�.*/
select 
       Subjects.Name
from	
      Subjects join Lectures on Subjects.Id=Lectures.SubjectId
	           join Teachers on Teachers.Id=Lectures.TeacherId
where
      Teachers.Surname = '���������' and Teachers.Name='����'
 GO

/*7. ������� �������� ������, �� ������� �������� ���������� �Database Theory�.*/
select 
       Departments.Name as '�������� �������'
from
     Departments join Groups on Departments.Id=Groups.DepartmentId
	             join GroupsLectures on  Groups.Id=GroupsLectures.GroupId
				 join Lectures on GroupsLectures.LectureId=Lectures.Id
				 join Subjects on Subjects.Id=Lectures.SubjectId
where
      Subjects.Name like'������� %'
	  GO

/*8. ������� �������� �����, ������� ��������� � ���������� �Computer Science�.*/
select 
       Groups.Name as '�������� �����'
from 
     Groups join Departments on Groups.DepartmentId=Departments.Id
	        join Faculties on Departments.FacultyId=Faculties.Id
where
       Faculties.Name = '������������� ���������'
	   GO

/*9. ������� �������� ����� 5-�� �����, � ����� �������� �����������, � ������� ��� ���������.*/
select 
       Groups.Name as '�������� �����',
	   Faculties.Name as '�������� �����������'
from 
      Groups join Departments on Groups.DepartmentId=Departments.Id
	         join Faculties on Departments.FacultyId=Faculties.Id
where
        Groups.Year=5 
go

/*10. ������� ������ ����� �������������� � ������, ������� ��� ������ (�������� ��������� � �����), ������ �������� 
������ �� ������, ������� �������� � ��������� �B103�.*/

select Teachers.Name +' '+ Teachers.Surname as '�������������',
       Subjects.Name as '����������',
	   Groups.Name as '������'
from
      Teachers join Lectures on Lectures.TeacherId=Teachers.Id
	           join Subjects on Lectures.SubjectId=Subjects.Id
			   join GroupsLectures on Lectures.Id=GroupsLectures.LectureId
			   join Groups on Groups.Id=GroupsLectures.GroupId
where
      Lectures.LectureRoom='��������� �������� � ���������'
	  GO
