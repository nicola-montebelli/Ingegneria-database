/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [ProductDescriptionID]
      ,[Description]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Production].[ProductDescription]


 --1) scrivere la query che restituisce tutti i campi e solo i primi 20 record della tabella "ProductDescription" 
 --dove nel campo "Description" è contenuta la parola "aluminum" 
 SELECT TOP (20) *
 from Production.ProductDescription
 where Description like '%aluminium%'


 /*2) scrivere la query che restituisce dalla tabella "
SalesTerritory" solo il campo "CountryRegionCode" filtrato da eventuali duplicati*/
 select CountryRegionCode
 from Sales.SalesTerritory
 group by CountryRegionCode


 /*3) scrivere la query che restituisce dalla tabella "Document" tutti i campi dove "FileExtension" è stringa vuota*/
 select FileExtension
 from Production.Document
 where FileExtension = ' '


 /*4) scrivere la query che restituisce tutti i campi e i record della tabella "PurchaseOrderHeader"
dove il valore del campo "OrderDate" è compreso tra '2013-12-12' e '2014-06-24' .
Ordinare il risultato per "Subtotal" decrescente  e "Status" crescente*/
SELECT *
from Purchasing.PurchaseOrderHeader
where CAST(OrderDate as date) BETWEEN '2013-12-12' AND '2014-06-24'
order by SubTotal desc,Status ASC


/*5) scrivere la query che seleziona dalla taballa prodotti
a) soli i record dove l'anno del campo SellStartDate è maggiore di 2012 e dove il campo SizeUnitMeasureCode NON è nullo
b) selezionare solo i seguenti VALORI assegnando un nome appropriato a ciascun nuovo campo
     1) lunghezza campo Name
     2) il campo SizeUnitMeasureCode tutto in minuscolo
     3) il campo Color tutto maiuscolo*/
--A)
SELECT *
from Production.Product as p
where SellStartDate > '2012' AND SizeUnitMeasureCode is not null

--B)
SELECT len(p.Name) as lung_nome
	,LOWER(p.SizeUnitMeasureCode) as unità_misura_min
	,UPPER(p.Color) as colore_MAIUSC 
from Production.Product as p


/*6) Scrivere la query che unisce i risultati delle query che estraggono dalle tabelle
Sales.SalesOrderHeader e Purchasing.PurchaseOrderHeader
a) id ordine(scegliere un nome univoco per i campi delle due tabelle)
b) data ordine
d) data spedizione
c) creare il campo che identifica la provenienza di quel record(tabella sales o purchase)*/

SELECT	SalesOrderID as OrderID
		,OrderDate
		,ShipDate
		,'Sales' as Source
from Sales.SalesOrderHeader

UNION ALL

SELECT PurchaseOrderID as OrderID
	  ,PurchaseOrderHeader.OrderDate
	  ,PurchaseOrderHeader.ShipDate
	  ,'Purchase' as Source
FROM Purchasing.PurchaseOrderHeader


/*7) Utilizzare la query scritta nell'ESERCIZIO 6 per estrarre tutti i record dove la data d'ordine 
	è maggiore del 1 gennaio 2013
E' richiesto l'utilizzo di una subquery*/
SELECT *
FROM (SELECT	SalesOrderID as OrderID
		,OrderDate
		,ShipDate
		,'Sales' as Source
	from Sales.SalesOrderHeader
	where OrderDate > '2013-01-01'

	UNION ALL

	SELECT PurchaseOrderID as OrderID
	  ,PurchaseOrderHeader.OrderDate
	  ,PurchaseOrderHeader.ShipDate
	  ,'Purchases' as Source
	FROM Purchasing.PurchaseOrderHeader) as sal_pur
where OrderDate > '2013-01-01'


-- es 8 in dimGeography

/*ESERCIZIO 9
Scrivere la query che dalla tabella "SalesOrderDetail" raggruppa i dati per "ProductID"
e per ciascun "ProductID" indica il valore massimo, minino e la somma del campo "LineTotal"*/
SELECT ProductID
		,SUM(LineTotal) as somma_line_total
		,MAX(LineTotal) as max_value_line_total
		,MIN(LineTotal) as min_value_line_total
FROM Sales.SalesOrderDetail
group by ProductID
order by ProductID


/*ESERCIZIO 10
Scrivere la query che ha come risultato l'elenco di tutti gli ordini nella tabella SalesOrderHeader
   e come campi(se i valori sono presenti):
   1)numero ordine
   2)nome e cognome di chi ha eseguito la vendita( valori da tabella Person.Person)
   3)nome del territorio dove è stato eseguita la vendita (valore da tabella Sales.SalesTerritory)
   4)nome del metodo di spedizione (valore da tabella Purchasing.ShipMethod)
   5)SubTotal della vendita*/
SELECT SalesOrderID
	,SalesOrderNumber
	,SubTotal
FROM Sales.SalesOrderHeader

union all

SELECT CONCAT(p.FirstName,' ',p.LastName)
FROM Person.Person as p

union all

SELECT st.Name
FROM Sales.SalesTerritory as st

union all

SELECT sm.Name
FROM Purchasing.ShipMethod as sm

-- non funziona da controllare a casa

