
/*CREAZIONE TABELLA*/
create table Pilota (
	idPilota int,
	nome varchar(50),
	cognome varchar(50),
	dataDiNascita varchar(50),
	nazionalita varchar(50),
	primary key (idPilota),
)

create table Scuderia(
  idScuderia int,
  nome varchar(50),
  idPilota int,
  primary key(idScuderia, idPilota)
)

create table Gara(
	idGara int ,
	idCampionato int,
	nome varchar(50),
	dataGara varchar(50),
	stato varchar(50),
	numeroSponsor int,
	nazione varchar(50),
	lunghezzaTracciato decimal,
	numeroGiri int,
	primary key (idGara, idCampionato)
)

create table GaraPiloti(
	idGara int,
	idPilota int,
	piazzamento int,
	giroPiuVeloce decimal
	primary key (idGara, idPilota)
)

create table CampionatoGare(
	idGara int,
	idCampionato int,
	primary key (idGara, idCampionato)
)

create table Sponsor(
	idSponsor int,
	nome varchar(50),
	valore decimal,
	dataInizioSponsorizzazione varchar(10)
	primary key (idSponsor)
)

create table Campionato(
	idCampionato int,
	anno varchar(4),
	numeroGare int,
	numeroScuderie int,
	primary key (idCampionato)
)
/*CREAZIONE PK*/
-- Creazione PK, chiavi primarie va qui dentro alla creazione tabella o appena dopo


/*CREAZIONE FK (le linee di dbdiagram)*/
-- dopo


/*CREAZIONE DATI*/
insert into Scuderia 
values (1,  'Ferrari', 1)
, (2, 'McLaren', 2)
, (3, 'RedBull', 3)

insert into Pilota 
values (1, 'Charles', 'Leclerc', '17/10/1997', 'Monaco'),
(2, 'Max', 'Verstappen', '30/11/1997', 'Olanda'),
(3, 'Andrea Kimi', 'Antonelli', '25/08/2006', 'Monaco')

insert into Gara 
values (1, 1, 'Gran Premio Di Monza', '06/09/2026', 'ancora da svolgere', 20, 'Italia', 5.793, 53),
(2, 2, 'Gran Premio Di Monaco', '07/06/2026', 'gia svolta', 35, 'Principato di Monaco', 3.337, 78),
(3, 3, 'Gran Premio Di Montreal', '24/05/2026', 'gia svolta', 15, 'Canada', 4.361, 70)

insert into GaraPiloti
values (1, 1, 3, 1.23),
(2, 2, 1, 1.13),
(3, 3, 6, 1.32)

insert into CampionatoGare
values (1, 1),
(2, 2),
(3, 3)

insert into Sponsor
values (1, 'DHL', 1.6, '2004'),
(2, 'Pirelli', 2.1, '2011'),
(3, 'Rolex', 2.3, '2013')

insert into Campionato
values (1, '2026', 24, 11),
(2, '2024', 24, 10),
(3, '2022', 22, 10)


/*INTERROGAZIONE TABELLA*/
select * from Pilota 
select * from Scuderia
/*select * from Gara
select * from GaraPiloti
select * from CampionatoGare
select * from Sponsor
select * from Campionato*/

/*CANCELLAZIONE TABELLA*/
DROP TABLE Scuderia, Pilota, Gara, GaraPiloti, CampionatoGare, Sponsor, Campionato
