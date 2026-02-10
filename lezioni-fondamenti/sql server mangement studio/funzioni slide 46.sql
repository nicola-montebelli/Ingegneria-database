SELECT LEN(LastName) AS lunghezza_cognome
, CONCAT(FirstName, '-', LastName) AS concat
, CONCAT( ISNULL(UPPER(Title), 'ND')
, ' '
, FirstName
, ' '
, LastName ) AS fullname
, CAST(ModifiedDate AS DATE) AS castTOdate
, LOWER(PersonType) AS lower
, UPPER(Title) AS upper
, GETDATE() AS now
, YEAR(ModifiedDate) AS year
, DATEADD(MONTH, -1, ModifiedDate) AS dateadd
, CASE WHEN LEN(LastName) = 6 THEN 'il cognome è lungo 6 caratteri' 
WHEN LEN(LastName) BETWEEN 7 AND 10 THEN 'il cognome è compreso da 7 e 10 caratteri' 
ELSE 'default' 
END AS controllo_cognome 
FROM adventureworks2019.Person.Person 
WHERE YEAR(ModifiedDate) > 2012 
AND cast(ModifiedDate as date) BETWEEN '2013-07-31' AND '2013-12-31'; -- modifiedDate è un dateTime quindi andrebbe convertito in data