/*1. ������� ���������� �����, ����������� ������� ������ 10.*/
select count (Wards.Id) as '���������� �����'
from Wards
where Places >10
GO

/*2. ������� �������� �������� � ���������� ����� � ������ �� ���.*/
SELECT Departments.Building as '�������� ��������',
       count (Wards.Id) as '���������� �����'
from Departments left join Wards on Wards.DepartmentId=Departments.Id
group by Departments.Building
go

/*3. ������� �������� ��������� � ���������� ����� � ������ �� ���.*/
select Departments.Name as '�������� ���������',
       count (Wards.Id) as '���������� �����'
from Departments join Wards on Departments.Id=Wards.DepartmentId
group by Departments.Name
go

/*4. ������� �������� ��������� � ��������� �������� ������ � ������ �� ���.*/
select Departments.Name as '�������� ��������',
       sum (Doctors.Premium) as '��������� �������� ������'
from Departments join Wards  on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
				 join Doctors on Doctors.Id=DoctorsExaminations.DoctorId
group by Departments.Name
go
                 

/*5. ������� �������� ���������, � ������� �������� ������������ 5 � ����� ������.*/
select Departments.Name as '�������� ���������'
from Departments join Wards on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on Wards.Id=DoctorsExaminations.WardId
GROUP BY Departments.Name
HAVING sum (DoctorsExaminations.ExaminationId) >=5 
go       

/*6. ������� ���������� ������ � �� ��������� �������� (����� ������ � ��������).*/
select COUNT (Doctors.Id) as '���������� ������',
        sum (Doctors.Premium+Doctors.Salary) as '��������� ��������'
from Doctors
go

/*7. ������� ������� �������� (����� ������ � ��������) ������.*/
select AVG (Doctors.Premium+Doctors.Salary) as '������� �������� ������'
from Doctors
go 

/*8. ������� �������� ����� � ����������� ����������������.*/
select Name as '�������� ������', MIN (Places) as '�����������'
from Wards
where Places= (select min(Places) from Wards)
group by Wards.Name
go

/*9. ������� � ����� �� �������� 1, 6, 7 � 8, ��������� ���������� ���� � ������� ��������� 100. ��� ���� ��������� 
������ ������ � ����������� ���� ������ 10*/
SELECT Departments.Building as '������', SUM(Wards.Places) AS '���������� ����'
FROM  Wards	 join Departments on Wards.DepartmentId=Departments.Id
WHERE Departments.Building IN (1, 6, 7, 8)  
GROUP BY Departments.Building, Wards.Places
HAVING SUM (Wards.Places) > 100 and Wards.Places > 10