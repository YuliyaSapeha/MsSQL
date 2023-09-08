/*������� ������ ����� ������ � �� �������������.*/
select Doctors.Surname + ' '+ Doctors.Name,
       Specializations.Name
from Doctors join DoctorsSpecializations on DoctorsSpecializations.DoctorId=Doctors.Id
             join Specializations on Specializations.Id=DoctorsSpecializations.SpecializationId
go

/*2. ������� ������� � �������� (����� ������ � ��������) ������, ������� �� ��������� � �������.*/
select  Doctors.Surname as '������� ������',
        Doctors.Premium+Doctors.Salary as '��������'
from Doctors join Vacations on Vacations.DoctorId=Doctors.Id
where ( getdate() < StartDate and EndDate > getdate() )
GO

/*3. ������� �������� �����, ������� ��������� � ��������� �Intensive Treatment�.*/
select Wards.Name
FROM Wards JOIN Departments ON Departments.Id=Wards.DepartmentId
WHERE Departments.Name= '����������� �������'
GO

/*4. ������� �������� ��������� ��� ����������, ������� ������������ ��������� �Umbrella Corporation�.*/
SELECT DISTINCT (Departments.Name)
FROM Departments join Donations on Departments.Id=Donations.DepartmentId
                 join Sponsors on Sponsors.Id=Donations.DepartmentId
WHERE Sponsors.Name='Nielsen'
GO

/*5. ������� ��� ������������� �� ��������� ����� � ����: ���������, �������, ����� �������������, ���� �������������.*/
SELECT Id AS '���������',
               SponsorId as '�������',
			   Amount as '����� �������������',
			   Date as '���� �������������'
from  Donations
WHERE DATE >Dateadd (MONTH, -1, Getdate())
GO

/*6. ������� ������� ������ � ��������� ���������, � ������� ��� �������� ������������. ���������� ��������� 
������������, ���������� ������ � ������ ���.*/

select Doctors.Surname as '������� ������',
       Departments.Name as '�������� ���������'
from Doctors join DoctorsExaminations on Doctors.Id=DoctorsExaminations.DoctorId
             join Wards on Wards.Id=DoctorsExaminations.WardId
			 join Departments on Wards.DepartmentId=Departments.Id
where DoctorsExaminations.Dayofweek in (1,2,3,4,5)
GO

/*7. ������� �������� ����� � ������� ���������, � ������� �������� ������������ ���� �Helen Williams�.*/
select Wards.Name as '�������� �����',
       Departments.Building as '������� ���������'
from  Departments  join Wards on Wards.DepartmentId=Departments.Id
                   join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
				   join Doctors on Doctors.Id=DoctorsExaminations.DoctorId
where Doctors.Surname='������' and
	         Doctors.Name='���������'
GO

/*8. ������� �������� ���������, ������� �������� ������������� � ������� ������ 100000, � ��������� �� ������.*/
select Departments.Name as '�������� ���������',
       Doctors.Surname
from Donations join Departments on Departments.Id=Donations.DepartmentId
               join Wards on Departments.Id=Wards.DepartmentId
               join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
			   join Doctors on DoctorsExaminations.DoctorId=Doctors.Id
where Donations.Amount>100000 
GO

/*9. ������� �������� ���������, � ������� ���� ����� �� ���������� ��������.*/
SELECT Departments.Name
FROM Departments join Wards on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
			     join Doctors on DoctorsExaminations.DoctorId=Doctors.Id 
WHERE Doctors.Premium=0
go

/*10. ������� �������� �������������, ������� ������������ ��� ������� ����������� �� �������� ������� ���� 3.*/
select Specializations.Name as '�������� �������������'
from Specializations join Diseases on Specializations.Id=Diseases.SpecializationId
where Diseases.Severity=3
go

/*11. ������� �������� ��������� � �����������, ������������ �� ������� ��� ��������� �� ��������� �������.*/
select Departments.Name as '�������� ���������',
       Diseases.Name as '�������� �����������' 
from Departments join Wards on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
				 join Doctors on Doctors.Id=DoctorsExaminations.DoctorId
				 join DoctorsSpecializations on DoctorsSpecializations.DoctorId=Doctors.Id
				 join Specializations on DoctorsSpecializations.SpecializationId=Specializations.Id
				 join Diseases on Specializations.Id=Diseases.SpecializationId
WHERE  DoctorsExaminations.date > DATEADD( MONTH,-6,GETDATE())
go


/*12. ������� �������� ��������� � �����, � ������� ����������� ������������ �� ������������� ������������*/
select Departments.Name as '������� ���������', 
       Wards.Name as '�������� �����'
From Departments  join Wards  on Wards.DepartmentId=Departments.Id
                  join DoctorsExaminations  on DoctorsExaminations.WardId=Wards.Id
                  join Doctors  on DoctorsExaminations.DoctorId=Doctors.Id
                  join DoctorsSpecializations  on DoctorsSpecializations.DoctorId=Doctors.Id
                  join Specializations  on DoctorsSpecializations.SpecializationId=Specializations.Id
                  join Diseases  on Diseases.SpecializationId=Specializations.Id
Where Diseases.Name='��������'


