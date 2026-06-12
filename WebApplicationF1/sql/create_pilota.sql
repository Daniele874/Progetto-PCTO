-- Create dbo.pilota table for SQL Server
IF OBJECT_ID('dbo.pilota', 'U') IS NOT NULL
    DROP TABLE dbo.pilota;

CREATE TABLE dbo.pilota (
    idPilota INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    dataDiNascita VARCHAR(50) NULL,
    nazionalita VARCHAR(100) NULL,
    colore VARCHAR(50) NULL
);

-- Optional seed data
INSERT INTO dbo.pilota (nome, cognome, dataDiNascita, nazionalita) VALUES
('Kimi', 'Antonelli', '2004-02-14', 'Italia'),
('Lewis', 'Hamilton', '1985-01-07', 'Regno Unito'),
('George', 'Russel', '1998-09-15', 'Regno Unito');
