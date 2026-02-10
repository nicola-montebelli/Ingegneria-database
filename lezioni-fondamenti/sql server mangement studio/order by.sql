select FirstName, LastName
from [AdventureWorks2019].[Person].[Person]
order by FirstName,LastName; --ordine alfabetico per nome

select  distinct FirstName
				,LastName
from [AdventureWorks2019].[Person].[Person] --stessa cosa di select Person.Person cambia solo che specifica tutto il percorso
											--si usano le [] quando i nomi hanno gli spazi piuttosto che _ o - 
order by FirstName,LastName;				--rimuove i duplicati