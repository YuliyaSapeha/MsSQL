/*1*/
SELECT Name, 
      Surname
FROM Teachers
GO

/*2*/
SELECT Name, 
        Surname, 
		EmploymentDate,
        Premium, 
		Position
FROM Teachers
GO

/*3*/
SELECT *
FROM Teachers
GO

/*4*/
SELECT Name +' '+ Surname AS FullName,
       EmploymentDate,
	   Salary, 
	   Position
FROM Teachers
GO

/*5*/
SELECT Name +' '+ Surname AS FullName,
Salary*1.2 AS [Plus 20 persent]
FROM Teachers
GO

/*6*/
SELECT ' Surname '  + Name + ' receives'  +
CAST(Salary AS nvarchar(10))
FROM Teachers
GO

/*7*/
SELECT ' Surname '  + Name + ' receives'   +
CONVERT(nvarchar(10), Salary)
FROM Teachers
GO

/*8*/
SELECT TOP 2 Surname, 
             Name, 
			 EmploymentDate
FROM Teachers
GO

/*9*/
SELECT TOP 20 PERCENT Surname, 
             Name, 
			 EmploymentDate
FROM Teachers
GO

/*10*/
SELECT DISTINCT Name
FROM Teachers
GO

/*11*/
SELECT Name, Salary
FROM Teachers
WHERE Salary > 1000
GO

/*12*/
SELECT Id, 
       Name, 
	   Salary, 
	   EmploymentDate, 
	   Salary, 
	   Position
FROM Teachers
WHERE LEN(Name) !> 4
GO

/*13*/
SELECT Name, 
       Surname, 
	   EmploymentDate
FROM Teachers
WHERE MONTH(EmploymentDate) >= 9 AND MONTH(EmploymentDate) <= 11
GO

/*14*/
SELECT Name, 
       Surname, 
	   EmploymentDate
FROM Teachers
WHERE YEAR(EmploymentDate) % 2 = 0 OR DAY(EmploymentDate) % 2 <> 0
GO

/*15*/
SELECT Name, 
       Surname, 
	   Premium
FROM Teachers
WHERE Premium IS NULL
GO

/*16*/
SELECT Id,
       Surname, 
	   Name, 
	   EmploymentDate, 
	   Premium,
	   Position
FROM Teachers
WHERE NOT Name = '¿ÀÀ¿'
GO

/*17*/
SELECT Name, 
       Surname, 
	   Premium
FROM Teachers
WHERE Premium IS NOT NULL
GO

/*18*/
SELECT Name, 
       Surname
FROM Teachers
ORDER BY Name ASC 
GO

/*19*/
SELECT Name, 
       Surname
FROM Teachers
ORDER BY Name  DESC 
GO

/*20*/
SELECT Name, 
       Surname,
	   EmploymentDate
FROM Teachers
ORDER BY EmploymentDate
GO

/*21*/
SELECT  Name, 
       Surname,
	   EmploymentDate
FROM Teachers
ORDER BY Surname DESC,Name ASC
GO