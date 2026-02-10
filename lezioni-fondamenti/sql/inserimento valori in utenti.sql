-- use ifts_2026;
-- insert into ifts_2026.utenti(nome_utente,cognome_utente,data_nascita)   -- alternativa a use
-- values('Nicola','Montebelli','1998-10-09')     -- nell'insert non è necessario inserire l'id_utente perchè è auto-increment

insert into ifts_2026.utenti(nome_utente,cognome_utente,data_nascita) 
values('Peppe','Flautoberto','1994-06-06')
,('Maria','Marioli','1963-12-23')			-- inserimento di più valori in una tabella
,('Pippo','Bauden','1974-06-15'); 

