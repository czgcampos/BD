-- 1)
SELECT PagCaderneta FROM Cromo
	INNER JOIN Jogador ON Cromo.Jogador=Jogador.Nr
    INNER JOIN Posicao ON Jogador.Posicao=Posicao.Id
    INNER JOIN Equipa ON Jogador.Equipa=Equipa.Id
    WHERE (Equipa.Designacao="Sporting Clube de Braga" OR Equipa.Designacao="Rio Ave Futebol Clube")
		AND Posicao.Designacao="Defesa"
        
-- 2)
SELECT Cromo.Nr FROM Cromo
	INNER JOIN Jogador ON Cromo.Jogador=Jogador.Nr
    INNER JOIN Posicao ON Jogador.Posicao=Posicao.Id
    INNER JOIN Equipa ON Jogador.Equipa=Equipa.Id
    WHERE Posicao.Designacao NOT IN ("Medio","Defesa") 
		AND Equipa.Treinador IN ("Jorge Jesus","Nuno Espírito Santo")

-- 3)
CREATE VIEW CromosEmfalta AS
	SELECT Cromo.Nr, Jogador.Nome, Equipa.Designacao FROM Cromo
		INNER JOIN Jogador ON Cromo.Jogador=Jogador.Nr
		INNER JOIN Posicao ON Jogador.Posicao=Posicao.Id
		INNER JOIN Equipa ON Jogador.Equipa=Equipa.Id
        WHERE Cromo.Adquirido = 'N'
        
SELECT * FROM Cromo        

-- 4)
DELIMITER $$
CREATE PROCEDURE EquipaCompleta(IN nome VARCHAR(75))
BEGIN
	SELECT * FROM Cromo
		INNER JOIN Jogador ON Cromo.Jogador=Jogador.Nr
		INNER JOIN Equipa ON Jogador.Equipa=Equipa.Id
		WHERE Equipa.Designacao=nome
			ORDER BY Cromo.PagCaderneta, Cromo.Nr;
END $$

-- 5)
DELIMITER $$
CREATE PROCEDURE CardenetaCompleta ()
BEGIN
	SELECT Cromo.Nr, TipoCromo.Descricao, Jogador.Nome, Equipa.Designacao, Cromo.Adquirido FROM Cromo
		INNER JOIN Jogador ON Cromo.Jogador=Jogador.Nr
		INNER JOIN TipoCromo ON TipoCromo.Nr=Cromo.Tipo
		INNER JOIN Equipa ON Jogador.Equipa=Equipa.Id;
END $$

-- 6)
DELIMITER $$
CREATE FUNCTION (cromo_id INT)
	RETURNS CHAR(1)
BEGIN
	DECLARE repetido CHAR(1);
    SET repetido = (SELECT Adquirido FROM Cromo WHERE Nr = cromo_id)
END $$