-- c)
-- 1)
SELECT * FROM Cliente;

-- 2)
SELECT Nome FROM Cliente
	WHERE Localidade='Aguada do Queixo';
    
-- 3)
SELECT DISTINCT (Profissao) FROM Cliente;

-- 4)
SELECT Designacao, Preco FROM Produto
	ORDER BY Designacao;
    
-- 5)
SELECT Numero, Total FROM Venda
	WHERE Data='2017/10/05';

SELECT vp.Venda, p.Designacao
		FROM VendaProduto vp, Produto p
        WHERE p.Numero=vp.Produto AND Venda=1;
-- d)
-- 1)

INSERT INTO Cliente
	(Numero, Nome, DataNascimento, Profissao, Rua, Localidade, CodPostal, Contribuinte, eMail, Compras, RecomendadoPor)
	VALUES 
    (10, 'João da Costa e Campos', 	'1983/12/31',	'Taberneiro', 'Rua das Adegas Felizes, 12, 1ª Cave', 'Aguada do Queixo', 
			'9999-99-99 Queijadas', 	123456789, 'jcc@acacia.pt', 0, NULL);
            
-- 2)
UPDATE Cliente SET Rua = "Uma rua qualquer" 
	WHERE numero=10;

-- 3)
UPDATE Produto SET Preco=Preco * 1.1
	WHERE Tipo='Peixe';
    
-- 4)
INSERT INTO Venda (Numero, Data, Estado, Total, Cliente)
	VALUES 
		(6, "2017-10-30", 'S', 0, 10);
        
INSERT INTO VendaProduto (Venda, Produto, Quantidade, Preco, Valor)
	VALUES
		(6, 1, 1, (SELECT Preco FROM Produto WHERE Numero = 1),(SELECT Preco FROM Produto WHERE Numero = 1)*1)

INSERT INTO VendaProduto (Venda, Produto, Quantidade, Preco, Valor)
	VALUES
		(6, 2, 1, (SELECT Preco FROM Produto WHERE Numero = 1),(SELECT Preco FROM Produto WHERE Numero = 2)*1)
        
INSERT INTO VendaProduto (Venda, Produto, Quantidade, Preco, Valor)
	VALUES
		(6, 3, 1, (SELECT Preco FROM Produto WHERE Numero = 1),(SELECT Preco FROM Produto WHERE Numero = 3)*1)
        
INSERT INTO VendaProduto (Venda, Produto, Quantidade, Preco, Valor)
	VALUES
		(6, 4, 1, (SELECT Preco FROM Produto WHERE Numero = 1),(SELECT Preco FROM Produto WHERE Numero = 4)*1)
        
UPDATE Venda SET Total=(SELECT SUM(Valor) FROM Venda=1)
	WHERE Numero=6;

-- 5)
DELETE FROM VendaProduto WHERE Venda=6;
DELETE FROM Venda WHERE Venda=6;