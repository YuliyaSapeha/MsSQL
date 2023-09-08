
/*1 ������� ������� ������, �� ����������� �� ���� � �������� �������*/
SELECT Name,Financing, Id 
FROM Departments
GO


/* 2 ������� �������� ����� � �� �������� � ���������� ���� ����� ������ �������.*/
SELECT Id as ����������_�������������_������, 
       Name as ��������_������,
	   Rating as �������_������
	   From Groups 
GO

/*3 ������� ��� �������������� �� �������, ������� ������ �� ��������� � �������� � ������� ������ �� ��������� 
� �������� (����� ������ � ��������).*/
Select Surname as �������,
premium as ������,
Salary * 100 / premium as '������� ������ �� ��������� � ������',
Salary * 100 /(Salary + Premium) as '������� ������ �� ��������� � ��������'
From Teachers
GO

/* 4 ������� ������� ����������� � ���� ������ ���� � ��������� �������: �The dean of faculty [faculty] is [dean].�*/
Select ' The dean of faculty ' + Name  + ' is ' + Dean + '.'
From Faculties
GO

/*5 ������� ������� ��������������, ������� �������� ������������ � ������ ������� ��������� 1050*/
Select
       Surname 
From Teachers
WHERE IsProfessor ='1' 
and  Salary > 1050.00 
GO

/*6 ������� �������� ������, ���� �������������� ������� ������ 11000 ��� ������ 25000*/
SELECT Name
FROM Departments
WHERE  Financing > 25000 OR Financing <11000
GO

/* 7 ������� �������� ����������� ����� ���������� �Computer Science�*/
Select Name
from Faculties
WHERE NOT Name = 'Computer Science'
GO

/* 8 ������� ������� � ��������� ��������������, ������� �� �������� ������������.*/
Select Surname, Position
from Teachers
WHERE NOT IsProfessor = '1'
GO


/* 9 ������� �������, ���������, ������ � �������� �����������, � ������� �������� � ��������� �� 160 �� 550 */

Select 
     Surname,
	 Position,
	 Salary,
	 Premium
from Teachers
WHERE Premium >160 and Premium !>550 
      and IsAssistant = '1'
	  GO
      


 /* 10 ������� ������� � ������ �����������.*/
	   Select Surname,
	          Salary
	   from Teachers
	   WHERE IsAssistant = '1' 
	   GO

	   /* 11 ������� ������� � ��������� ��������������, ������� ���� ������� �� ������ �� 01.01.2000 */

Select Surname,
       Position
from Teachers
WHERE EmploymentDate !> '2000.01.01'
GO

/* 12 ������� �������� ������, ������� � ���������� �������  ������������� �� ������� �Software Development�. 
��������� ���� ������ ����� �������� �Name of Department�*/

Select Name as 'Name of Department'
from Departments
WHERE [Name] < '������� ���������� ������������ �����������'
ORDER BY [Name] ASC
GO



/* 13 ������� ������� �����������, ������� �������� (����� ������ � ��������) �� ����� 1200*/

Select Surname
from Teachers
WHERE  IsAssistant = '1' and Salary + Premium !> 1200
GO

     
	 /* 14 ������� �������� ����� 5-�� �����, ������� ������� � ��������� �� 2 �� 4 */

	 Select Name
	 from Groups
WHERE Rating BETWEEN 2  and 4 
      and Year=5
	  GO
	  

	  /* 15 ������� ������� ����������� �� ������� ������ 550 ���  ��������� ������ 200*/

	  Select Surname 
	  from Teachers
WHERE IsAssistant = '1'
and (Salary<550 OR Premium<200)
GO