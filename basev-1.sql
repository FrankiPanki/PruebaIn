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
-- Table `Sistema_colaborativo`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`usuario` (
  `correo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT 1,
  `numero` INT NOT NULL,
  `pk_id_usuario` INT NOT NULL,
  `calificacion` DOUBLE NOT NULL DEFAULT 5.0,
  `tipoUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`resena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`resena` (
  `comentario` VARCHAR(255) NULL,
  `calificacion` INT NOT NULL,
  `idResena` INT NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` INT NOT NULL,
  PRIMARY KEY (`idResena`),
  CONSTRAINT `r_idusuario`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`pk_id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`alumno` (
  `pk_id_alumno` INT NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` INT NOT NULL,
  PRIMARY KEY (`pk_id_alumno`),
  CONSTRAINT `a_idUsuario`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`pk_id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`profesor` (
  `contratado` TINYINT(1) NOT NULL DEFAULT 1,
  `pk_id_profesor` INT NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` INT NOT NULL,
  PRIMARY KEY (`pk_id_profesor`),
  INDEX `idUsuario_idx` (`fk_id_usuario` ASC) VISIBLE,
  CONSTRAINT `p_idUsuario`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`pk_id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`horario` (
  `dia` VARCHAR(20) NOT NULL,
  `horaInicio` TIME NOT NULL,
  `horaFin` TIME NOT NULL,
  `disponible` TINYINT(1) NOT NULL DEFAULT 1,
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `fk_id_profesor` INT NOT NULL,
  PRIMARY KEY (`idHorario`),
  CONSTRAINT `h_idProfesor`
    FOREIGN KEY (`fk_id_profesor`)
    REFERENCES `Sistema_colaborativo`.`profesor` (`pk_id_profesor`)
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
  CONSTRAINT `m_idNivel`
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
  CONSTRAINT `t_idMateria`
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
  `fk_id_profesor` INT NOT NULL,
  `fk_id_alumno` INT NOT NULL,
  PRIMARY KEY (`idAsesorar`),
  CONSTRAINT `a_idHorario`
    FOREIGN KEY (`idHorario`)
    REFERENCES `Sistema_colaborativo`.`horario` (`idHorario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `a_idTema`
    FOREIGN KEY (`idTema`)
    REFERENCES `Sistema_colaborativo`.`tema` (`idTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `a_idProfesor`
    FOREIGN KEY (`fk_id_profesor`)
    REFERENCES `Sistema_colaborativo`.`profesor` (`pk_id_profesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `a_idAlumno`
    FOREIGN KEY (`fk_id_alumno`)
    REFERENCES `Sistema_colaborativo`.`alumno` (`pk_id_alumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`interesar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`interesar` (
  `idInteresar` INT NOT NULL AUTO_INCREMENT,
  `idNivel` INT NOT NULL,
  `idMateria` INT NOT NULL,
  `idTema` INT NOT NULL,
  `fk_id_usuario` INT NOT NULL,
  PRIMARY KEY (`idInteresar`),
  CONSTRAINT `i_idNivel`
    FOREIGN KEY (`idNivel`)
    REFERENCES `Sistema_colaborativo`.`nivel` (`idNivel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `i_idMateria`
    FOREIGN KEY (`idMateria`)
    REFERENCES `Sistema_colaborativo`.`materia` (`idMateria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `i_idTema`
    FOREIGN KEY (`idTema`)
    REFERENCES `Sistema_colaborativo`.`tema` (`idTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `i_idUsuario`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`pk_id_usuario`)
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
  `fk_id_usuario` INT NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  CONSTRAINT `t_idUsuario`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`pk_id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`denuncia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`denuncia` (
  `motivo` VARCHAR(255) NOT NULL,
  `idDenuncia` INT NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` INT NOT NULL,
  PRIMARY KEY (`idDenuncia`),
  CONSTRAINT `d_idUsuario`
    FOREIGN KEY (`fk_id_usuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`pk_id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
