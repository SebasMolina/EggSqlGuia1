CREATE DATABASE IF NOT EXISTS example;
USE example;

CREATE TABLE person (
	person_id INT AUTO_INCREMENT,
    person_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (person_id)
);

CREATE TABLE pet (
	pet_id INT AUTO_INCREMENT,
    pet_name VARCHAR(100) NOT NULL,
	person_id INT NULL,
    PRIMARY KEY (pet_id),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO person (person_name) VALUES ("Rosario"),
("Florencia"),
("Bruno"),
("Fernando"),
("Gonzalo");

INSERT INTO pet (pet_name, person_id) VALUES ("Rocky", 1),
("Sasha", 1),
("Luna", 1),
("Lola", 2),
("Kiara", 3),
("Gala", 3),
("Toby", NULL),
("Max", NULL);

SELECT person.person_name, pet.pet_name FROM person
INNER JOIN pet ON person.person_id = pet.person_id;

SELECT person.person_name, pet.pet_name FROM person
LEFT JOIN pet ON person.person_id = pet.person_id;

SELECT person.person_name, pet.pet_name FROM person
RIGHT JOIN pet ON person.person_id = pet.person_id;

SELECT person.person_name, COUNT(pet.pet_id) AS cantidad FROM person
INNER JOIN pet ON person.person_id = pet.person_id
GROUP BY person.person_name;

SELECT person.person_name, COUNT(pet.pet_id) AS cantidad FROM person
LEFT JOIN pet ON person.person_id = pet.person_id
GROUP BY person.person_name;

SELECT person.person_name, COUNT(pet.pet_id) AS cantidad FROM person
RIGHT JOIN pet ON person.person_id = pet.person_id
GROUP BY person.person_name;

TRUNCATE TABLE pet;