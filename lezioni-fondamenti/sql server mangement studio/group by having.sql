/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [SalesOrderID]
      ,[SalesOrderDetailID]
      ,[CarrierTrackingNumber]
      ,[OrderQty]
      ,[ProductID]
      ,[SpecialOfferID]
      ,[UnitPrice]
      ,[UnitPriceDiscount]
      ,[LineTotal]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]

  -- group by
  SELECT SalesOrderID
		-- se aggiungiamo un campo nel select dobbiamo includerlo nel group by
		 ,SUM(LineTotal) as Total		-- somma tutti i valori di 'linetotal'
		 ,COUNT(SalesOrderID) as order_count
		 ,cast(MAX(ModifiedDate) as date) as last_date
  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]
  -- where UnitPrice >= 6	 -- where è una clausola che verifica tutti i record
  group by SalesOrderID  -- raggruppandoli in un solo record identificato da SalesorderID in questo caso
  HAVING SUM(LineTotal) > 4000   --having filtra i risultati già aggregati
  --non si può usare una having se non si è usata una group by