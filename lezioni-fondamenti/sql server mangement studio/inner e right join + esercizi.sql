/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT (1000) [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      ,[PromotionKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[SalesOrderLineNumber]
      ,[RevisionNumber]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[UnitPriceDiscountPct]
      ,[DiscountAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[CarrierTrackingNumber]
      ,[CustomerPONumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]

select fis.SalesOrderNumber
       ,fis.ProductKey
	   ,dp.EnglishProductName
	   ,fis.OrderQuantity
       ,fis.SalesAmount
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] as fis -- "FactInternetSales tabella a"
inner join [AdventureWorksDW2019].[dbo].[DimProduct] as dp on fis.ProductKey = dp.ProductKey --"DimProduct tabella b"
-- join 'tabella che voglio relazionare' on 'campoPrimaTabella' = (o qualsiasi altra condizione) 'campoSecondaTab.'


select fis.SalesOrderNumber
       ,fis.ProductKey
	   ,dp.EnglishProductName
	   ,fis.OrderQuantity
       ,fis.SalesAmount
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] as fis
right join [AdventureWorksDW2019].[dbo].[DimProduct] as dp on fis.ProductKey = dp.ProductKey


-- stampo solo il nome dei prodotti per i quali non è mai stata effettuata una vendita
select dp.EnglishProductName
	   ,fis.SalesOrderNumber
	   FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] as fis
right join [AdventureWorksDW2019].[dbo].[DimProduct] as dp on fis.ProductKey = dp.ProductKey
where fis.SalesOrderNumber is null



-- stampare solo il numero dell'ordine e il nome della persona che ha fatto l'ordine con la condizione che esista
-- un ordine per un cliente
-- quanti ordini ha eseguito ciascuna persona?
select fis.SalesOrderNumber
		,concat(Customer.FirstName,' ', Customer.LastName) as Full_Name
		,COUNT(fis.SalesOrderNumber) as Tot_Ordini
	    ,Customer.EmailAddress
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] as fis
inner join [AdventureWorksDW2019].[dbo].[DimCustomer] as Customer on fis.CustomerKey = Customer.CustomerKey
group by fis.SalesOrderNumber, Customer.FirstName, Customer.LastName, Customer.EmailAddress
order by Full_Name desc
 -- metodo mio


 --metodo prof
 select Customer.CustomerKey
		,concat(Customer.FirstName,' ', Customer.LastName) as Full_Name
		,COUNT(fis.SalesOrderNumber) as Tot_Ordini
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] as fis
inner join [AdventureWorksDW2019].[dbo].[DimCustomer] as Customer on fis.CustomerKey = Customer.CustomerKey
group by Customer.CustomerKey, Customer.FirstName, Customer.LastName
order by Full_Name  
-- con questo metodo raggruppiamo per nome gli ordini ma dividiamo i nomi uguali di persone diverse


-- esempio di più join in una query
--creare una query che restituisce per ogni riga di ordine
--ordine, nome cliente, nome prodotto, nome gruppo territorio, totale importo riga
select intSales.SalesOrderNumber
	  ,cust.FirstName + ' ' + cust.LastName as full_name
	  ,prod.EnglishProductName as Prod_eng
	  ,salTer.SalesTerritoryGroup as terr_group
	  ,intSales.SalesAmount as tot_sales
from FactInternetSales as intSales
left join DimCustomer as cust on intSales.CustomerKey = cust.CustomerKey --per prendere i nomi dei clienti
left join DimProduct as prod on intSales.ProductKey = prod.ProductKey   -- per prendere i nomi dei prodotti
left join DimSalesTerritory as salTer on intSales.SalesTerritoryKey = salTer.SalesTerritoryKey --per prendere i gruppi di territorio
