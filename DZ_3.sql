/* 1. ������� ���������� ������� �����.*/
select *
from Wards
GO

/* 2. ������� ������� � �������� ���� ������.*/
select Surname , Phone
from Doctors
GO

/* 3. ������� ��� ����� ��� ����������, �� ������� ������������� ������.*/
select DISTINCT Floor
FROM Wards
GO

/* 4. ������� �������� ����������� ��� ������ �Name of Disease� � ������� �� ������� ��� ������ �Severity of Disease�.*/
SELECT Name as 'Name of Disease' ,Severity as ' Severity of Disease'
FROM Diseases
GO

/* 5. ������������ ��������� FROM ��� ����� ���� ������ ���� ������, ��������� ��� ��� ����������.*/
SELECT *
FROM Departmnets AS De
GO

SELECT *
FROM Diseases AS Di
GO

SELECT *
FROM Wards AS WA
GO

/* 6. ������� �������� ���������, ������������� � ������� 5 � ������� ���� �������������� ����� 30000.*/
SELECT Name
FROM Departmnets
WHERE Building = 5 AND  Financing < 30000
GO

/* 7. ������� �������� ���������, ������������� � 3-� ������� � ������ �������������� � ��������� �� 12000 �� 15000*/
SELECT Name
FROM Departmnets
WHERE Financing BETWEEN  12000 AND 15000 and Building = 3
GO

/* 8. ������� �������� �����, ������������� � �������� 4 � 5 �� 1-� �����*/
Select
       Name
	   From Wards
	   where (Building =4 or Building=5) and Floor=1
	   GO

/* 9. ������� ��������, ������� � ����� �������������� ���������, ������������� � �������� 3 ��� 6 � ������� 
���� �������������� ������ 11000 ��� ������ 25000*/
select 
       Name,
	   Building,
	   Financing
	   FROM Departmnets
	   where (Building = '3'or Building = '6') and (Financing < 11000 or Financing>25000)
	   GO


/* 10. ������� ������� ������, ��� �������� (����� ������ � ��������) ��������� 1500.*/
select 
       Surname
	   from Doctors
	   where (Premium + Salary) >15000
	   GO

/* 11.  ������� ������� ������, � ������� �������� �������� ��������� ����������� ��������.*/
SELECT 
      Surname
	  FROM Doctors
where (Premium + Salary)/2 > (premium*3)
GO



/*12. ������� �������� ������������ ��� ����������, ���������� � ������ ��� ��� ������ � 12:00 �� 15:00*/
SELECT DISTINCT
       Name 
	  FROM Examinations
	  WHERE DayOfWeek IN ('1','2','3') AND (StartTime >='12:00:00' AND  StartTime !>'15:00:00') 
	  GO




/* 13. ������� �������� � ������ �������� ���������, ������������� � �������� 1, 3, 8 ��� 10.*/
SELECT 
      Name,Building
	  FROM Departmnets
	   WHERE Building in ('1','3','8','10')
	   GO

/* 14. ������� �������� ����������� ���� �������� �������, ����� 1-� � 2-�. */
SELECT 
        Name, Severity
		 FROM Diseases
   WHERE  Severity NOT IN ('1','2')
   GO

   /* 15 ������� �������� ���������, ������� �� ������������� � 1-� ��� 3-� �������.*/
   SELECT
           Name
   FROM Departmnets
   WHERE Building NOT IN ('1','3')
   GO
/*16. ������� �������� ���������, ������� ������������� � 1-� ��� 3-� �������.*/
select 
      Name
	  from Departmnets
	   WHERE Building=1 or Building=3
	   GO


/*17. ������� ������� ������, ������������ �� ����� �ϔ*/
SELECT 
      Surname
	  FROM Doctors
	  WHERE Surname LIKE '[�]%'
	  GO