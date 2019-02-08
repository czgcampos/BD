-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Departamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Departamento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Departamento` DEFAULT CHARACTER SET utf8 ;
USE `Departamento` ;

-- -----------------------------------------------------
-- Table `Departamento`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`Categoria` (
  `IdCategoria` INT NOT NULL,
  `Designacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`.`Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`Docente` (
  `Codigo` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Categoria` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Docente_1_idx` (`Categoria` ASC),
  CONSTRAINT `fk_Docente_1`
    FOREIGN KEY (`Categoria`)
    REFERENCES `Departamento`.`Categoria` (`IdCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`Disciplina` (
  `Codigo` INT NOT NULL,
  `Designacao` VARCHAR(30) NOT NULL,
  `Responsavel` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Disciplina_1_idx` (`Responsavel` ASC),
  CONSTRAINT `fk_Disciplina_1`
    FOREIGN KEY (`Responsavel`)
    REFERENCES `Departamento`.`Docente` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`Curso` (
  `Codigo` INT NOT NULL,
  `Designacao` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`Codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`Exame` (
  `Numero` INT NOT NULL,
  `Dificuldade` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`.`Questao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`Questao` (
  `Numero` INT NOT NULL,
  `Enunciado` TEXT(150) NOT NULL,
  `Dificuldade` TINYINT(4) NOT NULL,
  `Pontuacao` DECIMAL(3,1) NOT NULL,
  `Ordem` TINYINT(4) NOT NULL,
  `Exame` INT NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Questao_1_idx` (`Exame` ASC),
  CONSTRAINT `fk_Questao_1`
    FOREIGN KEY (`Exame`)
    REFERENCES `Departamento`.`Exame` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'check_dificuldade' CHECK (Dificuldade>=1 AND Dificuldade<=5))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Departamento`.`ExameDisciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Departamento`.`ExameDisciplina` (
  `Exame` INT NOT NULL,
  `Disciplina` INT NOT NULL,
  `Ano` TINYINT(4) NOT NULL,
  `Ordem` TINYINT(4) NOT NULL,
  PRIMARY KEY (`Exame`, `Disciplina`),
  INDEX `fk_ExameDisciplina_1_idx` (`Disciplina` ASC),
  CONSTRAINT `fk_ExameDisciplina_1`
    FOREIGN KEY (`Disciplina`)
    REFERENCES `Departamento`.`Disciplina` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExameDisciplina_2`
    FOREIGN KEY (`Exame`)
    REFERENCES `Departamento`.`Exame` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`CursoDisciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CursoDisciplina` (
  `idCurso` INT NOT NULL,
  `idDisciplina` INT NOT NULL,
  PRIMARY KEY (`idDisciplina`, `idCurso`),
  INDEX `fk_CursoDisciplina_1_idx` (`idDisciplina` ASC),
  INDEX `fk_CursoDisciplina_2_idx` (`idCurso` ASC),
  CONSTRAINT `fk_CursoDisciplina_1`
    FOREIGN KEY (`idDisciplina`)
    REFERENCES `mydb`.`Disciplina` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CursoDisciplina_2`
    FOREIGN KEY (`idCurso`)
    REFERENCES `mydb`.`Curso` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
