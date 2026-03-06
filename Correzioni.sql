-- Mostra le 5 materie con media più alta

SELECT TOP 5 
m.NomeMateria,
AVG(i.Voto) AS MediaVoti
FROM Materia m
JOIN IscrizioneMateria i 
ON m.MateriaId = i.MateriaId
GROUP BY m.NomeMateria
ORDER BY MediaVoti DESC;


-- In SQLite
SELECT 
m.NomeMateria,
AVG(i.Voto) AS MediaVoti
FROM Materia m
JOIN IscrizioneMateria i 
ON m.MateriaId = i.MateriaId
GROUP BY m.NomeMateria
ORDER BY MediaVoti DESC
LIMIT 5;

--- Studenti con somma voti > 15

SELECT 
s.Nome,
s.Cognome,
SUM(i.Voto) AS SommaVoti
FROM Studente s
JOIN IscrizioneMateria i 
ON s.StudenteId = i.StudenteId
GROUP BY s.Nome, s.Cognome
HAVING SUM(i.Voto) > 15;

-- Studenti con almeno 2 iscrizioni
SELECT 
s.Nome,
s.Cognome,
COUNT(*) AS NumeroIscrizioni
FROM Studente s
JOIN IscrizioneMateria i 
ON s.StudenteId = i.StudenteId
GROUP BY s.Nome, s.Cognome
HAVING COUNT(*) >= 2;

-- Voto massimo per ogni materia
SELECT 
s.Nome,
s.Cognome,
MIN(i.Voto) AS VotoMinimo
FROM Studente s
JOIN IscrizioneMateria i 
ON s.StudenteId = i.StudenteId
GROUP BY s.Nome, s.Cognome;