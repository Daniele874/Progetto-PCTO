/*INTERROGAZIONE TABELLA*/

select Pilota.nome, Pilota.cognome from Pilota inner join Scuderia on Pilota.idPilota = Scuderia.idPilota
where Scuderia.nome in ('Ferrari')

select Pilota.nome, Pilota.cognome, count(*) as Vittorie_Totali 
from Pilota inner join GaraPiloti on Pilota.idPilota = GaraPiloti.idPilota 
where piazzamento = 1
group by Pilota.nome, Pilota.cognome order by Vittorie_Totali DESC

select Gara.nome from Gara inner join Campionato on Gara.idCampionato = Campionato.idCampionato 
where Campionato.anno like '%2026%' and dataGara like '%2026%'

select* from dbo.pilota
dbo.pilota
idPilota	int
nome	varchar
cognome	varchar
dataDiNascita	varchar
nazionalita	varchar


select * from [dbo].[Scuderia]