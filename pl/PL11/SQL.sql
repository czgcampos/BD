-- a)
SELECT doc.Nome AS Responsavel, d.Designacao AS Disciplina
	FROM Docente doc, Disciplina d
    WHERE d.Responsavel=doc.Codigo;
    
-- b)
SELECT COUNT(d.Responsavel) AS Total, doc.Nome
	FROM Disciplina d, Docente doc
    WHERE d.Responsavel=doc.Codigo
    GROUP BY d.Responsavel
    ORDER BY total DESC
    LIMIT 3;

-- c)
-- ...

-- d)
SELECT * FROM Questao q
	WHERE q.Exame=(
		SELECT ed.Exame FROM ExameDisciplina ed
			WHERE ed.ano=2013 AND ed.Ordem AND ed.Ordem=1 AND ed.Disciplina=(
				SELECT Codigo FROM Disciplina d
					WHERE d.Designacao='Base de Dados'))
                    
-- e)
CREATE TRIGGER atualiza_dificuldade AFTER INSERT ON Questao
	FOR EACH ROW
		UPDATE Exame e SET e.Dificuldade=(
			SELECT AVG(q.Dificuldade) FROM Questao q
				WHERE q.Exame=NEW.Exame)
		WHERE e.Codigo=NEW.Exame