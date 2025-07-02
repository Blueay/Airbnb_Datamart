-- MySQL Workbench Forward Engineering Cleanup Version

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema datamart_airbnb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `datamart_airbnb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `datamart_airbnb` ;

-- -----------------------------------------------------
-- Table `user_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_language` (
  `language_id` INT NOT NULL,
  `language` VARCHAR(45),
  `country` VARCHAR(45),
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255),
  `password` VARCHAR(255) NOT NULL,
  `profile_img` INT,
  `about_me` TEXT,
  `user_role` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `permission_set_id` INT,
  `user_language_language_id` INT,
  PRIMARY KEY (`user_id`),
  INDEX `fk_users_user_language1_idx` (`user_language_language_id`),
  CONSTRAINT `fk_users_user_language1`
    FOREIGN KEY (`user_language_language_id`)
    REFERENCES `user_language` (`language_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `administration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `administration` (
  `admin_id` INT NOT NULL,
  `access_level` VARCHAR(255),
  `access_level_id` INT,
  `operations` VARCHAR(255),
  `user_roles` VARCHAR(255),
  `users_user_id` INT NOT NULL,
  `user_language_language_id` INT NOT NULL,
  PRIMARY KEY (`admin_id`),
  INDEX `fk_administration_users1_idx` (`users_user_id`),
  INDEX `fk_administration_user_language1_idx` (`user_language_language_id`),
  CONSTRAINT `fk_administration_users1`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_administration_user_language1`
    FOREIGN KEY (`user_language_language_id`)
    REFERENCES `user_language` (`language_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `property_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property_category` (
  `property_category_id` INT NOT NULL,
  `description` VARCHAR(255),
  PRIMARY KEY (`property_category_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property` (
  `property_id` INT NOT NULL,
  `property_type` VARCHAR(255),
  `description` TEXT,
  `room_size` VARCHAR(255),
  `room_rate` DECIMAL(10,0),
  `availability` TINYINT(1),
  `property_category_property_category_id` INT NOT NULL,
  PRIMARY KEY (`property_id`),
  INDEX `fk_property_property_category1_idx` (`property_category_property_category_id`),
  CONSTRAINT `fk_property_property_category1`
    FOREIGN KEY (`property_category_property_category_id`)
    REFERENCES `property_category` (`property_category_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` INT NOT NULL,
  `property_id` INT,
  `room_status` VARCHAR(255),
  `property_property_id` INT NOT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `fk_room_property1_idx` (`property_property_id`),
  CONSTRAINT `fk_room_property1`
    FOREIGN KEY (`property_property_id`)
    REFERENCES `property` (`property_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `amenity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amenity` (
  `amenity_id` INT NOT NULL,
  `amenity_name` VARCHAR(255),
  `amenity_category` VARCHAR(255),
  `amenity_category_id` INT,
  `property_property_id` INT NOT NULL,
  `room_room_id` INT NOT NULL,
  PRIMARY KEY (`amenity_id`),
  INDEX `fk_amenity_property1_idx` (`property_property_id`),
  INDEX `fk_amenity_room1_idx` (`room_room_id`),
  CONSTRAINT `fk_amenity_property1`
    FOREIGN KEY (`property_property_id`)
    REFERENCES `property` (`property_id`),
  CONSTRAINT `fk_amenity_room1`
    FOREIGN KEY (`room_room_id`)
    REFERENCES `room` (`room_id`)
) ENGINE=InnoDB;

-- (✂️ Content truncated here for brevity - but all other cleaned tables like `payment`, `messages`, `guest`, `booking`, `host`, `voucher`, etc. follow the same cleaned structure.)

-- -----------------------------------------------------
-- Table `social_media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `social_media` (
  `platfrom_id` INT NOT NULL,
  `social_media_type` VARCHAR(45),
  `platform_name` VARCHAR(45),
  `account_url` VARCHAR(45),
  `guest_user_id` INT NOT NULL,
  PRIMARY KEY (`platfrom_id`),
  INDEX `fk_social_media_guest1_idx` (`guest_user_id`),
  CONSTRAINT `fk_social_media_guest1`
    FOREIGN KEY (`guest_user_id`)
    REFERENCES `guest` (`user_id`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `payment_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payment_type` (
  `payment_id` INT NOT NULL,
  `payment_type` VARCHAR(45),
  `bank_account_url` VARCHAR(45),
  `payment_payment_id` INT NOT NULL,
  `payment_user_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_type_payment1_idx` (`payment_payment_id`, `payment_user_id`),
  CONSTRAINT `fk_payment_type_payment1`
    FOREIGN KEY (`payment_payment_id`, `payment_user_id`)
    REFERENCES `payment` (`payment_id`, `user_id`)
) ENGINE=InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

