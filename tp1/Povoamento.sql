

-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (27381729381, 'José Bastos', 'Alameda da Esquina nº33', 4715-321, 'Pousada Pessoa');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (26318372912, 'Maria Rodrigues', 'Avenida da Tapada, nº64', 4770-417, 'Joane');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (36172316293, 'Ana Marinho', 'Serafim Sampaio, nº8', 4715-606, 'Ferreiros');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (13719382712, 'Paulo Pessoa', 'Franciscano Amargo, nº33', 4700-413, 'Nogueira');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (16391827212, 'Ilidio Faria', 'Travessa da Charmuta, nº69', 4710-451, 'Vermoim');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (16253516276, 'Eduardo Miranda', 'Largo dos Peões, nº22', 4705-323, 'Gualtar');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (36271827321, 'Manuel Gomes', 'Marco Espinosa, nº3', 4700- 212, 'Belém');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (16263717261, 'Teresa Carvalho', 'Fernando Gomes, nº10', 4700-313, 'Carvalhos');
INSERT INTO `Comboios Sociais`.`Cliente` (`NISS`, `Nome`, `Rua`, `CodPost`, `Ender`) VALUES (15251623122, 'Joaquim Fernandes', 'Franciscano Afonsino, nº63', 4715-717, 'Espinho');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Percurso`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Percurso` (`Origem`, `Destino`, `Linha`) VALUES ('Braga', 'Porto', 1);
INSERT INTO `Comboios Sociais`.`Percurso` (`Origem`, `Destino`, `Linha`) VALUES ('Porto', 'Braga', 1);
INSERT INTO `Comboios Sociais`.`Percurso` (`Origem`, `Destino`, `Linha`) VALUES ('Lisboa', 'Porto', 2);
INSERT INTO `Comboios Sociais`.`Percurso` (`Origem`, `Destino`, `Linha`) VALUES ('Porto', 'Lisboa', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Funcionario`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Funcionario` (`NFunc`, `Nome`, `NCC`, `Funcao`) VALUES (1, 'António Gomes Ramalho', 14693281, 'Maquinista');
INSERT INTO `Comboios Sociais`.`Funcionario` (`NFunc`, `Nome`, `NCC`, `Funcao`) VALUES (2, 'João Miguel Raminhos Martinha', 13814356, 'Vendedor');
INSERT INTO `Comboios Sociais`.`Funcionario` (`NFunc`, `Nome`, `NCC`, `Funcao`) VALUES (3, 'José Pedro Carvalho Silva', 12345754, 'Maquinista');
INSERT INTO `Comboios Sociais`.`Funcionario` (`NFunc`, `Nome`, `NCC`, `Funcao`) VALUES (4, 'Manuel Damásio Henriques', 15372917, 'Vendedor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Comboio`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Comboio` (`NComb`, `Funcionario`) VALUES (1, 1);
INSERT INTO `Comboios Sociais`.`Comboio` (`NComb`, `Funcionario`) VALUES (2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Bilhete`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (1000, 3, '2016-02-26 09:34:00.000', 2, '2016-03-01 09:00:00.000', '2016-03-01 09:30:00.000', 1, 15251623122, NULL, 'Braga', 'Porto');
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (1010, 2, '2016-02-20 10:33:21.020', 2, '2016-03-01 09:00:00.000', '2016-10-01 07:30:00.000', 0, 27381729381, 4, 'Braga', 'Porto');
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (1077, 10, '2016-02-23 07:21:00.030', 2, '2016-03-01 09:00:00.000', '2016-10-01 07:30:00.000', 1, 26318372912, NULL, 'Braga', 'Porto');
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (1123, 7, '2016-02-23 21:20:37.123', 2, '2016-03-01 09:00:00.000', '2016-10-01 07:30:00.000', 1, 36172316293, NULL, 'Braga', 'Porto');
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (1570, 5, '2016-02-21 23:21:38.434', 2, '2016-03-01 09:00:00.000', '2016-10-01 07:30:00.000', 1, 13719382712, NULL, 'Braga', 'Porto');
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (2000, 1, '2016-09-01 14:32:21.121', 6, '2016-10-01 07:30:00.000', '2016-10-01 11:00:00.000', 0, 16391827212, 2, 'Porto', 'Lisboa');
INSERT INTO `Comboios Sociais`.`Bilhete` (`NumB`, `NumL`, `Data`, `Preco`, `HPart`, `HCheg`, `Reserva`, `Cliente`, `Funcionario`, `PerOrigem`, `PerDestino`) VALUES (2512, 10, '2016-09-21 15:22:00.173', 6, '2016-10-01 07:30:00.000', '2016-10-01 11:00:00.000', 1, 16253516276, NULL, 'Porto', 'Lisboa');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`PercursoComboio`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`PercursoComboio` (`Comboio`, `Origem`, `Destino`) VALUES (1, 'Braga', 'Porto');
INSERT INTO `Comboios Sociais`.`PercursoComboio` (`Comboio`, `Origem`, `Destino`) VALUES (1, 'Porto', 'Braga');
INSERT INTO `Comboios Sociais`.`PercursoComboio` (`Comboio`, `Origem`, `Destino`) VALUES (2, 'Porto', 'Lisboa');
INSERT INTO `Comboios Sociais`.`PercursoComboio` (`Comboio`, `Origem`, `Destino`) VALUES (2, 'Lisboa', 'Porto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Contacto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('965674321', 15251623122);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('963546121', 27381729381);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('967123112', 26318372912);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('917462711', 36172316293);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('912736123', 13719382712);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('931231231', 16391827212);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('253817212', 16253516276);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('226783451', 36271827321);
INSERT INTO `Comboios Sociais`.`Contacto` (`Contacto`, `Cliente`) VALUES ('211563782', 16263717261);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Comboios Sociais`.`Lugar`
-- -----------------------------------------------------
START TRANSACTION;
USE `Comboios Sociais`;
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (1, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (2, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (3, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (4, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (5, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (6, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (7, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (8, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (9, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (10, 1);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (1, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (2, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (3, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (4, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (5, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (6, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (7, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (8, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (9, 2);
INSERT INTO `Comboios Sociais`.`Lugar` (`Numero`, `Comboio`) VALUES (10, 2);

COMMIT;

