/*Вывести полные имена врачей и их специализации.*/
select Doctors.Surname + ' '+ Doctors.Name,
       Specializations.Name
from Doctors join DoctorsSpecializations on DoctorsSpecializations.DoctorId=Doctors.Id
             join Specializations on Specializations.Id=DoctorsSpecializations.SpecializationId
go

/*2. Вывести фамилии и зарплаты (сумма ставки и надбавки) врачей, которые не находятся в отпуске.*/
select  Doctors.Surname as 'Фамилии врачей',
        Doctors.Premium+Doctors.Salary as 'Зарплаты'
from Doctors join Vacations on Vacations.DoctorId=Doctors.Id
where ( getdate() < StartDate and EndDate > getdate() )
GO

/*3. Вывести названия палат, которые находятся в отделении “Intensive Treatment”.*/
select Wards.Name
FROM Wards JOIN Departments ON Departments.Id=Wards.DepartmentId
WHERE Departments.Name= 'ИНТЕНСИВНОЙ ТЕРАПИИ'
GO

/*4. Вывести названия отделений без повторений, которые спонсируются компанией “Umbrella Corporation”.*/
SELECT DISTINCT (Departments.Name)
FROM Departments join Donations on Departments.Id=Donations.DepartmentId
                 join Sponsors on Sponsors.Id=Donations.DepartmentId
WHERE Sponsors.Name='Nielsen'
GO

/*5. Вывести все пожертвования за последний месяц в виде: отделение, спонсор, сумма пожертвования, дата пожертвования.*/
SELECT Id AS 'Отделение',
               SponsorId as 'Спонсор',
			   Amount as 'Сумма пожертвования',
			   Date as 'Дата пожертвования'
from  Donations
WHERE DATE >Dateadd (MONTH, -1, Getdate())
GO

/*6. Вывести фамилии врачей с указанием отделений, в которых они проводят обследования. Необходимо учитывать 
обследования, проводимые только в будние дни.*/

select Doctors.Surname as 'Фамилии врачей',
       Departments.Name as 'Название отделений'
from Doctors join DoctorsExaminations on Doctors.Id=DoctorsExaminations.DoctorId
             join Wards on Wards.Id=DoctorsExaminations.WardId
			 join Departments on Wards.DepartmentId=Departments.Id
where DoctorsExaminations.Dayofweek in (1,2,3,4,5)
GO

/*7. Вывести названия палат и корпуса отделений, в которых проводит обследования врач “Helen Williams”.*/
select Wards.Name as 'Названия палат',
       Departments.Building as 'Корпуса отделений'
from  Departments  join Wards on Wards.DepartmentId=Departments.Id
                   join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
				   join Doctors on Doctors.Id=DoctorsExaminations.DoctorId
where Doctors.Surname='Петров' and
	         Doctors.Name='Александр'
GO

/*8. Вывести названия отделений, которые получали пожертвование в размере больше 100000, с указанием их врачей.*/
select Departments.Name as 'Названия отделений',
       Doctors.Surname
from Donations join Departments on Departments.Id=Donations.DepartmentId
               join Wards on Departments.Id=Wards.DepartmentId
               join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
			   join Doctors on DoctorsExaminations.DoctorId=Doctors.Id
where Donations.Amount>100000 
GO

/*9. Вывести названия отделений, в которых есть врачи не получающие надбавки.*/
SELECT Departments.Name
FROM Departments join Wards on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
			     join Doctors on DoctorsExaminations.DoctorId=Doctors.Id 
WHERE Doctors.Premium=0
go

/*10. Вывести названия специализаций, которые используются для лечения заболеваний со степенью тяжести выше 3.*/
select Specializations.Name as 'Название специализаций'
from Specializations join Diseases on Specializations.Id=Diseases.SpecializationId
where Diseases.Severity=3
go

/*11. Вывести названия отделений и заболеваний, обследования по которым они проводили за последние полгода.*/
select Departments.Name as 'Названия отделений',
       Diseases.Name as 'Названия заболеваний' 
from Departments join Wards on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
				 join Doctors on Doctors.Id=DoctorsExaminations.DoctorId
				 join DoctorsSpecializations on DoctorsSpecializations.DoctorId=Doctors.Id
				 join Specializations on DoctorsSpecializations.SpecializationId=Specializations.Id
				 join Diseases on Specializations.Id=Diseases.SpecializationId
WHERE  DoctorsExaminations.date > DATEADD( MONTH,-6,GETDATE())
go


/*12. Вывести названия отделений и палат, в которых проводились обследования по заразительным заболеваниям*/
select Departments.Name as 'Назвние отделений', 
       Wards.Name as 'Название палат'
From Departments  join Wards  on Wards.DepartmentId=Departments.Id
                  join DoctorsExaminations  on DoctorsExaminations.WardId=Wards.Id
                  join Doctors  on DoctorsExaminations.DoctorId=Doctors.Id
                  join DoctorsSpecializations  on DoctorsSpecializations.DoctorId=Doctors.Id
                  join Specializations  on DoctorsSpecializations.SpecializationId=Specializations.Id
                  join Diseases  on Diseases.SpecializationId=Specializations.Id
Where Diseases.Name='Ветрянка'


