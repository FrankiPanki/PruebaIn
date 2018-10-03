-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sistema_colaborativo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sistema_colaborativo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sistema_colaborativo` DEFAULT CHARACTER SET utf8 ;
USE `Sistema_colaborativo` ;

-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`usuraio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`usuraio` (
  `correo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fecha_nacimiendo` DATE NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT 1,
  `numero` INT NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `calificacion` INT NOT NULL,
  PRIMARY KEY (`contrasena`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`reseña`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`reseña` (
  `comentario` MEDIUMTEXT NULL,
  `calificacion` INT NOT NULL DEFAULT 5,
  `idResena` INT NOT NULL,
  `idUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idResena`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuraio` (`contrasena`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`denunciar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`denunciar` (
  `motivo` MEDIUMTEXT NOT NULL,
  `idDenuncia` INT NOT NULL AUTO_INCREMENT,
  `idUsuraio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDenuncia`),
  INDEX `idUsuario_idx` (`idUsuraio` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuraio`)
    REFERENCES `Sistema_colaborativo`.`usuraio` (`contrasena`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`alumno` (
  `idAlumno` INT NOT NULL AUTO_INCREMENT,
  `idUsuraio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  INDEX `idUsuario_idx` (`idUsuraio` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuraio`)
    REFERENCES `Sistema_colaborativo`.`usuraio` (`contrasena`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`profesor` (
  `contratado` TINYINT(1) NOT NULL DEFAULT 0,
  `idProfesor` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfesor`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuraio` (`contrasena`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`horario` (
  `dia` VARCHAR(20) NOT NULL,
  `hora_inicio` DATE NOT NULL,
  `hora_fin` DATE NOT NULL,
  `disponible` TINYINT NOT NULL DEFAULT 1,
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `idProfesor` INT NOT NULL,
  PRIMARY KEY (`idHorario`),
  INDEX `idProfesor_idx` (`idProfesor` ASC) VISIBLE,
  CONSTRAINT `idProfesor`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `Sistema_colaborativo`.`profesor` (`idProfesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`nivel` (
  `nivel` VARCHAR(45) NOT NULL,
  `idNivel` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idNivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`materia` (
  `materia` VARCHAR(45) NOT NULL,
  `idMateria` INT NOT NULL AUTO_INCREMENT,
  `idNivel` INT NOT NULL,
  PRIMARY KEY (`idMateria`),
  INDEX `idNivel_idx` (`idNivel` ASC) VISIBLE,
  CONSTRAINT `idNivel`
    FOREIGN KEY (`idNivel`)
    REFERENCES `Sistema_colaborativo`.`nivel` (`idNivel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`tema` (
  `tema` VARCHAR(45) NOT NULL,
  `idTema` INT NOT NULL AUTO_INCREMENT,
  `idMateria` INT NOT NULL,
  PRIMARY KEY (`idTema`),
  INDEX `idMateria_idx` (`idMateria` ASC) VISIBLE,
  CONSTRAINT `idMateria`
    FOREIGN KEY (`idMateria`)
    REFERENCES `Sistema_colaborativo`.`materia` (`idMateria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`asesorar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`asesorar` (
  `idAsesorar` INT NOT NULL AUTO_INCREMENT,
  `idHorario` INT NOT NULL,
  `idTema` INT NOT NULL,
  `idProfesor` INT NOT NULL,
  `idAlumno` INT NOT NULL,
  PRIMARY KEY (`idAsesorar`),
  INDEX `idHorario_idx` (`idHorario` ASC) VISIBLE,
  INDEX `idTema_idx` (`idTema` ASC) VISIBLE,
  INDEX `idProfesro_idx` (`idProfesor` ASC) VISIBLE,
  INDEX `idAlumno_idx` (`idAlumno` ASC) VISIBLE,
  CONSTRAINT `idHorario`
    FOREIGN KEY (`idHorario`)
    REFERENCES `Sistema_colaborativo`.`horario` (`idHorario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idTema`
    FOREIGN KEY (`idTema`)
    REFERENCES `Sistema_colaborativo`.`tema` (`idTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idProfesor`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `Sistema_colaborativo`.`profesor` (`idProfesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idAlumno`
    FOREIGN KEY (`idAlumno`)
    REFERENCES `Sistema_colaborativo`.`alumno` (`idAlumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`interesar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`interesar` (
  `idinteresar` INT NOT NULL AUTO_INCREMENT,
  `idNivel` INT NOT NULL,
  `idMateria` INT NOT NULL,
  `idTema` INT NOT NULL,
  `idUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idinteresar`),
  INDEX `idNivel_idx` (`idNivel` ASC) VISIBLE,
  INDEX `idMateria_idx` (`idMateria` ASC) VISIBLE,
  INDEX `idTema_idx` (`idTema` ASC) VISIBLE,
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idNivel`
    FOREIGN KEY (`idNivel`)
    REFERENCES `Sistema_colaborativo`.`nivel` (`idNivel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idMateria`
    FOREIGN KEY (`idMateria`)
    REFERENCES `Sistema_colaborativo`.`materia` (`idMateria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idTema`
    FOREIGN KEY (`idTema`)
    REFERENCES `Sistema_colaborativo`.`tema` (`idTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuraio` (`contrasena`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`tarjeta` (
  `ccv` INT NOT NULL,
  `numero` INT NOT NULL,
  `vencimiento` DATE NOT NULL,
  `idTarjeta` INT NOT NULL,
  `idUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuraio` (`contrasena`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
