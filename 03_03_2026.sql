CREATE TABLE Classe (
    ClasseId INTEGER PRIMARY KEY IDENTITY(1,1),
    NomeClasse NVARCHAR(50) NOT NULL,
    AnnoScolastico NVARCHAR(9) NOT NULL
);


-- Modifica tabella Studente per collegare la classe
ALTER TABLE Studente
ADD ClasseId INT;

ALTER TABLE Studente
ADD CONSTRAINT FK_Studente_Classe
FOREIGN KEY (ClasseId)
REFERENCES Classe(ClasseId);

-- Insert Studenti
INSERT INTO Studente
	(StudenteId, Nome, Cognome, DataNascita, Genere, CodiceFiscale, ClasseId)
VALUES
('Luca','Rossi','2000-05-15','M','CF0001',1),
('Maria','Bianchi','1999-03-22','F','CF0002',2),
('Marco','Verdi','2001-07-10','M','CF0003',3),
('Sara','Conti','2000-11-02','F','CF0004',4),
('Davide','Ricci','1998-09-19','M','CF0005',5),
('Elena','Romano','2002-01-25','F','CF0006',6),
('Matteo','Costa','1997-12-12','M','CF0007',7),
('Chiara','Gallo','2001-04-04','F','CF0008',8),
('Giovanni','Ferrari','1996-08-08','M','CF0009',9),
('Alice','Malba','1995-02-10','F','CF0010',10),
('Simone','Greco','2000-06-30','M','CF0011',11),
('Laura','Riva','1999-10-14','F','CF0012',12),
('Andrea','Lombardi','2001-02-20','M','CF0013',13),
('Francesca','Barbieri','2002-05-18','F','CF0014',14),
('Alessio','Marini','1998-01-09','M','CF0015',15),
('Valentina','Moretti','2000-07-21','F','CF0016',16),
('Federico','Testa','1997-03-11','M','CF0017',17),
('Martina','De Luca','1999-12-01','F','CF0018',18),
('Emanuele','Serra','2001-09-09','M','CF0019',19),
('Giulia','Villa','2002-04-30','F','CF0020',20),
('Riccardo','Fontana','1996-06-16','M','CF0021',21),
('Silvia','Leone','1998-08-22','F','CF0022',22),
('Tommaso','Longo','2000-01-05','M','CF0023',23),
('Irene','Gatti','1999-11-17','F','CF0024',24),
('Paolo','Ferri','2001-03-29','M','CF0025',25),
('Claudia','Messina','2002-10-13','F','CF0026',26),
('Giorgio','Caruso','1997-02-02','M','CF0027',27),
('Beatrice','Sala','1998-12-24','F','CF0028',28),
('Stefano','Mancini','2000-09-19','M','CF0029',29),
('Noemi','Martini','2001-06-07','F','CF0030',30);


-- Insert Classe
INSERT INTO Classe (ClasseId, NomeClasse, AnnoScolastico) VALUES
('1A Informatica','2022/2023'),
('1B Informatica','2022/2023'),
('1C Informatica','2022/2023'),
('2A Informatica','2023/2024'),
('2B Informatica','2023/2024'),
('2C Informatica','2023/2024'),
('3A Informatica','2024/2025'),
('3B Informatica','2024/2025'),
('3C Informatica','2024/2025'),
('4A Informatica','2022/2023'),
('4B Informatica','2022/2023'),
('4C Informatica','2022/2023'),
('5A Informatica','2023/2024'),
('5B Informatica','2023/2024'),
('5C Informatica','2023/2024'),
('1A Amministrazione Finanza e Marketing','2022/2023'),
('1B Amministrazione Finanza e Marketing','2022/2023'),
('1C Amministrazione Finanza e Marketing','2022/2023'),
('2A Amministrazione Finanza e Marketing','2023/2024'),
('2B Amministrazione Finanza e Marketing','2023/2024'),
('2C Amministrazione Finanza e Marketing','2023/2024'),
('3A Amministrazione Finanza e Marketing','2024/2025'),
('3B Amministrazione Finanza e Marketing','2024/2025'),
('3C Amministrazione Finanza e Marketing','2024/2025'),
('1A Liceo Scientifico','2022/2023'),
('1B Liceo Scientifico','2022/2023'),
('1C Liceo Scientifico','2022/2023'),
('2A Liceo Scientifico','2023/2024'),
('2B Liceo Scientifico','2023/2024'),
('2C Liceo Scientifico','2023/2024');



-- Insert Iscrizioni Materia
INSERT INTO IscrizioneMateria
(IscrizioneId, StudenteId, MateriaId)
VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),
(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30);