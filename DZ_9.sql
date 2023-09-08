/*1. Показать все книги, количество страниц в которых больше 500, но меньше 650.*/
select Books.Name as 'Название книги'
from Books
where Books.Pages > 500 and  Books.Pages<650
go

/*2. Показать все книги, в которых первая буква названия либо «А», либо «З».*/
select Books.Name
from Books 
where Books.Name like  'А%' or  Books.Name like 'З%'
go 

/*3. Показать все книги жанра «Детектив», количество проданных книг более 30 экземпляров.*/
select Books.Name
from Sales join Books on Sales.BookId=Books.Id
           join Themes on Themes.Id=Books.ThemeId
where Themes.Name= 'Детектив' and Sales.Quantity>30
go 


/*4. Показать все книги, в названии которых есть слово «Microsoft», но нет слова «Windows».*/
select Books.Name 
from Books
where Books.Name like '%Microsoft%' and Books.Name not like '%Windows%'
go

/*5. Показать все книги (название, тематика, полное имя автора в одной ячейке), цена одной страницы которых меньше 
65 копеек.*/
select Books.Name + ' '+ Themes.Name + ' ' + Authors.Surname + ' ' + Authors.Name as 'Название Тематка Полное имя Автора'
from Themes join Books on Themes.Id=Books.ThemeId
            join Authors on Authors.Id=Books.AuthorId
where (Books.Price/Books.Pages)<0.65
go

/*6. Показать все книги, название которых состоит из 4 слов.*/
select Books.Name
from Books
where Books.Name like '% % % %' and Books.Name not like '% % % % %'
go

/*7. Показать информацию о продажах в следующем виде:
▷ Название книги, но, чтобы оно не содержало букву «А».
▷ Тематика, но, чтобы не «Программирование».
▷ Автор, но, чтобы не «Герберт Шилдт».
▷ Цена, но, чтобы в диапазоне от 10 до 20 гривен.
▷ Количество продаж, но не менее 8 книг.
▷ Название магазина, который продал книгу, но он не 
должен быть в Украине или России.*/
select Books.Name, Themes.Name, Authors.Name+' '+Authors.Surname, Sales.Price, Sales.Quantity, Shops.name
From Themes join Books on Themes.id=Books.Themeid
            join Sales on Sales.Bookid=Books.id
            join Shops on Shops.id=Sales.Shopid
		    join Countries on Countries.id=Shops.Countryid
		    join Authors on Countries.id=Authors.Countryid
Where Books.name not like '%А%' and Themes.name 
     not like 'Приключения' and Authors.name+' '+Authors.Surname not like 'Кир Булычев'
        and Sales.Price between 300 and 850 and Sales.Quantity >=6 
		and not Countries.name = 'Украина' and not  Countries.name='Россия'
  go

/*8. Показать следующую информацию в два столбца (числа в правом столбце приведены в качестве примера):
▷ Количество авторов: 14
▷ Количество книг: 47
▷ Средняя цена продажи: 85.43 грн.
▷ Среднее количество страниц: 650.6.*/
select  'Количество авторов',
      count (Authors.Surname+ ' '+ Authors.Name)
from Authors
union 
select 'Количество книг',
       count (Books.Name)
from Books
union 
     select 'Средняя цена продажи', 
	 avg (Books.Price)
from Books
union 
select 'Среднее количество страниц',
       avg (Books.Pages)
from Books    
go

/*9. Показать тематики книг и сумму страниц всех книг по каждой из книг.*/
select Themes.Name as 'Тематика книги', 
        sum (Books.Pages) as 'Сумма страниц в книге'
from Books join Themes on Books.ThemeId=Themes.Id
GROUP BY Themes.Name
go

/*10. Показать количество всех книг и сумму страниц этих книг по каждому из авторов.*/
select Authors.Name + ' '+Authors.Surname as 'Автор книги',
       count (Books.Name) as 'Количество книг',
       sum (Books.Pages) as 'Сумма страниц'
from Books join Authors on Books.AuthorId=Authors.Id
GROUP BY Authors.Surname, 
         Authors.Name
go

/*11. Показать книгу тематики «Программирование» с наибольшим количеством страниц.*/
select TOP 1 COUNT (Books.Pages),
             Books.Name as 'Название книги',
			 Books.Pages as 'Количество страниц'
from Books join Themes on Books.ThemeId=Themes.Id
where Themes.Name='Программирование' 
GROUP BY Books.Name,Books.Pages
ORDER BY Books.Pages  DESC 
go

/*12. Показать среднее количество страниц по каждой тематике, которое не превышает 400.*/
select avg (Books.Pages) as 'Среднее количество страниц',
           Themes.Name as 'Название тематики книги'
from Books join Themes on Books.ThemeId=Themes.Id
where Books.Pages < 400
GROUP BY Themes.Name
go

/*13. Показать сумму страниц по каждой тематике, учитывая только книги с количеством страниц более 400, и чтобы 
тематики были «Программирование», «Администрирование» и «Дизайн».*/
select SUM (Books.Pages) as 'Сумма страниц по тематике книг', 
       Themes.Name as 'Название тематики книг'
from Books join Themes on Books.ThemeId=Themes.Id
where Books.Pages > 400 and  Themes.Name in('Программирование','Администрирование','Дизайн')
 GROUP BY   Themes.Name
 go

/*14. Показать информацию о работе магазинов: что, где, кем, когда и в каком количестве было продано.*/
select Books.Name as 'Наименование книги', 
       Countries.Name as 'Страна продажи', 
	   Shops.Name as 'Наименование магазина', 
	   Sales.SaleDate as 'Дата продажи', 
	   Sales.Quantity as 'Количество проданных экземпляров'
from Books join Sales on Books.Id=Sales.BookId
           join Shops on Sales.ShopId=Shops.Id
		   join Countries on Shops.CountryId=Countries.Id
go

/*15. Показать самый прибыльный магазин.*/
select TOP 1  (Sales.Price*Sales.Quantity) as 'Выручка',
       Shops.Name as 'Название магазина'
From Sales join Shops on Sales.ShopId=Shops.Id
ORDER BY  (Sales.Price*Sales.Quantity) DESC 
go

