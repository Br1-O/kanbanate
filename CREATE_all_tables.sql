USE sql10728873;

CREATE TABLE IF NOT EXISTS `Status_area` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Status_group` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Status_employee` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Status_task` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Relation_types` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Actions` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Employees` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `DNI` VARCHAR(10) NOT NULL UNIQUE,
  `email` VARCHAR(50) NOT NULL UNIQUE,
  `phone` VARCHAR(20),
  `address` VARCHAR(50),
  `city` VARCHAR(50),
  `country` VARCHAR(50),
  `gender` VARCHAR(10),
  `status` INT NOT NULL DEFAULT 1,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`status`) REFERENCES `Status_employee`(`id`),
  INDEX (`DNI`),
  INDEX (`email`)
);

CREATE TABLE IF NOT EXISTS `Users` (
  `id` INT auto_increment PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `password` CHAR(80),
  `employee` INT NOT NULL UNIQUE,
  `profile_picture` VARCHAR(100),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `last_online` DATETIME,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`employee`) REFERENCES `Employees`(`id`),
  INDEX (`username`)
);

CREATE TABLE IF NOT EXISTS `Task` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(250),
  `status` INT NOT NULL DEFAULT 1,
  `deadline` DATE,
  `date_start` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `date_last_update` DATETIME,
  `date_end` DATETIME,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`status`) REFERENCES `Status_task`(`id`),
  INDEX (`name`)
);

CREATE TABLE IF NOT EXISTS `rel_Users_Tasks` (
  `id` INT auto_increment PRIMARY KEY,
  `user` INT NOT NULL,
  `task` INT NOT NULL,
  `relation_type` INT NOT NULL,
  FOREIGN KEY (`relation_type`) REFERENCES `Relation_types`(`id`),
  FOREIGN KEY (`user`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`task`) REFERENCES `Task`(`id`)
);

CREATE TABLE IF NOT EXISTS `Areas` (
  `id` INT auto_increment PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL UNIQUE,
  `description` VARCHAR(100),
  `status` INT NOT NULL DEFAULT 1,
  FOREIGN KEY (`status`) REFERENCES `Status_area`(`id`),
  INDEX (`name`)
);

CREATE TABLE IF NOT EXISTS `Groups` (
  `id` INT auto_increment PRIMARY KEY,
  `area` INT,
  `status` INT NOT NULL DEFAULT 1,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`area`) REFERENCES `Areas`(`id`),
  FOREIGN KEY (`status`) REFERENCES `Status_group`(`id`)
);

CREATE TABLE IF NOT EXISTS `Messages` (
  `id` INT auto_increment PRIMARY KEY,
  `subject` VARCHAR(20),
  `content` TEXT NOT NULL,
  `id_sender` INT NOT NULL,
  `id_recipient` INT NOT NULL,
  `date_sent` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`id_sender`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`id_recipient`) REFERENCES `Users`(`id`),
  INDEX (`date_sent`)
);

CREATE TABLE IF NOT EXISTS `rel_Groups_Employees` (
  `id` INT auto_increment PRIMARY KEY,
  `group` INT NOT NULL,
  `employee` INT NOT NULL,
  FOREIGN KEY (`employee`) REFERENCES `Employees`(`id`),
  FOREIGN KEY (`group`) REFERENCES `Groups`(`id`)
);

CREATE TABLE IF NOT EXISTS `rel_Areas_Tasks` (
  `id` INT auto_increment PRIMARY KEY,
  `area` INT NOT NULL,
  `task` INT NOT NULL,
  `is_current` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`area`) REFERENCES `Areas`(`id`),
  FOREIGN KEY (`task`) REFERENCES `Task`(`id`)
);

CREATE TABLE IF NOT EXISTS `rel_Users_Actions` (
  `id` INT auto_increment PRIMARY KEY,
  `user` INT NOT NULL,
  `action` INT NOT NULL,
  `objective_type` ENUM('user', 'task', 'message', 'group', 'area'),
  `objective_id` INT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  FOREIGN KEY (`action`) REFERENCES `Actions`(`id`),
  FOREIGN KEY (`user`) REFERENCES `Users`(`id`)
);

CREATE TABLE IF NOT EXISTS `rel_Groups_Tasks` (
  `id` INT auto_increment PRIMARY KEY,
  `group` INT NOT NULL,
  `task` INT NOT NULL,
  FOREIGN KEY (`task`) REFERENCES `Task`(`id`),
  FOREIGN KEY (`group`) REFERENCES `Groups`(`id`)
);