-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Comboios Sociais
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Comboios Sociais
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Comboios Sociais` DEFAULT CHARACTER SET utf8 ;
USE `Comboios Sociais` ;

-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Cliente` (
  `NISS` BIGINT(13) UNSIGNED NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Rua` VARCHAR(50) NULL,
  `CodPost` INT(7) UNSIGNED NULL,
  `Ender` VARCHAR(30) NULL,
  PRIMARY KEY (`NISS`),
  UNIQUE INDEX `indCliente` (`NISS` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Percurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Percurso` (
  `Origem` VARCHAR(30) NOT NULL,
  `Destino` VARCHAR(30) NOT NULL,
  `Linha` INT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`Origem`, `Destino`),
  UNIQUE INDEX `indPercurso` (`Origem` ASC, `Destino` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Funcionario` (
  `NFunc` INT(5) UNSIGNED NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `NCC` INT(8) UNSIGNED NOT NULL,
  `Funcao` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`NFunc`),
  UNIQUE INDEX `indFuncionario` (`NFunc` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Comboio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Comboio` (
  `NComb` INT(2) UNSIGNED NOT NULL,
  `Funcionario` INT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`NComb`),
  UNIQUE INDEX `indComboio` (`NComb` ASC),
  CONSTRAINT `fk_Comboio_1`
    FOREIGN KEY (`Funcionario`)
    REFERENCES `Comboios Sociais`.`Funcionario` (`NFunc`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Bilhete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Bilhete` (
  `NumB` INT(7) UNSIGNED NOT NULL,
  `NumL` INT(2) UNSIGNED NOT NULL,
  `Data` DATETIME NOT NULL DEFAULT '2000-01-01 00:00:00.000',
  `Preco` DECIMAL(4,2) UNSIGNED NOT NULL,
  `HPart` DATETIME NOT NULL,
  `HCheg` DATETIME NOT NULL,
  `Reserva` INT(1) UNSIGNED NOT NULL,
  `Cliente` BIGINT(13) UNSIGNED NOT NULL DEFAULT 0000000000000,
  `Funcionario` INT(5) UNSIGNED NULL,
  `PerOrigem` VARCHAR(30) NOT NULL,
  `PerDestino` VARCHAR(30) NOT NULL,
  `PrecoR` DECIMAL(4,2) NULL,
  PRIMARY KEY (`NumB`),
  INDEX `indBilhete` (`NumB` ASC),
  INDEX `fk_Bilhete_1_idx` (`Cliente` ASC),
  CONSTRAINT `fk_Bilhete_1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Comboios Sociais`.`Cliente` (`NISS`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bilhete_2`
    FOREIGN KEY (`Funcionario`)
    REFERENCES `Comboios Sociais`.`Funcionario` (`NFunc`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bilhete_3`
    FOREIGN KEY (`PerOrigem` , `PerDestino`)
    REFERENCES `Comboios Sociais`.`Percurso` (`Origem` , `Destino`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Comboios Sociais`.`PercursoComboio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`PercursoComboio` (
  `Comboio` INT(2) UNSIGNED NOT NULL,
  `Origem` VARCHAR(30) NOT NULL,
  `Destino` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Comboio`, `Origem`, `Destino`),
  UNIQUE INDEX `indPercursoComboio` (`Comboio` ASC, `Origem` ASC, `Destino` ASC),
  CONSTRAINT `fk_PercursoComboio_1`
    FOREIGN KEY (`Comboio`)
    REFERENCES `Comboios Sociais`.`Comboio` (`NComb`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PercursoComboio_2`
    FOREIGN KEY (`Origem` , `Destino`)
    REFERENCES `Comboios Sociais`.`Percurso` (`Origem` , `Destino`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Contacto` (
  `Contacto` VARCHAR(50) NOT NULL,
  `Cliente` BIGINT(13) UNSIGNED NOT NULL,
  PRIMARY KEY (`Contacto`,`Cliente`),
  UNIQUE INDEX `indContacto` (`Contacto` ASC, `Cliente` ASC),
  CONSTRAINT `fk_Contacto_1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Comboios Sociais`.`Cliente` (`NISS`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Comboios Sociais`.`Lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Comboios Sociais`.`Lugar` (
  `Numero` INT(2) UNSIGNED NOT NULL,
  `Comboio` INT(2) UNSIGNED NOT NULL,
  PRIMARY KEY (`Numero`, `Comboio`),
  UNIQUE INDEX `indLugar` (`Numero` ASC,`Comboio` ASC),
  CONSTRAINT `fk_Lugar_1`
    FOREIGN KEY (`Comboio`)
    REFERENCES `Comboios Sociais`.`Comboio` (`NComb`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;