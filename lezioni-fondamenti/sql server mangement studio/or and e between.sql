/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]
  
  where FirstName in ('Rob','Brian','Kim');	--con IN è la stessa sotto di sotto ma più comodo
  --where FirstName='Rob' or FirstName = 'Brian' or FirstName='Kim';


  --where FirstName ='Rob' or Title is not null; condizione OR
  --where FirstName='Rob' and Title is not null; condizione AND

  select *
  from Sales.SalesOrderDetail
  where LineTotal >= 4000;
  --line TOT è maggiore o uguale di 4000

  select*
  from Sales.SalesOrderDetail
  where LineTotal <= 5500;
 -- line total è minore o ugule a 5500

 select *
 from Sales.SalesOrderDetail
 where LineTotal between 4000 and 5500;  --si possono usare valori numerici o date
								-- si usa quando i valori inseriti devono considerarsi COMPRESI