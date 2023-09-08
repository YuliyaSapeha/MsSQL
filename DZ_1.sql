
/*1 Вывести таблицу кафедр, но расположить ее поля в обратном порядке*/
SELECT Name,Financing, Id 
FROM Departments
GO


/* 2 Вывести названия групп и их рейтинги с уточнением имен полей именем таблицы.*/
SELECT Id as Уникальный_идентификатор_группы, 
       Name as Название_группы,
	   Rating as Рейтинг_группы
	   From Groups 
GO

/*3 Вывести для преподавателей их фамилию, процент ставки по отношению к надбавке и процент ставки по отношению 
к зарплате (сумма ставки и надбавки).*/
Select Surname as Фамилия,
premium as Премия,
Salary * 100 / premium as 'процент ставки по отношению к премии',
Salary * 100 /(Salary + Premium) as 'процент ставки по отношению к зарплате'
From Teachers
GO

/* 4 Вывести таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [faculty] is [dean].”*/
Select ' The dean of faculty ' + Name  + ' is ' + Dean + '.'
From Faculties
GO

/*5 Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050*/
Select
       Surname 
From Teachers
WHERE IsProfessor ='1' 
and  Salary > 1050.00 
GO

/*6 Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000*/
SELECT Name
FROM Departments
WHERE  Financing > 25000 OR Financing <11000
GO

/* 7 Вывести названия факультетов кроме факультета “Computer Science”*/
Select Name
from Faculties
WHERE NOT Name = 'Computer Science'
GO

/* 8 Вывести фамилии и должности преподавателей, которые не являются профессорами.*/
Select Surname, Position
from Teachers
WHERE NOT IsProfessor = '1'
GO


/* 9 Вывести фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550 */

Select 
     Surname,
	 Position,
	 Salary,
	 Premium
from Teachers
WHERE Premium >160 and Premium !>550 
      and IsAssistant = '1'
	  GO
      


 /* 10 Вывести фамилии и ставки ассистентов.*/
	   Select Surname,
	          Salary
	   from Teachers
	   WHERE IsAssistant = '1' 
	   GO

	   /* 11 Вывести фамилии и должности преподавателей, которые были приняты на работу до 01.01.2000 */

Select Surname,
       Position
from Teachers
WHERE EmploymentDate !> '2000.01.01'
GO

/* 12 Вывести названия кафедр, которые в алфавитном порядке  располагаются до кафедры “Software Development”. 
Выводимое поле должно иметь название “Name of Department”*/

Select Name as 'Name of Department'
from Departments
WHERE [Name] < 'Кафедра разработки программного обеспечения'
ORDER BY [Name] ASC
GO



/* 13 Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200*/

Select Surname
from Teachers
WHERE  IsAssistant = '1' and Salary + Premium !> 1200
GO

     
	 /* 14 Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4 */

	 Select Name
	 from Groups
WHERE Rating BETWEEN 2  and 4 
      and Year=5
	  GO
	  

	  /* 15 Вывести фамилии ассистентов со ставкой меньше 550 или  надбавкой меньше 200*/

	  Select Surname 
	  from Teachers
WHERE IsAssistant = '1'
and (Salary<550 OR Premium<200)
GO