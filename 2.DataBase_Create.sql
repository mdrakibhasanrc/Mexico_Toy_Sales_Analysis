-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sales_Database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sales_Database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sales_Database` DEFAULT CHARACTER SET utf8 ;
USE `Sales_Database` ;

-- -----------------------------------------------------
-- Table `Sales_Database`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales_Database`.`Orders` (
  `Sale_ID` INT NOT NULL,
  `Product_ID` INT NOT NULL,
  `Store_ID` INT NOT NULL,
  PRIMARY KEY (`Sale_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales_Database`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales_Database`.`Store` (
  `Store_ID` INT NOT NULL,
  `Store_Name` VARCHAR(45) NOT NULL,
  `Store_Locaton` VARCHAR(45) NOT NULL,
  `Store_CIty` VARCHAR(45) NOT NULL,
  `Store_Open_Date` DATE NOT NULL,
  PRIMARY KEY (`Store_ID`),
  CONSTRAINT `Store_ID(FK)`
    FOREIGN KEY (`Store_ID`)
    REFERENCES `Sales_Database`.`Orders` (`Sale_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales_Database`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales_Database`.`Product` (
  `Product_ID` INT NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Product_Category` VARCHAR(45) NOT NULL,
  `Product_Cost` INT NOT NULL,
  `Product_Price` INT NOT NULL,
  PRIMARY KEY (`Product_ID`),
  CONSTRAINT `Product_ID(FK)`
    FOREIGN KEY (`Product_ID`)
    REFERENCES `Sales_Database`.`Orders` (`Sale_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales_Database`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales_Database`.`Sales` (
  `Sales_ID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Quantity` INT NULL,
  `Amount` INT NOT NULL,
  PRIMARY KEY (`Sales_ID`),
  CONSTRAINT `Sales_ID(Fk)`
    FOREIGN KEY (`Sales_ID`)
    REFERENCES `Sales_Database`.`Orders` (`Sale_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales_Database`.`Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales_Database`.`Inventory` (
  `Store_ID` INT NOT NULL,
  `Product_ID` INT NOT NULL,
  `Stock_On_Hand` INT NOT NULL,
  PRIMARY KEY (`Store_ID`, `Product_ID`),
  CONSTRAINT `Store_ID`
    FOREIGN KEY (`Store_ID`)
    REFERENCES `Sales_Database`.`Orders` (`Sale_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
