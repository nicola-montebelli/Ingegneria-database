/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT [BusinessEntityID]
      ,[EmailAddressID]
      ,[EmailAddress]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[EmailAddress]
  

  -- creare la query che restituisce nome e cognome della persona (tab. person)
  -- indirizzo mail e indirizzo (x mail questa tabella, x indirizzo tab. personAddress)
  -- numero di telefono (tab. personphone)
  select persona.BusinessEntityID
		,CONCAT(persona.FirstName,' ' ,persona.LastName) as FullName 
		,EmailAddress
		,number.PhoneNumber
		,CONCAT(indirizzo.City,' ',indirizzo.AddressLine1,' ', indirizzo.AddressLine2) as FullAddr
  from Person.EmailAddress as mail
  left join Person.Person as persona on mail.BusinessEntityID = persona.BusinessEntityID
  left join Person.PersonPhone as number on mail.BusinessEntityID = number.BusinessEntityID
  left join Person.BusinessEntityAddress as indirizzoUtente on mail.BusinessEntityID = indirizzoUtente.BusinessEntityID
  left join Person.Address as indirizzo on indirizzoUtente.AddressID = indirizzo.AddressID
  order by BusinessEntityID

  --metodo della prof
  select *
  from Person.Person as p
  left join Person.EmailAddress as ea on ea.BusinessEntityID = p.BusinessEntityID
  left join Person.BusinessEntityAddress as bea on bea.BusinessEntityID = p.BusinessEntityID 
  --notare che cambia il numero di righe restituite con questa ultima query
  --(alcuni BusinessEntityID vengono ripetuti perchè sono associati a diversi AddressID)
  
