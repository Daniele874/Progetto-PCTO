/*CREAZIONE TABELLA*/

create table Pilota (
	idPilota int IDENTITY(1,1),--ADD Identity field,
	nome varchar(50),
	cognome varchar(50),
	dataDiNascita varchar(50),
	nazionalita varchar(50),
	colore varchar(50)
	primary key (idPilota)
)

create table Scuderia(
  idScuderia int IDENTITY(1,1),
  nome varchar(50),
  idPilota1 int,
  idPilota2 int,
  primary key(idScuderia)
)

create table Sponsor(
	idSponsor int IDENTITY(1,1),
	nome varchar(50),
	valore float,
	dataInizioSponsorizzazione varchar(10),
	primary key (idSponsor)
)

create table Campionato(
	idCampionato int IDENTITY(1,1),
	anno varchar(4),
	numeroGare int,
	numeroScuderie int,
	colore varchar(50)
	primary key (idCampionato)
)

create table Gara(
	idGara int IDENTITY(1,1),
	idCampionato int,
	nome varchar(50),
	dataGara varchar(50),
	stato varchar(50),
	numeroSponsor int,
	nazione varchar(50),
	lunghezzaTracciato float,
	numeroGiri int,
	colore varchar(50)
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

create table StoricoPilota(
	idPilota int,
	podi int,
	vittorie int,
	gpFatti int, 
	polePosition int,
	punti int,
	campioneDelMondo int
)
/*CREAZIONE PK*/
-- Creazione PK, chiavi primarie va qui dentro alla creazione tabella o appena dopo


/*CREAZIONE FK (le linee di dbdiagram)*/
-- dopo
alter table Scuderia 
add constraint fk_scuderia_pilota1
foreign key (idPilota1) references Pilota(idPilota);

alter table Scuderia 
add constraint fk_scuderia_pilota2
foreign key (idPilota2) references Pilota(idPilota);

alter table Gara
add constraint fk_gara_campionato
foreign key (idCampionato) references Campionato(idCampionato);

alter table GaraPiloti
add constraint fk_gara_piloti
foreign key (idGara) references Gara(idGara);

alter table GaraPiloti
add constraint fk_piloti_gara
foreign key (idPilota) references Pilota(idPilota);

alter table CampionatoGare
add constraint fk_campionato_gare
foreign key (idCampionato) references Campionato(idCampionato);

alter table CampionatoGare
add constraint fk_gare_campionato
foreign key (idGara) references Gara(idGara);

alter table StoricoPilota
add constraint fk_storico_pilota
foreign key (idPilota) references Pilota(idPilota);

/*CREAZIONE DATI*/
insert into Pilota 
values ('Charles', 'Leclerc', '17/10/1997', 'Monaco', 'rosso'),
('Lewis', 'Hamilton', '07/01/1985', 'Regno Unito', 'rosso'),
('Max', 'Verstappen', '30/11/1997', 'Olanda', 'blu'),
('Isack', 'Hadjar', '28/09/2004', 'Francia', 'blu'),
('Lando', 'Norris', '13/11/1999', 'Regno Unito', 'arancione'),
('Oscar', 'Piastri', '06/04/2001', 'Australia', 'arancione'),
('George', 'Russell', '15/02/1998', 'Regno Unito', 'azzurro'),
('Andrea Kimi', 'Antonelli', '25/08/2006', 'Italia', 'azzurro'),
('Carlos', 'Sainz', '01/09/1994', 'Spagna', 'bluazzurro'),
('Alexander', 'Albon', '23/03/1996', 'Thailandia', 'bluazzurro'),
('Liam', 'Lawson', '11/02/2002', 'Nuova Zelanda', 'bianco'),
('Arvid', 'Lindblad', '08/08/2007', 'Regno Unito', 'bianco'),
('Fernando', 'Alonso', '29/07/1981', 'Spagna', 'verde'),
('Lance', 'Stroll', '29/10/1998', 'Canada', 'verde'),
('Nico', 'Hülkenberg', '19/08/1987', 'Germania', 'grigio'),
('Gabriel', 'Bortoleto', '14/10/2004', 'Brasile', 'grigio'),
('Oliver', 'Bearman', '08/05/2005', 'Regno Unito', 'biancorosso'),
('Esteban', 'Ocon', '17/09/1996', 'Francia', 'biancorosso'),
('Pierre', 'Gasly', '07/02/1996', 'Francia', 'rosa'),
('Franco', 'Colapinto', '27/05/2003', 'Argentina', 'rosa'),
('Valtteri', 'Bottas', '28/08/1989', 'Finlandia', 'nero'),
('Sergio', 'Pérez', '26/01/1990', 'Messico', 'nero')

insert into StoricoPilota
values --(podi, vittorie, giriVeloci, polePosition, punti, campioneDelMondo)
(52, 8, 177, 27, 1747, 0)

insert into Scuderia 
values ('Ferrari', 1, 2),
('RedBull', 3, 4),
('McLaren' , 5,6),
('Mercedes', 7,8),
('Williams', 9,10),
('RacingBulls', 11,12),
('AstonMartin', 13,14),
('Audi', 15,16),
('Haas', 17,18),
('Alpine', 19, 20),
('Cadillac', 21, 22)

insert into Sponsor
values ('DHL', 1.6, '2004'),
('Pirelli', 2.1, '2011'),
('Aramco', 2.3, '2020'),
('aws', 2.0, '2018'),
('Heineken', 3.0, '2016'),
('Petronas', 2.8, '2010'),
('QatarAirways', 2.5, '2023'),
('Lenovo', 1.9, '2022'),
('Crypto.com', 2.0, '2021')

insert into Campionato
values ('2026', 24, 11, 'azzurro'),
('2025', 24, 10, 'arancione'),
('2024', 24, 10, 'blu'),
('2023', 23, 10, 'blu'),
('2022', 22, 10, 'blu')


insert into Gara 
values (2, 'Gran Premio Di Monza', '16/09/2024', 'gia svolta', 20, 'Italia', 5.793, 53, 'rosso'),
(3, 'Gran Premio Di Monaco', '07/06/2025', 'gia svolta', 35, 'Principato di Monaco', 3.337, 78, 'blu'),
(1, 'Gran Premio Di Montreal', '24/05/2026', 'gia svolta', 15, 'Canada', 4.361, 70, 'azzurro'),
(1, 'Gran Premio Di Silverstone', '12/07/2024', 'gia svolta', 18, 'Regno Unito', 5.891, 52, 'rosso'),
(1, 'Gran Premio Di Suzuka', '04/10/2026', 'gia svolta', 22, 'Giappone', 5.807, 53, 'rosso'),
(4, 'Gran Premio Di Spa-Francorchamps', '30/07/2023', 'gia svolta', 17, 'Belgio', 7.004, 44, 'blu'),
(4, 'Gran Premio Di Zandvoort', '27/08/2023', 'gia svolta', 19, 'Paesi Bassi', 4.259, 72, 'blu'),
(5, 'Gran Premio Di Baku', '12/06/2022', 'gia svolta', 14, 'Azerbaigian', 6.003, 51, 'rosso'),
(5, 'Gran Premio Di Imola', '24/04/2022', 'gia svolta', 16, 'Italia', 4.909, 63, 'rosso'),
(3, 'Gran Premio Di Austin', '20/10/2025', 'gia svolta', 21, 'Stati Uniti', 5.513, 56, 'rosso')



insert into GaraPiloti
values (1, 2, 1, 1.23),
(2, 3, 1, 1.13),
(3, 8, 1, 1.32),
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
