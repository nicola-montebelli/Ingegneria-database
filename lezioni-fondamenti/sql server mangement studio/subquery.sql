--avere solo le aree geografiche da cui provengono i reseller
--subquery di tipo PREDICATO (slide 53)
SELECT GeographyKey,EnglishCountryRegionName,City
FROM DimGeography
WHERE GeographyKey IN 
	(SELECT GeographyKey FROM DimReseller)

--2 opzioni per rimuovere i duplicati
SELECT DISTINCT EnglishCountryRegionName,City
FROM DimGeography
WHERE GeographyKey IN 
	(SELECT GeographyKey FROM DimReseller)


SELECT EnglishCountryRegionName,City
FROM DimGeography
WHERE GeographyKey IN 
	(SELECT GeographyKey FROM DimReseller)
group by EnglishCountryRegionName,City


-- visualizza solo gli ultimi prodotti inseriti in tabella
-- subquery SCALARI
SELECT EnglishDescription,StartDate
FROM DimProduct a
WHERE StartDate = (SELECT MAX(StartDate) AS MAXDATE FROM DimProduct)


--restituire solo l'elenco degli impiegati di cui il salario è sopra la media del proprio reparto
-- subquery CORRELATE
SELECT lastname
	  ,BaseRate
	  ,DepartmentName
FROM DimEmployee AS query_esterna
	WHERE BaseRate >		(SELECT AVG(BaseRate) AS AVG_BASERATE 
							FROM DimEmployee AS query_interna
							WHERE query_interna.DepartmentName = query_esterna.DepartmentName
							GROUP BY query_interna.DepartmentName)
ORDER BY DepartmentName



--restituire gli importi di vendita indipendentemente
--che vengano dalla tabella delle vendite tramite internet o che vengano dalla tabella reseller
--subquery FROM
Select SalesOrderNumber
		,SUM(amount_internet) as Amount_Internet
		,SUM(amount_reseller) as Amount_Reseller
From(SELECT SalesOrderNumber ,SalesAmount AS amount_internet ,0 AS amount_reseller
		FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
		UNION
		SELECT SalesOrderNumber
		,0 AS amount_internet
		,SalesAmount AS amount_reseller
		FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]) as P
Group by SalesOrderNumber