update pacchetto_vacanze
set data_inizio = '2026-06-05'
where id_pacchetto = 2
;

delete 
from destinazioni		-- nella tabella destinazioni abbiamo aggiunto una nuova riga con una destinazione già presente (pk: 6 nome: roma) 
where id_destinazione = 6;