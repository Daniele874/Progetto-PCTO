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
(2, 'Lewis', 'Hamilton', '07/01/1985', 'Regno Unito'),
(3, 'Max', 'Verstappen', '30/11/1997', 'Olanda'),
(4, 'Andrea Kimi', 'Antonelli', '25/08/2006', 'Italia'),
(5, 'Lando', 'Norris', '13/11/1999', 'Regno Unito'),
(6, 'Isack', 'Hadjar', '28/09/2004', 'Francia'),
(7, 'Pierre', 'Gasly', '07/02/1996', 'Francia'),
(8, 'Liam', 'Lawson', '11/02/2002', 'Nuova Zelanda'),
(9, 'George', 'Russell', '15/02/1998', 'Regno Unito'),
(10, 'Oscar', 'Piastri', '06/04/2001', 'Australia')


insert into Scuderia 
values (1,  'Ferrari', 1),
(2, 'Ferrari', 2),
(3, 'RedBull', 3),
(4 , 'Mercedes', 4),
(5 , 'McLaren' , 5),
(6, 'Aston Martin', 6),
(7, 'Williams', 7),
(8 , 'Cadillac', 8),
(9 , 'Mercedes' , 9),
(10 , 'McLaren' , 10)

insert into Sponsor
values (1, 'DHL', 1.6, '2004'),
(2, 'Pirelli', 2.1, '2011'),
(3, 'Rolex', 2.3, '2013')

insert into Campionato
values (1, '2026', 24, 11),
(2, '2024', 24, 10),
(3, '2025', 24, 10),
(4, '2023', 23, 10),
(5, '2022', 22, 10)


insert into Gara 
values (1, 2, 'Gran Premio Di Monza', '16/09/2024', 'gia svolta', 20, 'Italia', 5.793, 53),
(2, 3, 'Gran Premio Di Monaco', '07/06/2025', 'gia svolta', 35, 'Principato di Monaco', 3.337, 78),
(3, 1, 'Gran Premio Di Montreal', '24/05/2026', 'gia svolta', 15, 'Canada', 4.361, 70),
(4, 1, 'Gran Premio Di Silverstone', '12/07/2026', 'ancora da svolgere', 18, 'Regno Unito', 5.891, 52),
(5, 1, 'Gran Premio Di Suzuka', '04/10/2026', 'ancora da svolgere', 22, 'Giappone', 5.807, 53),
(6, 4, 'Gran Premio Di Spa-Francorchamps', '30/07/2023', 'gia svolta', 17, 'Belgio', 7.004, 44),
(7, 4, 'Gran Premio Di Zandvoort', '27/08/2023', 'gia svolta', 19, 'Paesi Bassi', 4.259, 72),
(8, 5, 'Gran Premio Di Baku', '12/06/2022', 'gia svolta', 14, 'Azerbaigian', 6.003, 51),
(9, 5, 'Gran Premio Di Imola', '24/04/2022', 'gia svolta', 16, 'Italia', 4.909, 63),
(10, 3, 'Gran Premio Di Austin', '20/10/2025', 'ancora da svolgere', 21, 'Stati Uniti', 5.513, 56)



insert into GaraPiloti
values (1, 2, 1, 1.23),
(2, 3, 1, 1.13),
(3, 4, 1, 1.32),
(4, 2, 1, 1.16),
(5, 1, 1, 1.38),
(6, 3, 1, 1.13),
(7, 3, 1, 1.32),
(8, 1, 1, 1.16),
(9, 1, 1, 1.38),
(10, 1, 1, 1.38)

insert into CampionatoGare
values (1, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(6, 4),
(7, 4),
(8, 5),
(9, 5),
(10, 3)




/*CANCELLAZIONE TABELLA*/
--drop table GaraPiloti, CampionatoGare, Gara, Scuderia, Pilota, Campionato, Sponsor
