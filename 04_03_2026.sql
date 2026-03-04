CREATE TABLE Materia (
    MateriaId int PRIMARY KEY  IDENTITY(1,1),
    NomeMateria NVARCHAR(50) NOT NULL
);

--Insert Materia


INSERT INTO Materia (NomeMateria) VALUES
('Matematica'),
('Informatica'),
('Italiano'),
('Storia'),
('Inglese'),
('Fisica'),
('Chimica'),
('Biologia'),
('Geografia'),
('Diritto'),
('Economia'),
('Arte'),
('Musica'),
('Scienze Motorie'),
('Religione'),
('Sistemi'),
('TPSIT'),
('Reti'),
('Database'),
('Programmazione'),
('Francese'),
('Spagnolo'),
('Filosofia'),
('Letteratura'),
('Statistica'),
('Algoritmi'),
('Elettronica'),
('Meccanica'),
('Robotica'),
('Cybersecurity');

SELECT * FROM Materia 

SELECT * FROM Studente 

CREATE TABLE IscrizioneMateria
(   
    IscrizioneId INT PRIMARY KEY IDENTITY(1,1),
    StudenteId INT NULL,
    MateriaId INT NULL,
    FOREIGN KEY (StudenteId) REFERENCES Studente(StudenteId),
    FOREIGN KEY (MateriaId) REFERENCES Materia(MateriaId)
);


-- Insert Iscrizioni Materia
INSERT INTO IscrizioneMateria
(StudenteId, MateriaId)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30);

SELECT * FROM IscrizioneMateria


-- Aggiunto della colonna voto
ALTER TABLE IscrizioneMateria
ADD Voto DECIMAL(4,2);


-- Modifica (Update) di una colonna in sql server
/*
Update nome della tabella
set nome della colonna = valore
where il nome della colonna = il volore 
*/

UPDATE IscrizioneMateria SET Voto = 7.5 WHERE IscrizioneId = 1;
UPDATE IscrizioneMateria SET Voto = 6.0 WHERE IscrizioneId = 2;
UPDATE IscrizioneMateria SET Voto = 8.0 WHERE IscrizioneId = 3;
UPDATE IscrizioneMateria SET Voto = 5.5 WHERE IscrizioneId = 4;
UPDATE IscrizioneMateria SET Voto = 9.0 WHERE IscrizioneId = 5;
UPDATE IscrizioneMateria SET Voto = 6.5 WHERE IscrizioneId = 6;
UPDATE IscrizioneMateria SET Voto = 7.0 WHERE IscrizioneId = 7;
UPDATE IscrizioneMateria SET Voto = 8.5 WHERE IscrizioneId = 8;
UPDATE IscrizioneMateria SET Voto = 4.5 WHERE IscrizioneId = 9;
UPDATE IscrizioneMateria SET Voto = 10.0 WHERE IscrizioneId = 10;
UPDATE IscrizioneMateria SET Voto = 6.8 WHERE IscrizioneId = 11;
UPDATE IscrizioneMateria SET Voto = 7.2 WHERE IscrizioneId = 12;
UPDATE IscrizioneMateria SET Voto = 5.0 WHERE IscrizioneId = 13;
UPDATE IscrizioneMateria SET Voto = 8.7 WHERE IscrizioneId = 14;
UPDATE IscrizioneMateria SET Voto = 9.5 WHERE IscrizioneId = 15;
UPDATE IscrizioneMateria SET Voto = 6.3 WHERE IscrizioneId = 16;
UPDATE IscrizioneMateria SET Voto = 7.9 WHERE IscrizioneId = 17;
UPDATE IscrizioneMateria SET Voto = 5.8 WHERE IscrizioneId = 18;
UPDATE IscrizioneMateria SET Voto = 8.2 WHERE IscrizioneId = 19;
UPDATE IscrizioneMateria SET Voto = 6.7 WHERE IscrizioneId = 20;
UPDATE IscrizioneMateria SET Voto = 7.4 WHERE IscrizioneId = 21;
UPDATE IscrizioneMateria SET Voto = 9.1 WHERE IscrizioneId = 22;
UPDATE IscrizioneMateria SET Voto = 4.8 WHERE IscrizioneId = 23;
UPDATE IscrizioneMateria SET Voto = 8.9 WHERE IscrizioneId = 24;
UPDATE IscrizioneMateria SET Voto = 6.2 WHERE IscrizioneId = 25;
UPDATE IscrizioneMateria SET Voto = 7.6 WHERE IscrizioneId = 26;
UPDATE IscrizioneMateria SET Voto = 5.9 WHERE IscrizioneId = 27;
UPDATE IscrizioneMateria SET Voto = 8.4 WHERE IscrizioneId = 28;
UPDATE IscrizioneMateria SET Voto = 6.6 WHERE IscrizioneId = 29;
UPDATE IscrizioneMateria SET Voto = 9.8 WHERE IscrizioneId = 30;


select * from Studente
Update Studente SET DataNascita = '2000-12-23' WHERE DataNascita IS NULL
UPDATE Studente SET ClasseId = 30 WHERE CodiceFiscale like 'R%'
UPDATE Studente SET ClasseId = 5 WHERE Genere = 'F' AND StudenteId IN (1,2,3,5,7)

/***************************************************
 *       FUNZIONI AGGREGATE IN SQL                 *
 *  Servono per fare calcoli su più righe.         *
 *                                                 *
 *       | Funzione | Cosa fa        |             *
 *       | -------- | -------------- |             *
 *       | COUNT()  | Conta le righe |             *
 *       | SUM()    | Somma valori   |             *
 *       | AVG()    | Media          |             *
 *       | MIN()    | Valore minimo  |             *
 *       | MAX()    | Valore massimo |             *
 ***************************************************/

 select * from Studente
 select * from Classe

 /*
   Restutire la lista degli studente che sono scritti ad una classe 
   che comincia con 1A Compi da visualizzare 
   "Nome complete dello studente e il codice fiscale"

   // Inner join (Join), Left join, Right Join, Full join
 */
  select * from Studente
  select * from Classe

  Select 
    s.Nome + ' ' + s.Cognome AS 'Nome complete dello studente',
    s.CodiceFiscale
  from Studente as s
  Inner join Classe as c 
    ON s.ClasseId = c.ClasseId
  WHERE c.NomeClasse LIKE '2A%' and s.ClasseId is null


-- COUNT() conta tuut le righe
SELECT 
    Count(*) as TotaleRighe
FROM Studente

-- MIN() e MAX() 
SELECT MIN(Voto) FROM IscrizioneMateria -- Voto minimo
SELECT MAX(Voto) FROM IscrizioneMateria -- Voto media

-- AVG()
SELECT 
    i.MateriaId,
    AVG(i.Voto) AS 'Media Materia'
FROM IscrizioneMateria AS i
GROUP BY I.MateriaId;


-- SUM()


