CREATE VIEW BilhetesDisponiveis AS 
	SELECT NumB, Preco, HPart, NumL, PerOrigem, PerDestino
    FROM Bilhete
    WHERE Cliente=0;