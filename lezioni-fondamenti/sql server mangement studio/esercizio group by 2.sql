/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]

  /*creare una query la quale restituisce per ciascun cognome quante volte è presente nella tabella*/
  select LastName
		,COUNT(LastName) as numero_cognomi
  FROM [AdventureWorks2019].[Person].[Person]
  group by LastName
  order by LastName DESC

  select LastName
  FROM [AdventureWorks2019].[Person].[Person]
  where LastName = 'Zhou'