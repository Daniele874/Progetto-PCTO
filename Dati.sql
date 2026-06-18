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
	storia varchar(3000)
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
	punti float,
	campioneDelMondo int
)

create table StoricoScuderia(
  idScuderia int,
  gpFatti int,
  punti float,
  podi int,
  vittorie int,
  polePosition int,
  campioniDelMondo int
)

create table Notizie(
	idNotizia int IDENTITY(1,1),
	titolo varchar(255),
	contenuto varchar(5000),
	dataDiPubblicazione varchar(10),
	primary key (idNotizia)
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

alter table StoricoScuderia
add constraint fk_storico_scuderia
foreign key (idScuderia) references Scuderia(idScuderia)

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
values 
('DHL', 1.6, '2004', 
'DHL rappresenta uno dei partner logistici piu strategici e longevi nella storia moderna della Formula 1, avendo avviato la sua collaborazione ufficiale nel 2004. Il ruolo dell azienda va ben oltre la semplice esposizione del marchio sui circuiti: DHL e il motore invisibile che garantisce il funzionamento del grande circo della Formula 1 gestendo trasporti oceanici e aerei complessi. In una stagione media, la societa si occupa del trasferimento di oltre duemila tonnellate di materiali pesanti, tra cui le monoposto stesse, i motori di scorta, i carburanti speciali, la complessa infrastruttura tecnologica per le trasmissioni televisive globali e le hospitality dei team. La logistica deve muoversi con tempistiche stringenti, specialmente durante i famosi back-to-back, ovvero i fine settimana di gara consecutivi in continenti diversi, dove un ritardo anche solo di poche ore rischierebbe di compromettere lo svolgimento dell intero evento. Per premiare l eccellenza tecnica e la rapidita dei meccanici all interno della corsia dei box, l azienda ha istituito nel 2015 il celebre DHL Fastest Pit Stop Award, un trofeo ufficiale assegnato alla scuderia che dimostra la maggiore costanza e velocita nell effettuare i cambi gomme durante l intero arco del campionato mondiale. Successivamente e stato introdotto anche il DHL Fastest Lap Award, dedicato al pilota in grado di far segnare il maggior numero di giri veloci in gara durante la stagione. Negli ultimi anni, in linea con i piani di sostenibilita della FIA per il traguardo Net Zero Carbon entro il 2030, DHL ha investito massicciamente nell ottimizzazione dei trasporti, introducendo una flotta di camion alimentati a biocarburante e utilizzando velivoli a ridotte emissioni di anidride carbonica per minimizzare l impatto ambientale dei lunghi trasferimenti transoceanici del campionato.'),

('Pirelli', 2.1, '2011', 
'Il legame tra Pirelli e la massima serie automobilistica affonda le sue radici fin nelle origini del campionato nel 1950, epoca in cui equipaggiava le leggendarie Alfa Romeo di Giuseppe Farina e Juan Manuel Fangio. Dopo una serie di cicli storici di presenza e assenza, la svolta moderna e avvenuta nel 2011, anno in cui la FIA ha nominato l azienda milanese come fornitore unico ed esclusivo di pneumatici per tutti i team iscritti al mondiale. Questa decisione e stata presa con l obiettivo specifico di accrescere lo spettacolo in pista. La Federazione ha infatti richiesto espressamente a Pirelli di sviluppare mescole caratterizzate da un degrado termico programmato, costringendo i piloti e gli ingegneri a studiare strategie di gara piu dinamiche e articolate, basate su piu soste ai box. Nel corso delle stagioni, Pirelli ha dovuto affrontare sfide ingegneristiche imponenti, come la transizione ai motori ibridi V6 Turbo caratterizzati da una coppia motrice elevatissima, e la storica rivoluzione tecnica del 2022, che ha visto il passaggio definitivo dai vecchi cerchioni da 13 pollici alle nuove coperture ribassate da 18 pollici. Il lavoro di ricerca e sviluppo viene coordinato nel centro tecnologico di Milano Bicocca e mette alla prova l azienda nella produzione di ben sei mescole da asciutto (dalla C0 alla C5) oltre alle iconiche gomme intermedie verdi e da bagnato estremo blu. Pirelli contribuisce attivamente alla valorizzazione del fine settimana di gara sponsorizzando direttamente i trofei del podio di numerosi Gran Premi e conferendo il prestigioso premio Pole Position Award, consegnato direttamente dal brand al pilota piu veloce delle qualifiche del sabato.'),

('Aramco', 2.3, '2020', 
'Aramco e entrata ufficialmente nel mondo della Formula 1 nel corso della stagione 2020, firmando un accordo di partnership globale a lungo termine che ha posizionato il colosso energetico tra i principali investitori del motorsport. La presenza del marchio e visibile non solo attraverso i giganteschi cartelloni pubblicitari posizionati nelle curve piu iconiche dei tracciati di tutto il mondo, ma si esprime anche come title sponsor di appuntamenti storici del calendario e attraverso una strettissima collaborazione tecnica con la scuderia Aston Martin. Il fulcro di questo investimento risiede nella ricerca tecnologica legata alla transizione energetica. La Formula 1 ha infatti pianificato l introduzione obbligatoria nei motori di nuova generazione di carburanti sostenibili al cento per cento a partire dalla stagione 2026. Aramco e attivamente impegnata nello sviluppo e nella sperimentazione di questi e-fuels sintetici avanzati e di biocarburanti di seconda generazione, progettati per ridurre drasticamente le emissioni globali di gas serra senza andare a penalizzare le eccezionali prestazioni dei propulsori termici. I laboratori di ricerca della compagnia lavorano in simbiosi con i chimici dei team per ottimizzare la stabilita chimica della benzina e per massimizzare l efficienza della combustione interna, creando un travaso tecnologico che in futuro potra essere applicato direttamente sui veicoli stradali di produzione di massa, contribuendo cosi alla decarbonizzazione globale dei trasporti.'),

('aws', 2.0, '2018', 
'Amazon Web Services ha rivoluzionato il modo in cui i tifosi e gli addetti ai lavori analizzano la Formula 1, grazie a una partnership tecnologica e commerciale avviata nel 2018. Attraverso l utilizzo di algoritmi avanzati di intelligenza artificiale e machine learning applicati al cloud computing, AWS elabora in tempo reale una quantita impressionante di dati telemetrici provenienti dagli oltre trecento sensori installati su ciascuna delle venti monoposto in pista. Questa analisi profonda si traduce nei famosi F1 Insights trasmessi in diretta durante i Gran Premi, grafiche televisive d impatto che spiegano agli spettatori elementi complessi come l usura stimata degli pneumatici, la probabilita di successo di un sorpasso, le finestre temporali ottimali per effettuare l undercut ai box e il confronto prestazionale millimetrico tra i piloti nelle diverse curve. Al di la dell aspetto puramente televisivo e dell intrattenimento, le infrastrutture di calcolo ad altissima velocita fornite da AWS vengono sfruttate direttamente dagli ingegneri della FIA per eseguire simulazioni fluidodinamiche computazionali estremamente complesse. Queste simulazioni sono state fondamentali per studiare i flussi aerodinamici e l effetto scia delle vetture ad effetto suolo, gettando le basi scientifiche e strutturali per la stesura dei regolamenti tecnici volti ad aumentare i sorpassi e lo spettacolo nei corpo a corpo ravvicinati.'),

('Heineken', 3.0, '2016', 
'Heineken e entrata ufficialmente in Formula 1 nel 2016 con un massiccio accordo di sponsorizzazione globale, affermandosi rapidamente come uno dei marchi piu visibili nei circuiti e nelle campagne promozionali legate al motorsport. La filosofia commerciale del produttore di birra olandese si concentra sull abbinamento tra l intrattenimento dei grandi eventi sportivi e la sensibilizzazione sociale. Sfruttando la straordinaria cassa di risonanza mediatica della Formula 1, Heineken ha lanciato campagne pubblicitarie globali incentrate sul consumo responsabile, incarnate dal celebre slogan When You Drive, Never Drink. Queste iniziative hanno visto il coinvolgimento diretto in veste di ambasciatori di leggende del volante del calibro di Sir Jackie Stewart, Nico Rosberg e David Coulthard, oltre a collaborazioni piu recenti con il pluricampione del mondo Max Verstappen. Oltre ai tradizionali cartelloni posizionati lungo i muretti e sui ponti dei tracciati, l azienda e title sponsor di diverse gare chiave nel calendario, tra cui spicca l avveniristico Gran Premio di Las Vegas. Heineken cura nei minimi dettagli l esperienza dei tifosi all interno delle Fan Zone ufficiali e dei Paddock Club, organizzando concerti con DJ internazionali e spettacoli collaterali che trasformano il tradizionale fine settimana di gara in un vero e proprio festival di intrattenimento globale, capace di attrarre un pubblico sempre piu giovane ed eterogeneo.'),

('Petronas', 2.8, '2010', 
'La storia moderna della Formula 1 non puo essere raccontata senza menzionare l incredibile sodalizio tecnico e commerciale tra la compagnia petrolifera malese Petronas e il team Mercedes AMG, nato nel 2010 in concomitanza con il ritorno ufficiale delle Frecce d Argento come scuderia costruttrice. Petronas ha svolto un ruolo assolutamente decisivo e insostituibile nel clamoroso dominio della squadra anglo-tedesca all inizio dell era turbo-ibrida nel 2014. Gli ingegneri chimici della Petronas, lavorando a stretto contatto con i progettisti dei motori a Brixworth, hanno sviluppato fluidi lubrificanti della linea Syntium e carburanti speciali su misura in grado di resistere alle pressioni interne e alle temperature estreme raggiunte dalle power unit ibride. Questo sforzo scientifico ha permesso di ottimizzare l efficienza termica del motore, superando la storica barriera del cinquanta per cento e garantendo al contempo un affidabilita meccanica straordinaria che ha portato alla conquista di ben otto titoli mondiali costruttori consecutivi. Il marchio, che in passato aveva sponsorizzato anche la scuderia Sauber, ha stabilito una presenza fissa nel calendario grazie al Gran Premio della Malesia sul circuito di Sepang fino al 2017, e continua a investire massicciamente nel motorsport come laboratorio chimico estremo per testare soluzioni energetiche da trasferire poi sul mercato automobilistico di tutti i giorni.'),

('QatarAirways', 2.5, '2023', 
'Qatar Airways e diventata la compagnia aerea ufficiale e il partner globale della Formula 1 all inizio della stagione 2023, consolidando la strategia del paese del Golfo Persico mirata a posizionarsi al vertice dei grandi eventi sportivi internazionali. L accordo multimilionario prevede una visibilita del brand su scala globale lungo i tracciati del campionato e la titolarita dei diritti di denominazione per alcuni Gran Premi specifici durante l anno. Dal punto di vista pratico e logistico, la collaborazione offre pacchetti di viaggio esclusivi per i tifosi piu facoltosi, includendo voli di linea dedicati, pass di accesso per i Paddock Club e sistemazioni alberghiere di lusso nelle citta ospitanti. La compagnia aerea mette inoltre a disposizione la propria flotta cargo avanzata per supportare i delicati voli di trasferimento dei materiali tecnici della Formula 1, integrandosi con le reti logistiche esistenti per garantire la massima puntualita nelle tappe mediorientali e asiatiche. Questa partnership riflette l espansione commerciale della Formula 1 nei mercati del lusso e del turismo d elite, unendo l immagine di eccellenza nel servizio di volo della compagnia aerea con il prestigio tecnologico ed esclusivo del campionato automobilistico piu famoso del pianeta.'),

('Lenovo', 1.9, '2022', 
'Lenovo e entrata a far parte della famiglia degli sponsor ufficiali della Formula 1 nel 2022, per poi elevare lo status della partnership a Global Partner. L azienda tecnologica fornisce un supporto hardware fondamentale che costituisce l asse portante delle operazioni digitali della Formula 1, sia sul campo di gara sia nei quartieri generali remoti di Biggin Hill. Dispositivi come server ad alte prestazioni, workstation mobili, computer portatili ThinkPad e tablet vengono impiegati quotidianamente dal personale tecnico per gestire i complessi sistemi di cronometraggio ufficiale, per raccogliere i dati video ad altissima definizione e per supportare le operazioni di trasmissione televisiva dirette a centinaia di milioni di case in tutto il mondo. Lenovo ha introdotto elementi di innovazione visibile anche nelle cerimonie di premiazione sul podio, progettando i primi trofei attivabili tramite bacio per i Gran Premi del Giappone e degli Stati Uniti: quando il pilota vincitore bacia l area indicata sul trofeo, questo si illumina con i colori della bandiera nazionale del pilota stesso grazie a micro-tecnologie integrate. La collaborazione si estende inoltre all utilizzo di soluzioni di archiviazione dati di ultima generazione, fondamentali per gestire l immenso archivio storico video della Formula 1 e per elaborare in tempo reale i contenuti digitali destinati alle piattaforme social e web.'),

('Crypto.com', 2.0, '2021', 
'L ingresso di Crypto.com nel 2021 come partner globale e sponsor ufficiale delle innovative Sprint Race ha segnato una svolta commerciale importante, sancendo l apertura formale della Formula 1 verso i mercati della finanza digitale avanzata, delle criptovalute e degli asset digitali Web3. La partnership e nata in un momento di enorme espansione mediatica del motorsport, guidata dal successo delle serie televisive e dal rinnovato interesse del pubblico giovane negli Stati Uniti. Il marchio ha legato il proprio nome in modo indissolubile al Gran Premio di Miami, diventando il title sponsor ufficiale dell evento disputato attorno all Hard Rock Stadium e personalizzando un intera area lussuosa del paddock nota come Crypto.com Terrace. Oltre alla massiccia presenza visiva delle scritte azzurre lungo le curve dei circuiti, l azienda collabora con la Formula 1 per lo sviluppo di collezioni di NFT ufficiali ed esperienze artistiche digitali uniche, destinate ai collezionisti e ai tifosi piu appassionati. Questo accordo simboleggia la transizione strategica intrapresa da Liberty Media, volta a modernizzare l ecosistema commerciale del campionato collegandolo direttamente a piattaforme finanziarie digitali ad alta tecnologia e a mercati emergenti ad fortissimo impatto generazionale.');

insert into Campionato
values ('2026', 24, 11, 'azzurro'),
('2025', 24, 10, 'arancione'),
('2024', 24, 10, 'blu'),
('2023', 23, 10, 'blu'),
('2022', 22, 10, 'blu')


insert into Gara 
values 
--2026
(1, 'Gran Premio Di Montreal', '24/05/2026', 'gia svolta', 15, 'Canada', 4.361, 70, 'azzurro'),
(1,'Gran Premio D Australia','08/03/2026', 'gia svolta', 19, 'Australia',5.278, 58, 'azzurro'),
(1, 'Gran Premio Della Cina', '15/03/2026', 'gia svolta', 18, 'Cina',5.451, 56, 'azzurro'),
(1, 'Gran Premio Del Giappone','29/03/2026', 'gia svolta', 22, 'Giappone',5.807, 53, 'azzurro'), 
(1, 'Gran Premio Di Miami','03/05/2026', 'gia svolta', 21, 'Stati Uniti', 5.412, 57, 'azzurro'),
(1, 'Gran Premio Di Monaco','07/06/2026', 'gia svolta', 20, 'Principato di Monaco', 3.337, 78, 'azzurro'),
(1, 'Gran Premio Di Spagna','14/06/2026', 'gia svolta', 17, 'Spagna',4.657, 66, 'rosso'), 
(1, 'Gran Premio D Austria','28/06/2026', 'non svolta', 14, 'Austria',4.318, 71, 'nero'),
(1, 'Gran Premio Di Gran Bretagna', '05/07/2026', 'non svolta', 18, 'Regno Unito', 5.891, 52, 'nero'),
(1, 'Gran Premio del Belgio', '19/07/2026', 'non svolta', 12, 'Belgio', 7.004, 44, 'nero'),
--2025
(2, 'Gran Premio D Australia','16/03/2025', 'gia svolta', 19, 'Australia',5.278, 58, 'arancione'), 
(2, 'Gran Premio Della Cina','23/03/2025', 'gia svolta', 18, 'Cina',5.451, 56, 'arancione'), 
(2, 'Gran Premio Del Giappone','06/04/2025', 'gia svolta', 22, 'Giappone',5.807, 53, 'blu'),  
(2, 'Gran Premio Del Bahrain', '13/04/2025', 'gia svolta', 18, 'Bahrain', 5.412, 57, 'arancione'), 
(2, 'Gran Premio Dell Arabia Saudita','20/04/2025', 'gia svolta', 16, 'Arabia Saudita', 6.174, 50, 'arancione'), 
(2, 'Gran Premio Di Spagna', '01/06/2025', 'gia svolta', 17, 'Spagna',4.657, 66, 'arancione'), 
(2, 'Gran Premio Del Canada','15/06/2025', 'gia svolta', 15, 'Canada', 4.361, 70, 'azzurro'),  
(2, 'Gran Premio Di Imola', '18/05/2025', 'gia svolta', 16, 'Italia',4.909, 63, 'blu'), 
(2, 'Gran Premio Di Monaco', '07/06/2025', 'gia svolta', 35, 'Principato di Monaco', 3.337, 78, 'arancione'),
--2024
(3, 'Gran Premio Del Bahrain','02/03/2024', 'gia svolta', 18, 'Bahrain', 5.412, 57, 'blu'),    
(3, 'Gran Premio Dell Arabia Saudita','09/03/2024', 'gia svolta', 16, 'Arabia Saudita',6.174, 50, 'blu'),    
(3, 'Gran Premio D Australia','24/03/2024', 'gia svolta', 19, 'Australia', 5.278, 58, 'rosso'),  
(3, 'Gran Premio Del Giappone', '07/04/2024', 'gia svolta', 22, 'Giappone', 5.807, 53, 'blu'), 
(3, 'Gran Premio Di Miami', '05/05/2024', 'gia svolta', 21, 'Stati Uniti', 5.412, 57, 'arancione'), 
(3, 'Gran Premio Di Monaco', '26/05/2024', 'gia svolta', 20, 'Principato di Monaco', 3.337, 78, 'rosso'),   
(3, 'Gran Premio Del Canada', '09/06/2024', 'gia svolta', 15, 'Canada', 4.361, 70, 'blu'),     
(3, 'Gran Premio Di Austria', '30/06/2024', 'gia svolta', 17, 'Austria', 4.318, 71, 'azzurro'),
(3, 'Gran Premio Di Silverstone', '12/07/2024', 'gia svolta', 18, 'Regno Unito', 5.891, 52, 'azzurro'),
(3, 'Gran Premio Di Monza', '16/09/2024', 'gia svolta', 20, 'Italia', 5.793, 53, 'rosso'),
--2023
(4, 'Gran Premio Di Spa-Francorchamps', '30/07/2023', 'gia svolta', 17, 'Belgio', 7.004, 44, 'blu'),
(4, 'Gran Premio Di Zandvoort', '27/08/2023', 'gia svolta', 19, 'Paesi Bassi', 4.259, 72, 'blu'),
(4, 'Gran Premio Del Bahrain', '05/03/2023', 'gia svolta', 18, 'Bahrain',5.412, 57, 'blu'),    
(4, 'Gran Premio Dell Arabia Saudita','19/03/2023', 'gia svolta', 16, 'Arabia Saudita', 6.174, 50, 'blu'),     
(4, 'Gran Premio D Australia', '02/04/2023', 'gia svolta', 19, 'Australia', 5.278, 58, 'blu'),   
(4, 'Gran Premio Di Miami', '07/05/2023', 'gia svolta', 21, 'Stati Uniti', 5.412, 57, 'blu'),   
(4, 'Gran Premio Di Monaco','28/05/2023', 'gia svolta', 20, 'Principato di Monaco', 3.337, 78, 'blu'),    
(4, 'Gran Premio Di Spagna', '04/06/2023', 'gia svolta', 17, 'Spagna', 4.657, 66, 'blu'),    
(4, 'Gran Premio Del Canada','18/06/2023', 'gia svolta', 15, 'Canada', 4.361, 70, 'blu'),  
(4, 'Gran Premio D Austria','02/07/2023', 'gia svolta', 14, 'Austria',  4.318, 71, 'blu'),
--2022
(5,  'Gran Premio Di Baku', '12/06/2022', 'gia svolta', 14, 'Azerbaigian', 6.003, 51, 'blu'),
(5, 'Gran Premio Di Imola', '24/04/2022', 'gia svolta', 16, 'Italia', 4.909, 63, 'blu'),
(5, 'Gran Premio Del Bahrain', '20/03/2022', 'gia svolta', 18, 'Bahrain', 5.412, 57, 'rosso'),  
(5, 'Gran Premio Dell Arabia Saudita','27/03/2022', 'gia svolta', 16, 'Arabia Saudita', 6.174, 50, 'blu'),  
(5, 'Gran Premio D Australia', '10/04/2022', 'gia svolta', 19, 'Australia', 5.278, 58, 'rosso'),  
(5, 'Gran Premio Di Miami', '08/05/2022', 'gia svolta', 21, 'Stati Uniti', 5.412, 57, 'blu'),   
(5, 'Gran Premio Di Spagna','22/05/2022', 'gia svolta', 17, 'Spagna', 4.657, 66, 'blu'),   
(5, 'Gran Premio Di Monaco','29/05/2022', 'gia svolta', 20, 'Principato di Monaco', 3.337, 64, 'blu'),     
(5, 'Gran Premio Del Canada','19/06/2022', 'gia svolta', 15, 'Canada', 4.361, 70, 'blu'), 
(5, 'Gran Premio Di Gran Bretagna', '03/07/2022', 'gia svolta', 18, 'Regno Unito', 5.891, 52, 'rosso')



insert into GaraPiloti
values
--2026
(1, 8, 1, 1.132), (1, 1, 2, 1.135), (1, 5, 3, 1.134), (1, 2, 4, 1.131), (1, 6, 5, 1.138), (1, 7, 6, 1.140), (1, 9, 7, 1.142), (1, 8, 8, 1.141), (1, 13, 9, 1.145), (1, 10, 10, 1.147),
(2, 7, 1, 1.182), (2, 3, 2, 1.185), (2, 2, 3, 1.181), (2, 5, 4, 1.189), (2, 8, 5, 1.190), (2, 6, 6, 1.192), (2, 1, 7, 1.191), (2, 9, 8, 1.195), (2, 13, 9, 1.198), (2, 22, 10, 1.196),
(3, 8, 1, 1.221), (3, 6, 2, 1.224), (3, 3, 3, 1.220), (3, 1, 4, 1.225), (3, 2, 5, 1.223), (3, 9, 6, 1.228), (3, 7, 7, 1.230), (3, 4, 8, 1.232), (3, 5, 9, 1.235), (3, 13, 10, 1.234),
(4, 8, 1, 1.155), (4, 1, 2, 1.158), (4, 3, 3, 1.154), (4, 7, 4, 1.159), (4, 5, 5, 1.160), (4, 6, 6, 1.162), (4, 2, 7, 1.161), (4, 9, 8, 1.165), (4, 10, 9, 1.168), (4, 14, 10, 1.167),
(5, 8, 1, 1.281), (5, 5, 2, 1.284), (5, 6, 3, 1.285), (5, 1, 4, 1.280), (5, 2, 5, 1.287), (5, 7, 6, 1.289), (5, 9, 7, 1.291), (5, 3, 8, 1.290), (5, 13, 9, 1.294), (5, 11, 10, 1.296),
(6, 8, 1, 1.121), (6, 2, 2, 1.123), (6, 9, 3, 1.125), (6, 3, 4, 1.120), (6, 5, 5, 1.126), (6, 6, 6, 1.128), (6, 13, 7, 1.130), (6, 7, 8, 1.132), (6, 1, 9, 1.131), (6, 18, 10, 1.135),
(7, 2, 1, 1.242), (7, 9, 2, 1.245), (7, 1, 3, 1.244), (7, 5, 4, 1.241), (7, 3, 5, 1.247), (7, 6, 6, 1.249), (7, 7, 7, 1.250), (7, 8, 8, 1.248), (7, 13, 9, 1.253), (7, 22, 10, 1.252),
(8, 8, 1, 1.145), (8, 3, 2, 1.142), (8, 2, 3, 1.146), (8, 7, 4, 1.148), (8, 5, 5, 1.147), (8, 6, 6, 1.150), (8, 1, 7, 1.152), (8, 9, 8, 1.154), (8, 10, 9, 1.157), (8, 4, 10, 1.156),
(9, 8, 1, 1.291), (9, 7, 2, 1.293), (9, 3, 3, 1.292), (9, 5, 4, 1.295), (9, 6, 5, 1.297), (9, 1, 6, 1.294), (9, 2, 7, 1.290), (9, 9, 8, 1.299), (9, 13, 9, 1.302), (9, 15, 10, 1.301),
(10, 8, 1, 1.421), (10, 5, 2, 1.424), (10, 1, 3, 1.422), (10, 6, 4, 1.426), (10, 2, 5, 1.425), (10, 9, 6, 1.429), (10, 7, 7, 1.431), (10, 3, 8, 1.430), (10, 13, 9, 1.434), (10, 19, 10, 1.436),

--2025
(11, 5, 1, 1.191), (11, 3, 2, 1.189), (11, 6, 3, 1.194), (11, 1, 4, 1.192), (11, 2, 5, 1.195), (11, 7, 6, 1.197), (11, 9, 7, 1.199), (11, 8, 8, 1.198), (11, 10, 9, 1.202), (11, 22, 10, 1.201),
(12, 6, 1, 1.231), (12, 1, 2, 1.234), (12, 5, 3, 1.233), (12, 2, 4, 1.232), (12, 3, 5, 1.237), (12, 7, 6, 1.239), (12, 9, 7, 1.241), (12, 8, 8, 1.240), (12, 13, 9, 1.244), (12, 4, 10, 1.246),
(13, 3, 1, 1.262), (13, 9, 2, 1.265), (13, 1, 3, 1.261), (13, 2, 4, 1.266), (13, 5, 5, 1.268), (13, 6, 6, 1.270), (13, 7, 7, 1.271), (13, 8, 8, 1.269), (13, 13, 9, 1.274), (13, 14, 10, 1.276),
(14, 6, 1, 1.161), (14, 22, 2, 1.164), (14, 5, 3, 1.163), (14, 1, 4, 1.165), (14, 2, 5, 1.166), (14, 3, 6, 1.169), (14, 7, 7, 1.171), (14, 9, 8, 1.173), (14, 8, 9, 1.172), (14, 10, 10, 1.175),
(15, 6, 1, 1.312), (15, 8, 2, 1.314), (15, 1, 3, 1.311), (15, 3, 4, 1.309), (15, 2, 5, 1.316), (15, 5, 6, 1.318), (15, 7, 7, 1.320), (15, 9, 8, 1.322), (15, 13, 9, 1.325), (15, 21, 10, 1.327),
(16, 6, 1, 1.201), (16, 9, 2, 1.204), (16, 3, 3, 1.202), (16, 5, 4, 1.205), (16, 2, 6, 1.207), (16, 7, 7, 1.206), (16, 8, 8, 1.209), (16, 1, 9, 1.208), (16, 13, 10, 1.212), (16, 17, 11, 1.214),
(17, 7, 1, 1.141), (17, 5, 2, 1.144), (17, 1, 3, 1.143), (17, 6, 4, 1.146), (17, 2, 5, 1.145), (17, 3, 6, 1.148), (17, 9, 7, 1.150), (17, 8, 8, 1.149), (17, 10, 9, 1.153), (17, 22, 10, 1.152),
(18, 3, 1, 1.212), (18, 6, 2, 1.215), (18, 5, 3, 1.211), (18, 1, 4, 1.216), (18, 2, 5, 1.214), (18, 7, 6, 1.219), (18, 9, 7, 1.221), (18, 8, 8, 1.220), (18, 13, 9, 1.224), (18, 4, 10, 1.226),
(19, 5, 1, 1.115), (19, 2, 2, 1.117), (19, 3, 3, 1.114), (19, 9, 4, 1.119), (19, 6, 5, 1.120), (19, 1, 6, 1.122), (19, 7, 7, 1.124), (19, 8, 8, 1.123), (19, 13, 9, 1.127), (19, 20, 10, 1.129),

--2024
(20, 3, 1, 1.291), (20, 22, 2, 1.294), (20, 1, 3, 1.292), (20, 5, 4, 1.296), (20, 2, 5, 1.295), (20, 6, 6, 1.298), (20, 7, 7, 1.300), (20, 9, 8, 1.302), (20, 8, 9, 1.301), (20, 10, 10, 1.305),
(21, 3, 1, 1.332), (21, 5, 2, 1.335), (21, 1, 3, 1.334), (21, 6, 4, 1.337), (21, 2, 5, 1.336), (21, 7, 6, 1.339), (21, 9, 7, 1.341), (21, 8, 8, 1.340), (21, 13, 9, 1.344), (21, 11, 10, 1.346),
(22, 9, 1, 1.192), (22, 1, 2, 1.195), (22, 3, 3, 1.193), (22, 2, 4, 1.196), (22, 5, 5, 1.198), (22, 6, 6, 1.200), (22, 7, 7, 1.201), (22, 8, 8, 1.199), (22, 13, 9, 1.204), (22, 15, 10, 1.206),
(23, 3, 1, 1.135), (23, 6, 2, 1.138), (23, 1, 3, 1.134), (23, 5, 4, 1.139), (23, 2, 5, 1.137), (23, 7, 6, 1.141), (23, 9, 7, 1.143), (23, 8, 8, 1.142), (23, 10, 9, 1.146), (23, 14, 10, 1.145),
(24, 5, 1, 1.272), (24, 1, 2, 1.275), (24, 3, 3, 1.274), (24, 2, 4, 1.271), (24, 6, 5, 1.278), (24, 7, 6, 1.280), (24, 9, 7, 1.282), (24, 8, 8, 1.281), (24, 13, 9, 1.285), (24, 22, 10, 1.284),
(25, 1, 1, 1.111), (25, 2, 2, 1.113), (25, 3, 3, 1.112), (25, 9, 4, 1.115), (25, 5, 5, 1.116), (25, 6, 6, 1.118), (25, 7, 7, 1.120), (25, 8, 8, 1.119), (25, 13, 9, 1.123), (25, 17, 10, 1.125),
(26, 3, 1, 1.171), (26, 5, 2, 1.174), (26, 1, 3, 1.173), (26, 6, 4, 1.176), (26, 2, 5, 1.175), (26, 7, 6, 1.178), (26, 9, 7, 1.180), (26, 8, 8, 1.179), (26, 10, 9, 1.183), (26, 4, 10, 1.182),
(27, 7, 1, 1.139), (27, 8, 2, 1.141), (27, 2, 3, 1.138), (27, 1, 4, 1.142), (27, 3, 5, 1.140), (27, 5, 6, 1.144), (27, 6, 7, 1.146), (27, 9, 8, 1.148), (27, 13, 9, 1.151), (27, 19, 10, 1.153),
(28, 2, 1, 1.232), (28, 7, 2, 1.235), (28, 1, 3, 1.234), (28, 3, 4, 1.231), (28, 5, 5, 1.237), (28, 6, 6, 1.239), (28, 9, 7, 1.241), (28, 8, 8, 1.240), (28, 13, 9, 1.244), (28, 10, 10, 1.246),
(29, 1, 1, 1.211), (29, 9, 2, 1.214), (29, 3, 3, 1.212), (29, 2, 4, 1.215), (29, 5, 5, 1.217), (29, 6, 6, 1.219), (29, 7, 7, 1.220), (29, 8, 8, 1.218), (29, 13, 9, 1.223), (29, 18, 10, 1.225),

--2023
(30, 3, 1, 1.382), (30, 1, 2, 1.385), (30, 5, 3, 1.384), (30, 2, 4, 1.381), (30, 6, 5, 1.388), (30, 7, 6, 1.390), (30, 9, 7, 1.392), (30, 8, 8, 1.391), (30, 13, 9, 1.395), (30, 22, 10, 1.394),
(31, 3, 1, 1.311), (31, 22, 2, 1.314), (31, 5, 3, 1.313), (31, 1, 4, 1.315), (31, 2, 5, 1.316), (31, 6, 6, 1.319), (31, 7, 7, 1.321), (31, 9, 8, 1.323), (31, 8, 9, 1.322), (31, 10, 10, 1.325),
(32, 3, 1, 1.252), (32, 5, 2, 1.255), (32, 1, 3, 1.254), (32, 6, 4, 1.257), (32, 2, 5, 1.256), (32, 7, 6, 1.259), (32, 9, 7, 1.261), (32, 8, 8, 1.260), (32, 13, 9, 1.264), (32, 11, 10, 1.266),
(33, 22, 1, 1.322), (33, 3, 2, 1.325), (33, 5, 3, 1.324), (33, 2, 4, 1.321), (33, 6, 5, 1.328), (33, 7, 6, 1.330), (33, 9, 7, 1.332), (33, 8, 8, 1.331), (33, 13, 9, 1.335), (33, 10, 10, 1.337),
(34, 3, 1, 1.271), (34, 22, 2, 1.274), (34, 1, 3, 1.272), (34, 5, 4, 1.276), (34, 2, 5, 1.275), (34, 6, 6, 1.278), (34, 7, 7, 1.280), (34, 9, 8, 1.282), (34, 8, 9, 1.281), (34, 14, 10, 1.285),
(35, 3, 1, 1.242), (35, 5, 2, 1.245), (35, 1, 3, 1.244), (35, 6, 4, 1.247), (35, 2, 5, 1.246), (35, 7, 6, 1.249), (35, 9, 7, 1.251), (35, 8, 8, 1.250), (35, 13, 9, 1.254), (35, 10, 10, 1.256),
(36, 3, 1, 1.262), (36, 1, 2, 1.265), (36, 5, 3, 1.264), (36, 2, 4, 1.261), (36, 6, 5, 1.268), (36, 7, 6, 1.270), (36, 9, 7, 1.272), (36, 8, 8, 1.271), (36, 13, 9, 1.275), (36, 22, 10, 1.274),
(37, 3, 1, 1.135), (37, 5, 2, 1.138), (37, 9, 3, 1.136), (37, 2, 4, 1.139), (37, 6, 5, 1.141), (37, 7, 6, 1.143), (37, 8, 7, 1.144), (37, 1, 8, 1.142), (37, 13, 9, 1.147), (37, 17, 10, 1.149),
(38, 3, 1, 1.252), (38, 5, 2, 1.255), (38, 1, 3, 1.254), (38, 6, 4, 1.257), (38, 2, 5, 1.256), (38, 7, 6, 1.259), (38, 9, 7, 1.261), (38, 8, 8, 1.260), (38, 13, 9, 1.264), (38, 10, 10, 1.266),
(39, 3, 1, 1.292), (39, 6, 2, 1.295), (39, 5, 3, 1.293), (39, 1, 4, 1.296), (39, 2, 5, 1.298), (39, 7, 6, 1.300), (39, 9, 7, 1.301), (39, 8, 8, 1.299), (39, 13, 9, 1.304), (39, 21, 10, 1.306),

--2022
(40, 3, 1, 1.231), (40, 1, 2, 1.234), (40, 5, 3, 1.233), (40, 2, 4, 1.232), (40, 6, 5, 1.237), (40, 7, 6, 1.239), (40, 9, 7, 1.241), (40, 8, 8, 1.240), (40, 13, 9, 1.244), (40, 22, 10, 1.243),
(41, 3, 1, 1.145), (41, 1, 2, 1.142), (41, 2, 3, 1.146), (41, 7, 4, 1.148), (41, 8, 5, 1.147), (41, 5, 6, 1.150), (41, 6, 7, 1.152), (41, 9, 8, 1.154), (41, 10, 9, 1.157), (41, 15, 10, 1.159),
(42, 1, 1, 1.161), (42, 22, 2, 1.164), (42, 5, 3, 1.163), (42, 3, 4, 1.165), (42, 2, 5, 1.166), (42, 6, 6, 1.169), (42, 7, 7, 1.171), (42, 9, 8, 1.173), (42, 8, 9, 1.172), (42, 13, 10, 1.176),
(43, 3, 1, 1.192), (43, 9, 2, 1.195), (43, 1, 3, 1.193), (43, 2, 4, 1.196), (43, 5, 5, 1.198), (43, 6, 6, 1.200), (43, 7, 7, 1.201), (43, 8, 8, 1.199), (43, 13, 9, 1.204), (43, 14, 10, 1.205),
(44, 1, 1, 1.135), (44, 6, 2, 1.138), (44, 3, 3, 1.134), (44, 5, 4, 1.139), (44, 2, 5, 1.137), (44, 7, 6, 1.141), (44, 9, 7, 1.143), (44, 8, 8, 1.142), (44, 10, 9, 1.146), (44, 4, 10, 1.148),
(45, 3, 1, 1.291), (45, 22, 2, 1.294), (45, 1, 3, 1.292), (45, 5, 4, 1.296), (45, 2, 5, 1.295), (45, 6, 6, 1.298), (45, 7, 7, 1.300), (45, 9, 8, 1.302), (45, 8, 9, 1.301), (45, 11, 10, 1.304),
(46, 3, 1, 1.332), (46, 5, 2, 1.335), (46, 1, 3, 1.334), (46, 6, 4, 1.337), (46, 2, 5, 1.336), (46, 7, 6, 1.339), (46, 9, 7, 1.341), (46, 8, 8, 1.340), (46, 13, 9, 1.344), (46, 19, 10, 1.347),
(47, 22, 1, 1.192), (47, 9, 2, 1.195), (47, 3, 3, 1.193), (47, 2, 4, 1.196), (47, 5, 5, 1.198), (47, 6, 6, 1.200), (47, 7, 7, 1.201), (47, 8, 8, 1.199), (47, 13, 9, 1.204), (47, 18, 10, 1.208),
(48, 3, 1, 1.291), (48, 7, 2, 1.293), (48, 8, 3, 1.292), (48, 5, 4, 1.295), (48, 6, 5, 1.297), (48, 1, 6, 1.294), (48, 2, 7, 1.290), (48, 9, 8, 1.299), (48, 13, 9, 1.302), (48, 10, 10, 1.305),
(49, 9, 1, 1.242), (49, 3, 2, 1.245), (49, 2, 3, 1.241), (49, 5, 4, 1.247), (49, 7, 5, 1.250), (49, 6, 6, 1.249), (49, 1, 7, 1.248), (49, 8, 8, 1.252), (49, 13, 9, 1.255), (49, 22, 10, 1.254);

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

insert into StoricoPilota
values (1, 52, 8, 177, 27, 1747, 0),
(2, 206, 106, 387, 104, 5133.5, 7),
(3, 128, 71, 240, 48, 3499.5, 4),
(4, 1, 0, 30, 0, 80, 0),
(5, 46 ,11 ,158 , 16, 1503, 1),
(6, 28, 9, 75, 6, 867, 0),
(7, 27, 6, 159, 11, 1139, 0),
(8, 9, 5, 31, 4, 306, 0),
(9, 29, 4, 236, 6, 1342.5, 0),
(10, 2, 0, 134, 0, 134, 0),
(11, 0, 0, 42, 0, 72, 0),
(12, 0, 0, 6, 0, 13, 0),
(13, 106, 32, 434, 2394, 22, 2),
(14, 3, 0, 196, 1, 325, 0),
(15, 1, 0, 256, 0, 622, 0),
(16, 0, 0, 30, 0, 21, 0),
(17, 0, 0, 34, 0, 66, 0),
(18, 4, 1, 187, 0, 486, 0),
(19, 6, 1, 184, 0, 499, 0),
(20, 0, 0, 33, 0, 21, 0),
(21, 67, 10, 253, 20, 1797, 0),
(22, 39, 6, 288, 3, 1638, 0)

insert into StoricoScuderia 
values (1, 1130, 10865, 645, 250, 254, 16),
(2, 425, 8377, 234, 130, 111, 6),
(3, 1001, 7924.5, 448, 203, 177, 10),
(4, 336, 8421.5, 208, 128, 143, 8),
(5, 858, 3779, 245, 114, 128, 8),
(6, 406, 988, 6, 2, 1, 0),
(7, 159, 864, 12, 1, 1, 0),
(8, 7, 2, 0, 0, 0, 0),
(9, 221, 407, 0, 0, 0, 0),
(10, 399, 2057, 61, 21, 20, 2),
(11, 7, 0, 0, 0, 0, 0)

insert into Notizie
values 
('Russell apre la stagione a Melbourne',
'George Russell conquista la vittoria nel Gran Premio d Australia 2026, primo appuntamento del campionato mondiale di Formula 1. Il pilota britannico della Mercedes parte dalla pole position e non lascia mai la testa della corsa, gestendo con freddezza i pit stop e le fasi di Safety Car. Doppietta Mercedes con il compagno di squadra Andrea Kimi Antonelli che chiude secondo dopo una battaglia serrata nel finale. Charles Leclerc porta la Ferrari sul podio in terza posizione, dopo aver guidato la corsa nel primo stint prima di perdere terreno durante il pit stop. Lewis Hamilton, alla sua prima uscita ufficiale in rosso con la Ferrari, termina quarto con una prestazione solida che lascia ben sperare per il futuro. Verstappen chiude quinto con la Red Bull, mentre Norris e Piastri completano la top sette per McLaren. La stagione 2026 si apre quindi con la Mercedes in grande forma, ma con Ferrari e McLaren pronte a lottare.',
'08/03/2026'),

('Antonelli fa la storia in Cina',
'Andrea Kimi Antonelli entra nella storia della Formula 1 vincendo il Gran Premio di Cina 2026 sul circuito internazionale di Shanghai. Il diciannovenne bolognese della Mercedes conquista la sua prima vittoria in carriera nel massimo campionato automobilistico con una prestazione di grande maturità e controllo. Antonelli ha dominato la gara dalla partenza, gestendo alla perfezione le gomme e i pit stop su un tracciato tradizionalmente insidioso. Il compagno di squadra George Russell chiude secondo, regalando una splendida doppietta alla Mercedes. Lewis Hamilton sale sul terzo gradino del podio, conquistando il suo primo podio con la Ferrari e dimostrando di aver già trovato feeling con la monoposto di Maranello. Max Verstappen, partito dalla seconda posizione, paga una strategia non ottimale e chiude quarto. Lando Norris è quinto per McLaren. Il mondiale piloti comincia a prendere forma con Antonelli che scala rapidamente le posizioni in classifica.',
'15/03/2026'),

('Bis di Antonelli in Giappone a Suzuka',
'Kimi Antonelli non si ferma e centra la seconda vittoria consecutiva sul leggendario circuito di Suzuka, teatro del Gran Premio del Giappone 2026. Il pilota bolognese della Mercedes diventa così il più giovane pilota della storia a guidare la classifica mondiale di Formula 1 dopo appena tre gare. La sua prestazione a Suzuka è stata semplicemente dominante: partenza perfetta, gestione impeccabile delle gomme e ritmo costantemente superiore agli avversari. Oscar Piastri porta la McLaren al secondo posto con una gara di grande intelligenza tattica, mentre Charles Leclerc conquista il terzo posto per la Ferrari dopo una rimonta straordinaria dalla settima posizione in griglia. George Russell chiude soltanto sesto, penalizzato da un pit stop lento ai box della Mercedes. Lewis Hamilton è fuori dal podio in quarta posizione, ma mostra progressi costanti con la vettura di Maranello. Verstappen è quinto, Norris sesto. Il mondiale si fa già interessante con Antonelli che allunga.',
'29/03/2026'),

('GP Bahrain e Arabia Saudita cancellati',
'La Formula 1 è costretta a fare i conti con la realtà geopolitica mondiale: la FIA e Liberty Media annunciano ufficialmente la cancellazione dei Gran Premi del Bahrain e dell Arabia Saudita, previsti rispettivamente per il 13 e il 20 aprile 2026, a causa del grave conflitto militare scoppiato in Medio Oriente nelle settimane precedenti. La sicurezza dei piloti, del personale tecnico e degli spettatori è stata la priorità assoluta nella decisione, presa dopo una serie di consultazioni con i governi locali e le autorità internazionali. Il campionato mondiale di Formula 1 osserva dunque una pausa forzata di circa un mese, con il prossimo appuntamento fissato per il 3 maggio a Miami, negli Stati Uniti. I team hanno sfruttato la pausa per intensificare lo sviluppo delle vetture, con Ferrari e McLaren che promettono importanti aggiornamenti aerodinamici per il Gran Premio di Miami. La cancellazione riduce il calendario 2026 a 22 gare complessive.',
'25/04/2026'),

('Tripletta Antonelli a Miami, Ferrari delude',
'Kimi Antonelli è incontenibile e conquista la sua terza vittoria stagionale consecutiva nel Gran Premio di Miami 2026, disputato sull autodromo del Miami International Autodrome. Il pilota della Mercedes conferma di essere il grande protagonista di questa stagione con una prestazione maiuscola: partenza fulminea, strategia perfetta e gestione dei doppiaggi senza sbavature. Lando Norris e Oscar Piastri completano il podio rispettivamente in seconda e terza posizione, regalando alla McLaren un ottimo risultato che consolida il terzo posto nella classifica costruttori. La giornata è invece da dimenticare per la Ferrari: Charles Leclerc, che sembrava avviato verso il podio nelle fasi finali della gara, perde tre posizioni negli ultimi due giri a causa di un problema alla pressione dei pneumatici e chiude amaramente sesto. Lewis Hamilton, mai veramente in lotta per le posizioni di vertice, taglia il traguardo in ottava posizione. Verstappen è quarto con la Red Bull. In classifica piloti Antonelli allunga ulteriormente.',
'03/05/2026'),

('Poker di vittorie per Antonelli a Montreal',
'Andrea Kimi Antonelli scrive un altro capitolo della sua stagione straordinaria vincendo il Gran Premio del Canada 2026 sul circuito Gilles Villeneuve di Montreal, conquistando così la quarta vittoria consecutiva in altrettante gare disputate. Una prestazione di grandissima qualità su un tracciato cittadino storicamente imprevedibile, dove i muri sono sempre in agguato e la gestione dei freni è fondamentale. George Russell, che sembrava poter contendere la vittoria al compagno, è costretto al ritiro per un problema meccanico mentre occupava la seconda posizione al trentunesimo giro. Lewis Hamilton approfitta della situazione e conquista un prezioso secondo posto, il miglior risultato stagionale fino ad oggi per il sette volte campione del mondo in Ferrari. Max Verstappen chiude terzo con la Red Bull, dimostrando che la RB21 è tornata competitiva su certi tipi di circuiti. Leclerc è quarto, Norris quinto. In classifica mondiale Antonelli sembra già in fuga.',
'24/05/2026'),

('Antonelli re di Monaco, Leclerc a muro',
'Il Gran Premio di Monaco 2026 sarà ricordato come la gara della consacrazione definitiva di Andrea Kimi Antonelli e della grande delusione di Charles Leclerc. Il giovane bolognese della Mercedes trionfa tra le strade del Principato conquistando la sua quinta vittoria consecutiva stagionale, un dominio che non si vedeva in Formula 1 da molti anni. Lewis Hamilton chiude secondo con la Ferrari, confermando il buon momento di forma delle ultime gare. La giornata è però segnata dall incidente di Charles Leclerc, il pilota monegasco che a Monaco non ha mai vinto e che sperava di colmare questa lacuna proprio davanti al pubblico di casa. Leclerc finisce violentemente a muro dopo il restart successivo alla Safety Car uscita per un incidente tra Gasly e Colapinto, e si ritira tra la costernazione dei tifosi presenti sulle tribune. Un momento davvero amaro per il ferrarista che aveva mostrato un ottimo passo gara nel primo stint. Verstappen è terzo, Norris quarto.',
'07/06/2026'),

('Hamilton vince a Barcellona, Ferrari torna al successo',
'Lewis Hamilton regala alla Ferrari la prima vittoria della stagione 2026 sul circuito di Barcellona-Catalogna, teatro del Gran Premio di Spagna. Una vittoria liberatoria per il sette volte campione del mondo, che finalmente porta la Rossa sul gradino più alto del podio dopo una serie di risultati altalenanti. Hamilton ha disputato una gara perfetta dalla pole position, mantenendo la testa con autorità e gestendo alla perfezione i pit stop e il traffico dei doppiati. La striscia vincente di Antonelli si interrompe definitivamente: il pilota Mercedes è costretto al ritiro al quarantaduesimo giro per un problema al motore della sua W16, il primo cedimento meccanico stagionale per la casa di Stoccarda. Anche Charles Leclerc, che occupava la terza posizione, si ritira a soli cinque giri dalla fine per un guasto allo sterzo, privando la Ferrari di una potenziale doppietta. George Russell chiude secondo davanti a Lando Norris. In classifica piloti Hamilton accorcia sensibilmente su Antonelli portandosi a soli 41 punti di distanza. Il mondiale si riapre.',
'14/06/2026')

/*CANCELLAZIONE TABELLA*/
--drop table GaraPiloti, CampionatoGare, Gara, StoricoPilota, StoricoScuderia, Scuderia, Pilota, Campionato, Sponsor, Notizie


