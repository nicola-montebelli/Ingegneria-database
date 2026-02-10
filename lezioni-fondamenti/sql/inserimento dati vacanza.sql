insert into destinazioni(nome_destinazione)
values
('Tanzania')
,('Malta')
,('Maldive')
,('Dublino')
,('Roma');

insert into pacchetto_vacanze(id_destinazione,data_inizio,data_fine,prezzo)
values 
(1,'2026-02-20','2026-03-01',2570.50)
,(2,'2026-06-15','2026-07-15',3000.00)
,(2,'2026-12-20','2026-01-06',7000.50)
,(3,'2026-04-14','2026-05-01',1580.66)
,(4,'2026-08-31','2026-09-03',250.00)
,(5,'2026-05-30','2026-06-01',123.45)
;

insert into viaggi_confermati(id_utente,id_pacchetto)
values
(1,2)
,(2,5)
,(3,2)
,(4,1)
,(1,3)
;