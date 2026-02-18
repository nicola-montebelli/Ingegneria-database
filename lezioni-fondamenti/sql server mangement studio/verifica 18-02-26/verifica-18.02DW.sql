/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [EmployeeKey]
      ,[ParentEmployeeKey]
      ,[EmployeeNationalIDAlternateKey]
      ,[ParentEmployeeNationalIDAlternateKey]
      ,[SalesTerritoryKey]
      ,[FirstName]
      ,[LastName]
      ,[MiddleName]
      ,[NameStyle]
      ,[Title]
      ,[HireDate]
      ,[BirthDate]
      ,[LoginID]
      ,[EmailAddress]
      ,[Phone]
      ,[MaritalStatus]
      ,[EmergencyContactName]
      ,[EmergencyContactPhone]
      ,[SalariedFlag]
      ,[Gender]
      ,[PayFrequency]
      ,[BaseRate]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[SalesPersonFlag]
      ,[DepartmentName]
      ,[StartDate]
      ,[EndDate]
      ,[Status]
      ,[EmployeePhoto]
  FROM [AdventureWorksDW2019].[dbo].[DimEmployee]


/*/*ESERCIZIO 11
Scrivere la query che restituisce, rimuovendo i duplicati, l'elenco dei nomi e cognomi degli impiegati, dalla tabella 
"dimemployee", che hanno almeno una quotazione nella tabella "factsalesquota"
E' richiesto l'utilizzo di una join*/*/

SELECT DISTINCT CONCAT(e.FirstName,' ',e.LastName) as full_name
FROM DimEmployee as e
inner join dbo.FactSalesQuota as fsq on e.EmployeeKey = fsq.EmployeeKey

