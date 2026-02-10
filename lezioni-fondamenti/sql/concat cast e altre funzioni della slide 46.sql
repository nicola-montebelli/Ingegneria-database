Select 
length(lastname) as lunghezza_cognome   
,concat(FirstName, "-",LastName)  as concat
-- ,FirstName || "-" || LastName as fullnamepipe  -- questo e quello sopra servono per concatenare dei valori esistenti SOLO nel momento in cui facciamo la query
,concat(
ifnull(upper(title),"ND")  -- quando il campo è nullo (ifnull) inserisci 'ND' altrimenti lascia il 'title' ma in maiuscolo (upper(title))
," "					
, firstname
," "
,lastname
) as fullname
,cast(ModifiedDate as Date)  as castTOdate -- cambia il campo data + ora in solo data (lavora su date, numeri e testi)
,lower(PersonType)     as lower       
,upper(Title)     	   as upper -- stampa i campi corrispettivi in minuscolo e maiuscolo
,now()  as now -- restituisce l'ora e la data correnti chiedendole alla macchina dove lavora il dbms (impreciso in caso di lavori in macchine virtuali in altre parti del mondo)
,year(ModifiedDate)    as year -- estrae da una data solo l'anno
,date_add(ModifiedDate, INTERVAL -1 MONTH) as dateadd -- ricalcola la data in base all'intervallo che indichiamo
-- parametri: data, intervallo (1 mese)   -- la funzione si occupa in automatico di controllare se siamo a fine mese, fine anno o se il mese ha meno giorni(febbraio)

,case when length(lastname) = 6 then "il cognome è lungo 6 caratteri"         -- quando la lunghezza del 'lastname' è 6 crea un valore con scritto "il cognome è lungo 6 caratteri"
         when length(lastname) between 7 and 10 then "il cognome è compreso da 7 e 10 caratteri"	-- (else if) quando la lunghezza è compresa tra 7 e 10		 
         else "default"             -- se non soddisfi le condizioni precedenti 
 end  as controllo_cognome   -- aperto un case va chiuso con END sempre altrimenti da errore
-- come gli if in altri linguaggi, le condizioni devono essere ordinate in modo che tutte siano valutate
FROM adventureworks2019.person 
where YEAR(ModifiedDate) > 2012 and modifiedDate between "2013-07-31" and "2013-12-31"
-- le funzioni possono essere usate anche nelle clausole










