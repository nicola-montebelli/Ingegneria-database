-- query per la creazione del database
create database ifts_2026;
/*commento su più righe

questa query crea  la tabella utenti 
nel database ifts_2026*/
use ifts_2026;
create table utenti(
id_utente int primary key not null,
nome_utente varchar(50) not null,
cognome_utente varchar(100) not null,
data_nascita date
);

alter table utenti
modify id_utente int auto_increment; /*quando si fa una modifica basta ripete il nome del dato, il suo tipo, aggiungere quello che mancava in questo caso auto_increment*/

-- è buona pratica commentare le query come DROP o DELETE per assicurarsi di non eseguirle accidentalmente 