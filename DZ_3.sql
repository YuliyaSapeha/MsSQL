/* 1. Вывести содержимое таблицы палат.*/
select *
from Wards
GO

/* 2. Вывести фамилии и телефоны всех врачей.*/
select Surname , Phone
from Doctors
GO

/* 3. Вывести все этажи без повторений, на которых располагаются палаты.*/
select DISTINCT Floor
FROM Wards
GO

/* 4. Вывести названия заболеваний под именем “Name of Disease” и степень их тяжести под именем “Severity of Disease”.*/
SELECT Name as 'Name of Disease' ,Severity as ' Severity of Disease'
FROM Diseases
GO

/* 5. Использовать выражение FROM для любых трех таблиц базы данных, используя для них псевдонимы.*/
SELECT *
FROM Departmnets AS De
GO

SELECT *
FROM Diseases AS Di
GO

SELECT *
FROM Wards AS WA
GO

/* 6. Вывести названия отделений, расположенных в корпусе 5 и имеющих фонд финансирования менее 30000.*/
SELECT Name
FROM Departmnets
WHERE Building = 5 AND  Financing < 30000
GO

/* 7. Вывести названия отделений, расположенных в 3-м корпусе с фондом финансирования в диапазоне от 12000 до 15000*/
SELECT Name
FROM Departmnets
WHERE Financing BETWEEN  12000 AND 15000 and Building = 3
GO

/* 8. Вывести названия палат, расположенных в корпусах 4 и 5 на 1-м этаже*/
Select
       Name
	   From Wards
	   where (Building =4 or Building=5) and Floor=1
	   GO

/* 9. Вывести названия, корпуса и фонды финансирования отделений, расположенных в корпусах 3 или 6 и имеющих 
фонд финансирования меньше 11000 или больше 25000*/
select 
       Name,
	   Building,
	   Financing
	   FROM Departmnets
	   where (Building = '3'or Building = '6') and (Financing < 11000 or Financing>25000)
	   GO


/* 10. Вывести фамилии врачей, чья зарплата (сумма ставки и надбавки) превышает 1500.*/
select 
       Surname
	   from Doctors
	   where (Premium + Salary) >15000
	   GO

/* 11.  Вывести фамилии врачей, у которых половина зарплаты превышает троекратную надбавку.*/
SELECT 
      Surname
	  FROM Doctors
where (Premium + Salary)/2 > (premium*3)
GO



/*12. Вывести названия обследований без повторений, проводимых в первые три дня недели с 12:00 до 15:00*/
SELECT DISTINCT
       Name 
	  FROM Examinations
	  WHERE DayOfWeek IN ('1','2','3') AND (StartTime >='12:00:00' AND  StartTime !>'15:00:00') 
	  GO




/* 13. Вывести названия и номера корпусов отделений, расположенных в корпусах 1, 3, 8 или 10.*/
SELECT 
      Name,Building
	  FROM Departmnets
	   WHERE Building in ('1','3','8','10')
	   GO

/* 14. Вывести названия заболеваний всех степеней тяжести, кроме 1-й и 2-й. */
SELECT 
        Name, Severity
		 FROM Diseases
   WHERE  Severity NOT IN ('1','2')
   GO

   /* 15 Вывести названия отделений, которые не располагаются в 1-м или 3-м корпусе.*/
   SELECT
           Name
   FROM Departmnets
   WHERE Building NOT IN ('1','3')
   GO
/*16. Вывести названия отделений, которые располагаются в 1-м или 3-м корпусе.*/
select 
      Name
	  from Departmnets
	   WHERE Building=1 or Building=3
	   GO


/*17. Вывести фамилии врачей, начинающиеся на букву “П”*/
SELECT 
      Surname
	  FROM Doctors
	  WHERE Surname LIKE '[П]%'
	  GO