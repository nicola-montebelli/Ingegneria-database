/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [ProductKey]
      ,[ProductAlternateKey]
      ,[ProductSubcategoryKey]
      ,[WeightUnitMeasureCode]
      ,[SizeUnitMeasureCode]
      ,[EnglishProductName]
      ,[SpanishProductName]
      ,[FrenchProductName]
      ,[StandardCost]
      ,[FinishedGoodsFlag]
      ,[Color]
      ,[SafetyStockLevel]
      ,[ReorderPoint]
      ,[ListPrice]
      ,[Size]
      ,[SizeRange]
      ,[Weight]
      ,[DaysToManufacture]
      ,[ProductLine]
      ,[DealerPrice]
      ,[Class]
      ,[Style]
      ,[ModelName]
      ,[LargePhoto]
      ,[EnglishDescription]
      ,[FrenchDescription]
      ,[ChineseDescription]
      ,[ArabicDescription]
      ,[HebrewDescription]
      ,[ThaiDescription]
      ,[GermanDescription]
      ,[JapaneseDescription]
      ,[TurkishDescription]
      ,[StartDate]
      ,[EndDate]
      ,[Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct]

select prod.EnglishProductName as prodEng
		,subCat.EnglishProductSubcategoryName as subCatEng
FROM [AdventureWorksDW2019].[dbo].[DimProduct] as prod
inner join [AdventureWorksDW2019].[dbo].[DimProductSubcategory] as subCat
			on prod.ProductSubcategoryKey = subCat.ProductSubcategoryKey


select prod.EnglishProductName as Product
		,subCat.EnglishProductSubcategoryName as subName
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] as prod
  left join [AdventureWorksDW2019].[dbo].[DimProductSubcategory] as subCat
  on prod.ProductSubcategoryKey = subCat.ProductSubcategoryKey


