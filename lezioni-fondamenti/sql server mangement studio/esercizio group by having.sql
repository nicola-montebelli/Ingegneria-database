/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[TerritoryID]
      ,[BillToAddressID]
      ,[ShipToAddressID]
      ,[ShipMethodID]
      ,[CreditCardID]
      ,[CreditCardApprovalCode]
      ,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[Comment]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  /*scrivere la query che per ogni cliente mi restituisce il numero degli ordini eseguiti*/
  select CustomerID
		,SalesPersonID
  ,COUNT(SalesOrderNumber) as tot_order
  from [AdventureWorks2019].[Sales].[SalesOrderHeader]
  where SalesPersonID is not null
  group by CustomerID, SalesPersonID
  order by CustomerID,SalesPersonID
  

  select *
  from [AdventureWorks2019].[Sales].[SalesOrderHeader]
  --where CustomerID = 11131


  select SalesOrderNumber
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]
  group by SalesOrderNumber
  having count(SalesOrderNumber) > 1 -- metodo tramite group by e having per capire se un campo è una chiave primaria 