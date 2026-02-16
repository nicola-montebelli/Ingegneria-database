SELECT  SalesOrderNumber
	   ,SUM(SalesAmount) as tot_amount
	   ,SUM(SalesAmount) as tot_amount_internet 
	   ,0 as tot_amount_reseller
	   ,'Internet' as Source
FROM FactInternetSales
group by SalesOrderNumber

UNION ALL 

SELECT  SalesOrderNumber
	   ,SUM(SalesAmount) as tot_amount
	   ,0 as tot_amount_internet -- fare attenzione all'ordine delle query
	   ,SUM(SalesAmount) as tot_amount_reseller 
	   ,'Reseller' as Source
FROM FactResellerSales
group by SalesOrderNumber
-- quando si fa una union bisogna fare attenzione a distinguere quali valori vengono da quale tabella