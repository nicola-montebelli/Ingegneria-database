select BusinessEntityID as BeID, FirstName as Nome, LastName as Cognome
from Person.Person;
--come su mysql selezionare la parte di query e fare esegui o f5
select name as nome_provincia ,StateProvinceCode as codice_provincia
from Person.StateProvince;

select *
from Sales.SalesOrderDetail; -- mi mostra tutti i record di quella tabella
select top(100)*		-- mi mostra solo le prime 100 righe
from Sales.SalesOrderDetail;