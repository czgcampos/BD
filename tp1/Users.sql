CREATE USER 'Administrador'
IDENTIFIED BY 'Administrador';

CREATE USER 'Cliente'
IDENTIFIED BY 'Cliente';

CREATE USER 'Vendedor'
IDENTIFIED BY 'Vendedor';

CREATE USER 'Maquinista'
IDENTIFIED BY 'Maquinista';

GRANT ALL ON ComboiosSociais.* TO 'Administrador';

GRANT SELECT(NumB,NumL,Preco,HPart,HCheg,PrecoR) ON Bilhete TO 'Cliente';

GRANT SELECT ON Percurso TO 'Cliente';

GRANT UPDATE(NumB, NumL, Data, Preco, HPart, HCheg, Reserva, Cliente, Funcionario, PerOrigem, PerDestino) ON Bilhete TO 'Vendedor';

GRANT INSERT, SELECT, DELETE, REFERENCES ON Bilhete TO 'Vendedor';

GRANT SELECT ON Cliente TO 'Vendedor';

GRANT SELECT ON Contacto TO 'Vendedor';

GRANT SELECT ON Funcionario TO 'Vendedor';

GRANT SELECT ON Comboio TO 'Maquinista';

GRANT SELECT ON Percurso TO 'Maquinista';

GRANT SELECT ON PercursoComboio TO 'Maquinista';

GRANT SELECT ON Lugar TO 'Maquinista';

GRANT SELECT ON Funcionario TO 'Maquinista';