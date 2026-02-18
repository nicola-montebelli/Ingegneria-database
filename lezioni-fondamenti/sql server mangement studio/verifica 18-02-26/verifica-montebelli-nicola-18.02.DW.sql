/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [GeographyKey]
      ,[City]
      ,[StateProvinceCode]
      ,[StateProvinceName]
      ,[CountryRegionCode]
      ,[EnglishCountryRegionName]
      ,[SpanishCountryRegionName]
      ,[FrenchCountryRegionName]
      ,[PostalCode]
      ,[SalesTerritoryKey]
      ,[IpAddressLocator]
  FROM [AdventureWorksDW2019].[dbo].[DimGeography]

/*ESERCIZIO 8
Scrivere la query che restituisce dalla tabella DimGeography
a) solo il campo City senza duplicati
b) solo i nomi delle città che hanno come "EnglishCountryRegionName" i valori "France" e "Germany"
c) ordinare i valori per nome città crescente*/

SELECT DISTINCT City
			,EnglishCountryRegionName
FROM DimGeography
where EnglishCountryRegionName	in ('France','Germany')
order by City


