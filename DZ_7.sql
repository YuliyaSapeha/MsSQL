/*1. Вывести количество палат, вместимость которых больше 10.*/
select count (Wards.Id) as 'Количество палат'
from Wards
where Places >10
GO

/*2. Вывести названия корпусов и количество палат в каждом из них.*/
SELECT Departments.Building as 'Названия корпусов',
       count (Wards.Id) as 'Количество палат'
from Departments left join Wards on Wards.DepartmentId=Departments.Id
group by Departments.Building
go

/*3. Вывести названия отделений и количество палат в каждом из них.*/
select Departments.Name as 'Название отделений',
       count (Wards.Id) as 'Количество палат'
from Departments join Wards on Departments.Id=Wards.DepartmentId
group by Departments.Name
go

/*4. Вывести названия отделений и суммарную надбавку врачей в каждом из них.*/
select Departments.Name as 'Название отделний',
       sum (Doctors.Premium) as 'Суммарная надбавка врачей'
from Departments join Wards  on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on DoctorsExaminations.WardId=Wards.Id
				 join Doctors on Doctors.Id=DoctorsExaminations.DoctorId
group by Departments.Name
go
                 

/*5. Вывести названия отделений, в которых проводят обследования 5 и более врачей.*/
select Departments.Name as 'Названия отделений'
from Departments join Wards on Departments.Id=Wards.DepartmentId
                 join DoctorsExaminations on Wards.Id=DoctorsExaminations.WardId
GROUP BY Departments.Name
HAVING sum (DoctorsExaminations.ExaminationId) >=5 
go       

/*6. Вывести количество врачей и их суммарную зарплату (сумма ставки и надбавки).*/
select COUNT (Doctors.Id) as 'Количество врачей',
        sum (Doctors.Premium+Doctors.Salary) as 'Суммарная зарплата'
from Doctors
go

/*7. Вывести среднюю зарплату (сумма ставки и надбавки) врачей.*/
select AVG (Doctors.Premium+Doctors.Salary) as 'Средняя зарплата врачей'
from Doctors
go 

/*8. Вывести названия палат с минимальной вместительностью.*/
select Name as 'Название палаты', MIN (Places) as 'Вместимость'
from Wards
where Places= (select min(Places) from Wards)
group by Wards.Name
go

/*9. Вывести в каких из корпусов 1, 6, 7 и 8, суммарное количество мест в палатах превышает 100. При этом учитывать 
только палаты с количеством мест больше 10*/
SELECT Departments.Building as 'Корпус', SUM(Wards.Places) AS 'Количество мест'
FROM  Wards	 join Departments on Wards.DepartmentId=Departments.Id
WHERE Departments.Building IN (1, 6, 7, 8)  
GROUP BY Departments.Building, Wards.Places
HAVING SUM (Wards.Places) > 100 and Wards.Places > 10