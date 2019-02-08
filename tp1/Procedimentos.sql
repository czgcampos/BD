DELIMITER $$
CREATE PROCEDURE ListaBilhetesCliente(IN inCliente BIGINT(13))
BEGIN
	SELECT * FROM Bilhete
		WHERE Cliente=inCliente;
END $$

CALL ListaBilhetesCliente(15251623122);

DELIMITER $$
CREATE PROCEDURE ListaFuncionarios()
BEGIN
	SELECT * FROM Funcionario
		ORDER BY Nome ASC;
END $$

CALL ListaFuncionarios();

DELIMITER $$
CREATE PROCEDURE LugaresVazios(IN inPartida DATETIME, IN inChegada DATETIME, IN inOrigem VARCHAR(30), IN inDestino VARCHAR(30))
BEGIN
SELECT DISTINCT Numero FROM Lugar AS L
	JOIN Comboio ON Comboio.NComb=L.Comboio
    JOIN PercursoComboio AS PC ON PC.Comboio=Comboio.NComb
    JOIN Percurso AS P ON (P.Origem=PC.Origem AND P.Destino=PC.Destino)
    JOIN Bilhete AS B ON (B.PerOrigem=PC.Origem AND B.PerDestino=PC.Destino)
    WHERE L.Numero NOT IN (SELECT NumL FROM Bilhete as B WHERE B.PerOrigem=inOrigem AND B.PerDestino=inDestino AND B.HPart=inPartida && B.HCheg=inChegada AND B.Cliente <> 0000000000000) And P.Origem=inOrigem AND P.Destino=inDestino AND B.HPart=inPartida && B.HCheg=inChegada;
END $$