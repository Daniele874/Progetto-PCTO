/*INTERROGAZIONE TABELLA*/

select Pilota.nome, Pilota.cognome from Pilota inner join Scuderia on Pilota.idPilota = Scuderia.idPilota1 
where Scuderia.nome in ('Ferrari')

select Pilota.nome, Pilota.cognome, count(*) as Vittorie_Totali 
from Pilota inner join GaraPiloti on Pilota.idPilota = GaraPiloti.idPilota 
where piazzamento = 1
group by Pilota.nome, Pilota.cognome order by Vittorie_Totali DESC

select Gara.nome from Gara inner join Campionato on Gara.idCampionato = Campionato.idCampionato 
where Campionato.anno like '%2026%' and dataGara like '%2026%'



select * From StoricoScuderia inner join Scuderia on StoricoScuderia.idScuderia = Scuderia.idScuderia 

