/*CREAZIONE TABELLA*/

create table Pilota (
	idPilota int,
	nome varchar(50),
	cognome varchar(50),
	dataDiNascita varchar(50),
	nazionalita varchar(50),
	primary key (idPilota)
)
create table Scuderia(
  idScuderia int,
  nome varchar(50),
  idPilota int,
  primary key(idScuderia)
)

create table Sponsor(
	idSponsor int,
	nome varchar(50),
	valore float,
	dataInizioSponsorizzazione varchar(10),
	primary key (idSponsor)
)

create table Campionato(
	idCampionato int,
	anno varchar(4),
	numeroGare int,
	numeroScuderie int,
	primary key (idCampionato)
)

create table Gara(
	idGara int ,
	idCampionato int,
	nome varchar(50),
	dataGara varchar(50),
	stato varchar(50),
	numeroSponsor int,
	nazione varchar(50),
	lunghezzaTracciato float,
	numeroGiri int,
	primary key (idGara)
)

create table GaraPiloti(
	idGara int,
	idPilota int,
	piazzamento int,
	giroPiuVeloce float
)

create table CampionatoGare(
	idGara int,
	idCampionato int
)


/*CREAZIONE PK*/
-- Creazione PK, chiavi primarie va qui dentro alla creazione tabella o appena dopo


/*CREAZIONE FK (le linee di dbdiagram)*/
-- dopo
alter table Scuderia 
add constraint fk_scuderia_pilota
foreign key (idPilota) references Pilota(idPilota)

alter table Gara
add constraint fk_gara_campionato
foreign key (idCampionato) references Campionato(idCampionato)

alter table GaraPiloti
add constraint fk_gara_piloti
foreign key (idGara) references Gara(idGara)

alter table GaraPiloti
add constraint fk_piloti_gara
foreign key (idPilota) references Pilota(idPilota)

alter table CampionatoGare
add constraint fk_campionato_gare
foreign key (idCampionato) references Campionato(idCampionato)

alter table CampionatoGare
add constraint fk_gare_campionato
foreign key (idGara) references Gara(idGara)

/*CREAZIONE DATI*/
insert into Pilota 
values (1, 'Charles', 'Leclerc', '17/10/1997', 'Monaco'),
(2, 'Lewis', 'Hamilton', '07/01/1985', 'Gran Bretagna'),
(3, 'Max', 'Verstappen', '30/11/1997', 'Olanda'),
(4, 'Andrea Kimi', 'Antonelli', '25/08/2006', 'Italia'),
(5, 'Lando', 'Norris', '13/11/1999', 'Gran Bretagna')

insert into Scuderia 
values (1,  'Ferrari', 1),
(2, 'Ferrari', 2),
(3, 'RedBull', 3),
(4 , 'Mercedes', 4),
(5 , 'McLaren' , 5)

insert into Sponsor
values (1, 'DHL', 1.6, '2004'),
(2, 'Pirelli', 2.1, '2011'),
(3, 'Rolex', 2.3, '2013')

insert into Campionato
values (1, '2026', 24, 11),
(2, '2024', 24, 10),
(3, '2025', 24, 10)

insert into Gara 
values (1, 2, 'Gran Premio Di Monza', '16/09/2024', 'gia svolta', 20, 'Italia', 5.793, 53),
(2, 3, 'Gran Premio Di Monaco', '07/06/2025', 'gia svolta', 35, 'Principato di Monaco', 3.337, 78),
(3, 1, 'Gran Premio Di Montreal', '24/05/2026', 'gia svolta', 15, 'Canada', 4.361, 70),
(4, 1, 'Gran Premio Di Silverstone', '12/07/2026', 'ancora da svolgere', 18, 'Regno Unito', 5.891, 52),
(5, 1, 'Gran Premio Di Suzuka', '04/10/2026', 'ancora da svolgere', 22, 'Giappone', 5.807, 53)


insert into GaraPiloti
values (1, 1, 3, 1.23),
(2, 2, 2, 1.13),
(3, 3, 6, 1.32),
(4, 1, 1, 1.16),
(5, 3, 1, 1.38)

insert into CampionatoGare
values (1, 1),
(2, 2),
(3, 3)


/*INTERROGAZIONE TABELLA*/
select Pilota.nome, Pilota.cognome from Pilota inner join Scuderia on Pilota.idPilota = Scuderia.idPilota
where Scuderia.nome in ('Ferrari')

select Pilota.nome, Pilota.cognome from Pilota inner join GaraPiloti on Pilota.idPilota = GaraPiloti.idPilota 
where piazzamento = 1

select Gara.nome from Gara inner join Campionato on Gara.idCampionato = Campionato.idCampionato 
where Campionato.anno like '%2026%' and dataGara like '%2026%'

/*CANCELLAZIONE TABELLA*/
drop table GaraPiloti, CampionatoGare, Gara, Scuderia, Pilota, Campionato, Sponsor
