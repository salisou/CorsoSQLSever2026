-- Creazionde del Database
Create Database _ScuolaDb


-- Uso o attivazion del database
use _ScuolaDb


-- Creazione della Tabella Studenti con i iti di dati
/*
	int = intero
	varchar = string o Text
	nvarchar = string o Text
	char = carattere 
	decimal
	bit
	numeric
	foaltreal
	date
	time
	datetime2 
	datetimeoffset
	smaldatetime
*/


/*====================================================
//
//
//
======================================================*/

Create Table Studente
(
	StudenteId int primary key identity(1,1) NOT NULL, 
	Nome NVARCHAR(100) NOT NULL,
	Cognome NVARCHAR(100) NOT NULL,
	DataNascita Date NULL,
	Genere CHAR(1), 
	CodiceFiscale NVARCHAR(250)
);

-- Selezionare tutti i record della Tabella Studente
Select * From Studente


--Inserimento dei dati nella tabella studente
INSERT INTO Studente 
(Nome, Cognome, DataNascita, Genere, CodiceFiscale) 
VALUES 
('Prisca', 'Malba', '1985-02-10', 'F', 'PRMABC85B50H501X'),
('Luca', 'Rossi', '2000-05-15', 'M', 'RSSLCU00E15H501Y'),
('Maria', 'Bianchi', '1998-11-22', 'F', 'BNCMRA98S62H501Z'),
('Giovanni', 'Verdi', '1995-07-30', 'M', 'VRDGNN95L30H501A'),
('Sara', 'Conti', '2001-03-18', 'F', 'CNTSRA01C58H501B'),
('Marco', 'Ferrari', '1997-09-09', 'M', 'FRRMRC97P09H501C'),
('Elena', 'Romano', '1999-12-01', 'F', 'RMNLNE99T41H501D'),
('Davide', 'Ricci', '1996-04-25', 'M', 'RCCDVD96D25H501E'),
('Chiara', 'Gallo', '2002-08-14', 'F', 'GLLCHR02M54H501F'),
('Matteo', 'Costa', '1994-01-05', 'M', 'CSTMTT94A05H501G');



--Modifica il tipo della colonna (CodiceFiscale NVARCHAR(250) => Char(16))
--ALTER TABLE Studente
--ALTER COLUMN CodiceFiscale CHAR(16);
-- Definisce il valore fissa della colonna (Genere CHAR(1))
ALTER TABLE Studente
Add Constraint CK_Studente_Genere
CHECK(Genere IN ('M', 'F') AND Genere IS NOT NULL)


/*
Visualizzazione e filtro dati
SELECT visualizza i dati inseriti e 
WHERE filtra i risultati secondo criteri specifici.

Gli operatori logici in sql Servono per combinare condizioni nel WHERE.
------------------------------------------------------
| Operatore | Significato                            |
| --------- | -------------------------------------- |
| AND       | Tutte le condizioni devono essere vere |
| OR        | Basta una condizione vera              |
| NOT       | Nega una condizione                    |
| BETWEEN   | Intervallo                             |
| IN        | Lista di valori                        |
| LIKE      | Ricerca testuale                       |
| IS NULL   | Valore nullo                           |
------------------------------------------------------
*/

Select * From Studente where StudenteId = 7
Select * From Studente WHERE Genere = 'F'
Select * From Studente Where Genere = 'M'
Select * From Studente Where Cognome LIKE 'R%'
Select * From Studente Where Cognome LIKE 'R%' AND Cognome = 'Romano'
Select * From Studente WHERE Genere = 'F' and DataNascita is not null


Select Nome, CodiceFiscale from Studente order by Nome Desc
Select StudenteId , CodiceFiscale,  Nome, Cognome, DataNascita, Genere  from Studente order by Nome Desc

-- Restiture l'elecnco degli studenti che sono nati prima dell'anno 2000
-- Restituire solo gli studente maschi nati dopo anno 1996

SELECT * FROM Studente WHERE DataNascita < '2000-05-15'
SELECT * FROM Studente WHERE Genere = 'M' AND DataNascita > '1996-12-31';

-- 3) Restituire Nome e Cognome degli studenti femmina nati tra il 1998 e il 2002
SELECT Nome, Cognome
FROM Studente
WHERE Genere = 'F'
AND DataNascita BETWEEN '1998-01-01' AND '2002-12-31';