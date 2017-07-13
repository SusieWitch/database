CREATE DATABASE school_journal;

CREATE TABLE men (
men_id SMALLINT NOT NULL AUTO_INCREMENT,
men_login VARCHAR(30) NOT NULL UNIQUE,
men_password VARCHAR(30) NOT NULL,
men_surname VARCHAR(20),
men_firstname VARCHAR(15),
men_patronymic VARCHAR(15),
men_sex ENUM ('М','Ж'),
men_dob date,
PRIMARY KEY (men_id),
KEY (men_login)
);

CREATE TABLE role (
role_men TINYINT UNSIGNED,
men_id SMALLINT NOT NULL,
FOREIGN KEY (men_id) REFERENCES men (men_id)
);

CREATE TABLE schoolboys (
schoolboys_id SMALLINT NOT NULL AUTO_INCREMENT,
class_id SMALLINT NOT NULL,
men_id SMALLINT NOT NULL,
PRIMARY KEY (schoolboys_id),
FOREIGN KEY (men_id) REFERENCES men (men_id)
);

CREATE TABLE teachers (
teachers_id SMALLINT NOT NULL AUTO_INCREMENT,
men_id SMALLINT NOT NULL,
PRIMARY KEY (teachers_id),
FOREIGN KEY (men_id) REFERENCES men (men_id)
);

CREATE TABLE classes (
classes_id SMALLINT NOT NULL AUTO_INCREMENT,
class VARCHAR(3),
PRIMARY KEY (classes_id)
);

CREATE TABLE subjects (
subjects_id SMALLINT NOT NULL AUTO_INCREMENT,
subject VARCHAR(100),
teachers_id SMALLINT NOT NULL,
PRIMARY KEY (subjects_id),
FOREIGN KEY (teachers_id) REFERENCES teachers (teachers_id)
);

CREATE TABLE lessons (
lessons_id SMALLINT NOT NULL AUTO_INCREMENT,
theme VARCHAR(100),
homework VARCHAR(100),
date DATE,
classes_id SMALLINT NOT NULL,
teachers_id SMALLINT NOT NULL,
subjects_id SMALLINT NOT NULL,
PRIMARY KEY (lessons_id),
KEY (date),
FOREIGN KEY (classes_id) REFERENCES classes (classes_id),
FOREIGN KEY (teachers_id) REFERENCES teachers (teachers_id),
FOREIGN KEY (subjects_id) REFERENCES subjects (subjects_id)
);

CREATE TABLE journal (
journal_id SMALLINT NOT NULL AUTO_INCREMENT,
mark TINYINT UNSIGNED,
presence ENUM ('н'),
lessons_id SMALLINT NOT NULL,
schoolboys_id SMALLINT NOT NULL,
PRIMARY KEY (journal_id),
FOREIGN KEY (lessons_id) REFERENCES lessons (lessons_id),
FOREIGN KEY (schoolboys_id) REFERENCES schoolboys (schoolboys_id)
);
