/* creare una tabella con nome destinzioni che al suo interno comprenda i segunti campi
id_destinazione int pk ai 
nome_destinazione


creare una tabella pacchetto_vacanze 
id_pacchetto int pk ai
id_destinazione foreign key
data_inizio data
data_fine data
prezzo double


creare una tabella viaggi_confermati
id_viaggio int pk ai
id_pacchetto fk
id_utente fk
*/

use ifts_2026;
create table destinazioni(
id_destinazione int primary key auto_increment not null,
nome_destinazione varchar(50) not null
); 

use ifts_2026;
create table pacchetto_vacanze(
id_pacchetto int primary key auto_increment not null,
id_destinazione int,
foreign key (id_destinazione) references destinazioni(id_destinazione),
data_inizio date not null,
data_fine date not null,
prezzo double not null
);

use ifts_2026;
create table viaggi_confermati(
id_viaggio int primary key auto_increment not null,
id_pacchetto int, foreign key (id_pacchetto) references pacchetto_vacanze(id_pacchetto),
id_utente int, foreign key (id_utente) references utenti(id_utente)
);

alter table viaggi_confermati
modify column id_pacchetto int not null,
modify column id_utente int not null;






