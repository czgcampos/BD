DELIMITER $$
CREATE TRIGGER CalculaPrecoReserva 
	BEFORE INSERT ON Bilhete
    FOR EACH ROW
BEGIN
	SET NEW.PrecoR=NEW.Preco*NEW.Reserva*0.4;
END $$

DELIMITER $$
CREATE TRIGGER Checkhora 
	AFTER INSERT ON Bilhete
	FOR EACH ROW
	BEGIN
		IF (new.HPart > new.HCheg) 
        THEN
			signal SQLState '45000'
				SET message_text = 'Hora de partida maior que a hora de chegada';
		END IF;
	END;
$$

DELIMITER $$
CREATE TRIGGER Checkfuncaoi 
	AFTER INSERT ON Funcionario
    FOR EACH ROW
	BEGIN
		IF (new.Funcao not in('Vendedor','Maquinista'))
        THEN
			signal SQLState '45000'
				SET message_text = 'Função do funcionário tem de ser vendedor ou maquinista';
		END IF;
	END;
$$

DELIMITER $$
CREATE TRIGGER Checkfuncaou
	AFTER UPDATE ON Funcionario
    FOR EACH ROW
	BEGIN
		IF (new.Funcao not in('Vendedor','Maquinista'))
        THEN
			signal SQLState '45000'
				SET message_text = 'Função do funcionário tem de ser vendedor ou maquinista';
		END IF;
	END;
$$

DELIMITER $$
CREATE TRIGGER CheckLugar
	AFTER INSERT ON Lugar
	FOR EACH ROW
    BEGIN
		IF(new.Numero>10 || new.Numero<1)
        THEN
			signal SQLState '45000'
				SET message_text = 'Número do lugar do comboio fora da capacidade máxima';
		END IF;
	END;
$$