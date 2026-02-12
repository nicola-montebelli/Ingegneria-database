/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT [ProductKey]
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

--per ciascun prodotto avere la categoria di appartenenza 
select prod.EnglishProductName as prod_eng
		,subCat.EnglishProductSubcategoryName as subCatEng
		,cat.EnglishProductCategoryName as CatEng
from [AdventureWorksDW2019].[dbo].[DimProduct] as prod
inner join DimProductSubcategory as subCat on prod.ProductSubcategoryKey = subCat.ProductSubcategoryKey 
inner join DimProductCategory as cat on subCat.ProductCategoryKey = cat.ProductCategoryKey 
--prima passiamo da subcategory
--da subcategory andiamo a prendere le informazioni in category