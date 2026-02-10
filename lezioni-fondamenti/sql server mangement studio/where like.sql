/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT [ProductID]
      ,[Name]
      ,[ProductNumber]
      ,[MakeFlag]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[StandardCost]
      ,[ListPrice]
      ,[Size]
      ,[SizeUnitMeasureCode]
      ,[WeightUnitMeasureCode]
      ,[Weight]
      ,[DaysToManufacture]
      ,[ProductLine]
      ,[Class]
      ,[Style]
      ,[ProductSubcategoryID]
      ,[ProductModelID]
      ,[SellStartDate]
      ,[SellEndDate]
      ,[DiscontinuedDate]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Production].[Product]
  where name like '%60';  --cerca tutto ciò che finisce per 60
  
  --where name like 'ML%';	--cerca tutto ciò che inizia per ML


  --where name like '%frame%';  --trova e restituisce i campi che hanno la parola frame nel nome in qualunque punto(%parola%)

