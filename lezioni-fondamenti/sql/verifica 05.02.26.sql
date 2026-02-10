create database siae_bordero;

use siae_bordero;
create table canzoni(
id_canzoni int not null auto_increment primary key
, nome_canzone varchar(150) not null
, compositore_canzone varchar(150) not null
);

use siae_bordero;
create table bordero(
id_bordero int auto_increment primary key 
, data_bordero date not null
, nome_locale_evento varchar(200) not null
, nome_esecutore varchar(150) not null
);

use siae_bordero;
create table dettaglio_bordero(
id_dettaglio_bordero int primary key auto_increment 
, id_canzoni int not null, foreign key (id_canzoni) references canzoni(id_canzoni)
, id_bordero int, foreign key (id_bordero) references bordero(id_bordero)
);

use siae_bordero;
insert into canzoni (nome_canzone, compositore_canzone)
values 
('Estate','Tiziano Ruggine')
,('Vida loca','Spanish Guy')
,('Rise','John Martin')
,('Speak and Spell', 'Depeche Mode')
,('Rock Bottom','Rock Band')
,('Party Girl','In a plastic world')
;

use siae_bordero;
insert into bordero(data_bordero,nome_locale_evento,nome_esecutore)
values 
('2026-06-25','Xtreme','Antonio Parisi')
,('2027-12-23','DancinSteps','Pierpaolo Pierpaolini')
,('2026-03-11','OutLoud','Mark Fettina')
;

use siae_bordero;
insert into dettaglio_bordero(id_canzoni,id_bordero)
values 
(1,1)
,(4,3)
,(6,2)
,(2,1)
,(3,2)
,(6,1)
,(1,3)
,(5,1)
,(5,3)
,(4,2)
;

use siae_bordero;
update bordero
set nome_locale_evento = 'Ballaabbestia'
where id_bordero = 2;

delete 
from dettaglio_bordero
where id_dettaglio_bordero = 6;
