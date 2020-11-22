SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema diemenacademy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `diemenacademy` ;

-- -----------------------------------------------------
-- Schema diemenacademy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diemenacademy` DEFAULT CHARACTER SET utf8 ;
USE `diemenacademy` ;

-- -----------------------------------------------------
-- Table `diemenacademy`.`Study`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diemenacademy`.`Study` (
  `id_study` INT NOT NULL,
  `study_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `language` VARCHAR(45) NOT NULL,
  `number_of_years` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_study`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diemenacademy`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diemenacademy`.`Teacher` (
  `id_teacher` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  `nationality` VARCHAR(45) NULL,
  `street_name` VARCHAR(45) NULL,
  `street_number` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `gender` ENUM('M', 'F', 'O') NULL,
  `salary` VARCHAR(45) NULL,
  `study_counselor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_teacher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diemenacademy`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diemenacademy`.`Student` (
  `id_student` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `nationality` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F', 'O') NOT NULL,
  `street_name` VARCHAR(45) NOT NULL,
  `street_number` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `study_id_study` INT NOT NULL,
  `start_year` VARCHAR(45) NOT NULL,
  `teacher_id_teacher` INT NOT NULL,
  PRIMARY KEY (`id_student`),
  INDEX `fk_Student_Teacher1_idx` (`teacher_id_teacher` ASC),
  INDEX `fk_Student_Study1_idx` (`study_id_study` ASC),
  CONSTRAINT `fk_Student_Teacher1`
    FOREIGN KEY (`teacher_id_teacher`)
    REFERENCES `diemenacademy`.`Teacher` (`id_teacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Study1`
    FOREIGN KEY (`study_id_study`)
    REFERENCES `diemenacademy`.`Study` (`id_study`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diemenacademy`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diemenacademy`.`Course` (
  `id_course` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `credits` VARCHAR(45) NULL,
  `teacher_id_teacher` INT NOT NULL,
  `study_id_study` INT NOT NULL,
  PRIMARY KEY (`id_course`),
  INDEX `fk_Course_Teacher1_idx` (`teacher_id_teacher` ASC),
  INDEX `fk_Course_Study1_idx` (`study_id_study` ASC),
  CONSTRAINT `fk_Course_Teacher1`
    FOREIGN KEY (`teacher_id_teacher`)
    REFERENCES `diemenacademy`.`Teacher` (`id_teacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Study1`
    FOREIGN KEY (`study_id_study`)
    REFERENCES `diemenacademy`.`Study` (`id_study`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diemenacademy`.`Exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diemenacademy`.`Exam` (
  `id_exam` INT NOT NULL AUTO_INCREMENT,
  `room` VARCHAR(45) NULL,
  `resit` VARCHAR(45) NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `course_id_course` INT NOT NULL,
  PRIMARY KEY (`id_exam`),
  INDEX `fk_Exam_Course1_idx` (`course_id_course` ASC),
  CONSTRAINT `fk_Exam_Course1`
    FOREIGN KEY (`course_id_course`)
    REFERENCES `diemenacademy`.`Course` (`id_course`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diemenacademy`.`Result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diemenacademy`.`Result` (
  `id_result` INT NOT NULL AUTO_INCREMENT,
  `grade` INT NULL,
  `exam_id_exam` INT NOT NULL,
  `date` DATE NULL,
  `student_id_student` INT NOT NULL,
  `passed` VARCHAR(45) NULL,
  PRIMARY KEY (`id_result`),
  INDEX `fk_Result_Exam1_idx` (`exam_id_exam` ASC),
  INDEX `fk_Result_Student1_idx` (`student_id_student` ASC),
  CONSTRAINT `fk_Result_Exam1`
    FOREIGN KEY (`exam_id_exam`)
    REFERENCES `diemenacademy`.`Exam` (`id_exam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Result_Student1`
    FOREIGN KEY (`student_id_student`)
    REFERENCES `diemenacademy`.`Student` (`id_student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `diemenacademy`.`Study`
-- -----------------------------------------------------
START TRANSACTION;
USE `diemenacademy`;
INSERT INTO `diemenacademy`.`Study` (`id_study`, `study_name`, `description`, `language`, `number_of_years`) VALUES (1, 'Business ICT', 'for management studies', 'dutch     ', '3');
INSERT INTO `diemenacademy`.`Study` (`id_study`, `study_name`, `description`, `language`, `number_of_years`) VALUES (2, 'BIM parttime', 'part time students of BIM', 'dutch     ', '4');
INSERT INTO `diemenacademy`.`Study` (`id_study`, `study_name`, `description`, `language`, `number_of_years`) VALUES (3, 'Mathematical Engineering', NULL, 'english   ', '4');
INSERT INTO `diemenacademy`.`Study` (`id_study`, `study_name`, `description`, `language`, `number_of_years`) VALUES (4, 'Plane design', 'for aeronautical engineers', 'english   ', '4');
INSERT INTO `diemenacademy`.`Study` (`id_study`, `study_name`, `description`, `language`, `number_of_years`) VALUES (5, 'Precision Engineering', 'study of very small things', 'dutch', '4');
INSERT INTO `diemenacademy`.`Study` (`id_study`, `study_name`, `description`, `language`, `number_of_years`) VALUES (6, 'Architecture', 'designing buildings', 'dutch', '4');

COMMIT;


-- -----------------------------------------------------
-- Data for table `diemenacademy`.`Teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `diemenacademy`;
INSERT INTO `diemenacademy`.`Teacher` (`id_teacher`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `gender`, `salary`, `study_counselor`) VALUES (1, 'Max       ', 'Planck    ', '1905-12-12', 'German    ', 'Stationsweg', '55', '45897', 'Amsterdam ', '76543', 'M         ', '34667', 'Y');
INSERT INTO `diemenacademy`.`Teacher` (`id_teacher`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `gender`, `salary`, `study_counselor`) VALUES (2, 'Emmy      ', 'Noether   ', '1945-04-04', 'German    ', 'trhtgr', '63', '2196', 'Utrecht   ', '87654', 'F         ', '56323', 'N');
INSERT INTO `diemenacademy`.`Teacher` (`id_teacher`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `gender`, `salary`, `study_counselor`) VALUES (3, 'Arthur    ', 'Eddington ', '1933-12-23', 'English   ', 'uydkrjgn', '6', '967', 'Edam      ', '9876', 'M         ', '4566', 'N');
INSERT INTO `diemenacademy`.`Teacher` (`id_teacher`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `gender`, `salary`, `study_counselor`) VALUES (4, 'Bert      ', 'de Wit    ', '1955-01-09', 'Dutch     ', 'tryujhgf', '33', '87432', 'Rotterdam ', '4567', 'M         ', '6711', 'Y');
INSERT INTO `diemenacademy`.`Teacher` (`id_teacher`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `gender`, `salary`, `study_counselor`) VALUES (5, 'Louis     ', 'de Broglie', '1908-12-12', 'French    ', 'gokore', '44', '5434', 'Haarlem   ', '845', 'M         ', '4567', 'Y');
INSERT INTO `diemenacademy`.`Teacher` (`id_teacher`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `gender`, `salary`, `study_counselor`) VALUES (6, 'Piet', 'Mondriaan', '1907-01-31', 'nederlands', 'yuko', '1', '1234', 'Goes', '8765', 'M         ', '8412', 'Y');

COMMIT;


-- -----------------------------------------------------
-- Data for table `diemenacademy`.`Student`
-- -----------------------------------------------------
START TRANSACTION;
USE `diemenacademy`;
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (1, 'Johann    ', 'Bach      ', '1934-01-23', 'Dutch     ', 'M         ', 'dfgjij    ', '89', '76543', 'Zwolle    ', '566575', 'jhjkhj@inholland.nl', 1, '2017', 5);
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (2, 'Pjotr     ', 'Tjaikovsky', '1922-10-10', 'Russian   ', 'M         ', 'oigf      ', '45', '97', 'Groningen ', '4545', '          ', 3, '2017', 1);
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (3, 'Hetty     ', 'Udang     ', '1999-09-09', 'Indonesian', 'F         ', 'drgr      ', '33', '567', 'Almere    ', '765', 'fgdg@gmail.com', 3, '2018', 5);
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (4, 'Frank     ', 'Brandse   ', '1999-01-01', 'Dutch     ', 'M         ', 'uyjghfg   ', '88', '45678', 'Amsterdam ', '98765', '', 5, '2016', 1);
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (5, 'Margje    ', 'Penning   ', '2001-02-02', 'Dutch     ', 'F         ', 'dfhffy    ', '3', '8765', 'Diemen    ', '567', '', 2, '2016', 4);
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (6, 'Kate      ', 'Bush      ', '1967-03-31', 'English   ', 'F         ', 'kolk      ', '34', '732', 'Sittard   ', '88', '', 4, '2017', 1);
INSERT INTO `diemenacademy`.`Student` (`id_student`, `first_name`, `last_name`, `date_of_birth`, `nationality`, `gender`, `street_name`, `street_number`, `postal_code`, `city`, `phone`, `email`, `study_id_study`, `start_year`, `teacher_id_teacher`) VALUES (7, 'Willibrord', 'Snel', '1980-02-22', 'Nederlands', 'M         ', 'ven', '66', '345', 'Diemen', '99009', 'ttt@hotmail.com', 5, '2016', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diemenacademy`.`Course`
-- -----------------------------------------------------
START TRANSACTION;
USE `diemenacademy`;
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (1, 'Precalculus', 'introduction to math', '3', 1, 3);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (2, 'Datamodelleren', 'introduction to datamodelling', '2', 2, 1);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (3, 'Optics', 'lenses and prisma', '3', 4, 5);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (4, 'Differential equations', 'for smart student', '4', 3, 3);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (5, 'Mechanics', 'newtons law of motions', '3', 1, 4);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (6, 'Control systems', 'how to control things', '2', 4, 5);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (7, 'ICT', 'intro to ict', '2', 3, 2);
INSERT INTO `diemenacademy`.`Course` (`id_course`, `course_name`, `description`, `credits`, `teacher_id_teacher`, `study_id_study`) VALUES (8, 'Drawing', 'Drawing with software', '2', 6, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diemenacademy`.`Exam`
-- -----------------------------------------------------
START TRANSACTION;
USE `diemenacademy`;
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (1, 'A34', 'N         ', '2017-12-17', '10:00', 3);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (2, 'A45', 'N         ', '2017-08-02', '14:00', 4);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (3, 'B12', 'Y         ', '2018-03-03', '13:00', 3);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (4, 'B13', 'N         ', '2017-04-01', '9:00', 5);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (5, 'B88', 'N         ', '2016-06-06', '16:00', 6);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (6, 'A21', 'Y         ', '2018-09-20', '19:00', 5);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (7, 'A8', 'N         ', '2018-05-12', '14:00', 1);
INSERT INTO `diemenacademy`.`Exam` (`id_exam`, `room`, `resit`, `date`, `time`, `course_id_course`) VALUES (8, 'A34', 'N         ', '2016-12-13', '14:00', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diemenacademy`.`Result`
-- -----------------------------------------------------
START TRANSACTION;
USE `diemenacademy`;
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (1, 7, 1, '2018-05-12', 4, 'Y         ');
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (2, 4, 6, '2016-06-06', 3, 'N         ');
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (3, 6, 5, '2017-04-01', 1, 'Y         ');
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (4, 8, 4, '2017-08-02', 6, 'Y         ');
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (5, 3, 3, '2017-12-17', 2, 'N         ');
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (6, 9, 3, '2018-03-03', 2, 'Y         ');
INSERT INTO `diemenacademy`.`Result` (`id_result`, `grade`, `exam_id_exam`, `date`, `student_id_student`, `passed`) VALUES (7, 4, 1, '2018-05-12', 7, 'N         ');

COMMIT;

