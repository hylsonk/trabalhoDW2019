-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dwsakila
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dwsakila
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dwsakila` DEFAULT CHARACTER SET utf8 ;
USE `dwsakila` ;

-- -----------------------------------------------------
-- Table `dwsakila`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address1` VARCHAR(45) NOT NULL,
  `address2` VARCHAR(45) NULL DEFAULT NULL,
  `district` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 600
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dwsakila`.`date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`date` (
  `date_id` INT(11) NOT NULL AUTO_INCREMENT,
  `day` INT(11) NOT NULL,
  `month` INT(11) NOT NULL,
  `year` INT(11) NOT NULL,
  `weekDay` VARCHAR(45) NOT NULL,
  `quarter` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`date_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 633
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dwsakila`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`film` (
  `film_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `release_year` VARCHAR(45) NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `rating` VARCHAR(45) NOT NULL,
  `dailyPrice` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`film_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dwsakila`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`language` (
  `language_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dwsakila`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`staff` (
  `staff_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fullName` VARCHAR(45) NOT NULL,
  `manager` TINYINT(4) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dwsakila`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`store` (
  `store_id` INT(11) NOT NULL,
  `address1` VARCHAR(45) NOT NULL,
  `address2` VARCHAR(45) NULL DEFAULT NULL,
  `district` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dwsakila`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dwsakila`.`rental` (
  `rental_id` INT(11) NOT NULL AUTO_INCREMENT,
  `language_id` INT(11) NOT NULL,
  `film_id` INT(11) NOT NULL,
  `store_id` INT(11) NOT NULL,
  `staff_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `dateRental` INT(11) NOT NULL,
  `dateDevolution` INT(11) NULL DEFAULT NULL,
  `datePayment` INT(11) NULL DEFAULT NULL,
  `price` VARCHAR(45) NOT NULL,
  `length` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_custome_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rental_staff_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_rental_language_idx` (`language_id` ASC) VISIBLE,
  INDEX `fk_rental_store_idx` (`store_id` ASC) VISIBLE,
  INDEX `fk_rental_payment_idx` (`datePayment` ASC) VISIBLE,
  INDEX `fk_rental_devolution_idx` (`dateDevolution` ASC) VISIBLE,
  INDEX `fk_rental_film_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_rental_date_idx` (`dateRental` ASC) VISIBLE,
  CONSTRAINT `fk_rental_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `dwsakila`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_date1`
    FOREIGN KEY (`dateRental`)
    REFERENCES `dwsakila`.`date` (`date_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_date2`
    FOREIGN KEY (`dateDevolution`)
    REFERENCES `dwsakila`.`date` (`date_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_date3`
    FOREIGN KEY (`datePayment`)
    REFERENCES `dwsakila`.`date` (`date_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `dwsakila`.`film` (`film_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `dwsakila`.`language` (`language_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `dwsakila`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_store1`
    FOREIGN KEY (`store_id`)
    REFERENCES `dwsakila`.`store` (`store_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16050
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
