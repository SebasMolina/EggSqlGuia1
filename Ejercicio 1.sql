DROP DATABASE IF EXISTS superheroes;
CREATE DATABASE superheroes CHARACTER SET utf8mb4;
USE superheroes;

CREATE TABLE creador (
id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);


CREATE TABLE personajes (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
  );
 /*
Una vez insertados todos los registros realizar una selección de todos los atributos para corroborar que 
la tablas se encuentren completas. 
 */
-- TABLA CREADOR
INSERT INTO creador(nombre) VALUES ('Marvel');
INSERT INTO creador(nombre) VALUES ('DC Comics');
SELECT * FROM creador;
TRUNCATE creador;
-- TABLA PERSONAJES
INSERT INTO personajes VALUES (NULL,'Bruce Banner', 'Hulk',160,'600 mil',75,98,1962,'Fisico Nuclear',1);
INSERT INTO personajes VALUES (NULL,'Tony Stark', 'Iron Man',170,'200 mil',70,123,1963,'Inventor Industrial',1);
INSERT INTO personajes VALUES (NULL,'Thor Odinson', 'Thor',145,'infinita',100,235,1962,'Rey de Asgard',1);
INSERT INTO personajes VALUES (NULL,'Wanda Maximoff', 'Bruja Escarlata',170,'100 mil',90,345,1964,'Bruja',1);
INSERT INTO personajes VALUES (NULL,'Carol Danvers', 'Capitana Marvel',157,'250 mil',85,128,1968,'Oficial de Inteligencia',1);
INSERT INTO personajes VALUES (NULL,'Thanos', 'Thanos',170,'Infinita',40,306,1973,'Adorador de la Muerte',1);
INSERT INTO personajes VALUES (NULL,'Peter Parker', 'Spiderman',165,'25 mil',80,74,1962,'Fotografo',1);
INSERT INTO personajes VALUES (NULL,'Steve Rogers', 'Capitan America',145,'600',45,60,1961,'Oficial Federal',1);
INSERT INTO personajes VALUES (NULL,'Bobby Drake', 'Ice Man',140,'2 mil',64,122,1963,'Contador',1);
INSERT INTO personajes VALUES (NULL,'Barry Allen', 'Flash',160,'10 mil',120,168,1956,'Cientifico Forense',2);
INSERT INTO personajes VALUES (NULL,'Bruce Wayne', 'Batman',170,'500',32,47,1939,'Hombre de Negocios',2);
INSERT INTO personajes VALUES (NULL,'Clark Kent', 'Superman',165,'Infinita',120,182,1948,'Reportero',2);
INSERT INTO personajes VALUES (NULL,'Diana Prince', 'Mujer Maravilla',160,'Infinita',95,127,1949,'Princesa Guerrera',2);
SELECT * FROM personajes;
TRUNCATE personajes;
-- b)   Cambiar en la tabla personajes el año de aparición a 1938 del personaje Superman. A continuación, 
-- realizar un listado de toda la tabla para verificar que el personaje haya sido actualizado. 
SET sql_safe_updates = 0;
UPDATE personajes SET aparicion = 1938 WHERE personaje= 'Superman';
SET sql_safe_updates = 1;
SELECT * FROM personajes;
-- c)    El registro que contiene al personaje Flash. A continuación, mostrar toda la tabla para verificar que  el registro haya sido eliminado. 
SET sql_safe_updates = 0; # false
DELETE FROM personajes WHERE personaje = 'flash';
SET sql_safe_updates = 1; # true
SELECT * FROM personajes;
-- d)   Eliminar la base de datos superhéroes. 
DROP TABLE personajes;


