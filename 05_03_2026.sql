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

 --- Media generale
 SELECT AVG(Voto) FROM IscrizioneMateria;

 --1) Somma totale di tutti i voti
 SELECT 
	SUM(Voto) AS 'SOMMA TOTALE DEI VOTI' 
 FROM IscrizioneMateria;

 --2) Somma voti per studente (StudenteId, Somma dei Voti)
 SELECT 
	StudenteId,
	Sum(Voto) AS 'SOMMA TOTALE DEI VOTI' 
FROM IscrizioneMateria  
GROUP BY StudenteId

Select * from Studente
Select * from Classe

 --3) Studente con voto più alto (Nome completo dello studente(Studente(Classe)), Media dei voti(IscrizioneMatera))
 SELECT
	s.Nome + ' ' + s.Cognome as	'Nome completo dello studente',
	AVG(Voto) AS Media
 FROM Studente AS s
 JOIN IscrizioneMateria AS i
	ON s.StudenteId = i.StudenteId
 GROUP BY s.Nome, s.Cognome
 ORDER BY Media DESC
 

 -- TOP (SQL Server, Limit SQLite) Serve per prendere i primi N risultati.
  --3) Restituire solo i primi 5 Studente con voto più alto (Nome completo dello studente(Studente(Classe)), Media dei voti(IscrizioneMatera))
 SELECT
	TOP 10
	s.Nome + ' ' + s.Cognome as	'Nome completo dello studente',
	AVG(Voto) AS Media
 FROM Studente AS s
 JOIN IscrizioneMateria AS i
	ON s.StudenteId = i.StudenteId
 GROUP BY s.Nome, s.Cognome
 ORDER BY Media DESC


 --4) Quanti insufficienti (<6)
select 
	Count(*) as insufficienti
from IscrizioneMateria
where Voto < 6

 --1) Somma totale di tutti i voti per Materia (MateriaId, Totale dei Voti per Materia)
 SELECT 
	MateriaId,
	SUM(Voto) AS 'Totale dei Voti per Materia' 
 FROM IscrizioneMateria
 GROUP BY MateriaId;

 --Usa TOP per restiture i pri 5 voti più alti e ordina in desc
 SELECT TOP 5 * FROM IscrizioneMateria ORDER BY Voto DESC
 SELECT TOP 5 * FROM IscrizioneMateria ORDER BY MateriaId 

 -- TOP 3
 -- NOME E COGNOME = NOME COMPLETO DELLO STUDENTE 
 -- MEDIA DEI VOTI (AVG())  => IscrizioneMateria
 -- join = INNER JOIN (Che cosa hanno in comune) != Left
 -- group by nome e cognome
 -- order by Media
  SELECT
	TOP 3
	s.Nome + ' ' + s.Cognome as	'Nome completo dello studente',
	AVG(Voto) AS Media
 FROM Studente AS s
 JOIN IscrizioneMateria AS i
	ON s.StudenteId = i.StudenteId

 GROUP BY s.Nome, s.Cognome
 ORDER BY Media DESC

 -- WHERE firltra prima il Group by 
 -- HAVING firltra dopo il Group by 


  SELECT 
	top 5
	StudenteId,
	SUM(Voto) AS Media
 FROM IscrizioneMateria
 GROUP BY StudenteId
 HAVING SUM(Voto) >= 5;

 
  SELECT 
	MateriaId,
	SUM(Voto) AS Totale
 FROM IscrizioneMateria
 GROUP BY MateriaId
 HAVING SUM(Voto) <= 18
 Order by Totale DESC

 -- IF => 
/*
 IF{}
	CASE
	  WHEN	CONDIZIONE Then
	  ELSE
	END AS NOME 
*/

SELECT
	s.StudenteId,
	s.Nome AS 'Nome Studente',
	s.Cognome AS 'Cognome Studente',
	m.NomeMateria AS 'Nome Materia',
	i.Voto,

	CASE
		WHEN i.Voto >= 10 THEN 'Pormosso'
		ELSE 'Bocciato'
	END AS Risultato

FROM Studente AS s
INNER JOIN IscrizioneMateria AS i 
	ON s.StudenteId = i.StudenteId
INNER JOIN Materia AS m		
	ON i.MateriaId = m.MateriaId
GROUP BY s.Nome, s.Cognome, m.NomeMateria, i.Voto, s.StudenteId
HAVING AVG(i.Voto) >= 10
ORDER BY s.StudenteId, Risultato DESC

-- RESTITUIRE IL NOME, COGNOME, MEDIA, VOTOMIONIMO, VOTOMASSIMO (STUDENTE, ISCRIZIONEMATERIA)
SELECT TOP 10
   s.StudenteId,
   s.Nome,
   s.Cognome,
   AVG(i.Voto) AS Media,
   Max(i.Voto) AS VotoMassimo,
   Min(i.Voto) AS VotoMinimo
FROM Studente AS s
JOIN IscrizioneMateria AS i 
	On s.StudenteId = i.StudenteId
GROUP BY s.StudenteId, s.Nome, s.Cognome
ORDER BY Media DESC


SELECT * FROM IscrizioneMateria WHERE Voto >= 15

SELECT 
	* 
FROM IscrizioneMateria
WHERE Voto >= (
	SELECT 
		AVG(Voto)
	 FROM IscrizioneMateria
);

select Max(Voto) from IscrizioneMateria 

SELECT * 
FROM IscrizioneMateria 
where voto = (
	Select Max(Voto)
from IscrizioneMateria
);

SELECT * 
FROM IscrizioneMateria 
where voto = (
	Select MIN(Voto)
from IscrizioneMateria
);


SELECT 
	s.Nome + ' ' + s.Cognome AS 'Nome completo',
	AVG(i.Voto) AS MediaStudente
 FROM Studente AS s 
 INNER Join IscrizioneMateria AS i
	On i.StudenteId = s.StudenteId
 GROUP BY s.Nome, s.Cognome
 HAVING AVG(Voto) > 
 (
	SELECT AVG(Voto) from IscrizioneMateria
 )
 Order by MediaStudente DESC