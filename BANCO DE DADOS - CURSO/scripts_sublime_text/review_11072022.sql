/*REVISÃO DIA 11/07/2022*/

DROP DATABASE CURSOS_SECTION_20;


CREATE DATABASE CURSOS;

USE CURSOS;

CREATE TABLE CURSOS(
	IDCURSOS INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	PRECO FLOAT(10,2),
	ID_PREREQ INT
);


ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY (ID_PREREQ) REFERENCES CURSOS(IDCURSOS);



/*PROCEDURES*/
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDCURSOS  | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | YES  |     | NULL    |                |
| HORAS     | int(11)     | YES  |     | NULL    |                |
| PRECO     | float(10,2) | YES  |     | NULL    |                |
| ID_PREREQ | int(11)     | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+



DELIMITER $

STATUS

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
						   P_HORAS INT,
						   P_PRECO FLOAT(10,2),
						   P_ID_PREREQ INT)
BEGIN

	INSERT INTO CURSOS VALUES(NULL, P_NOME, P_HORAS, P_PRECO, P_ID_PREREQ);

END
$


DELIMITER ;



/*TRIGGERS - BACKUP*/

CREATE DATABASE BACKUP_CURSOS;

USE BACKUP_CURSOS;

CREATE TABLE BKP_CURSO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDCURSOS INT,
	NOME VARCHAR(30),
	HORAS INT,
	PRECO FLOAT(10,2),
	ID_PREREQ INT,
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
); 


USE CURSOS;

/*TABLE CURSOS*/
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDCURSOS  | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | YES  |     | NULL    |                |
| HORAS     | int(11)     | YES  |     | NULL    |                |
| PRECO     | float(10,2) | YES  |     | NULL    |                |
| ID_PREREQ | int(11)     | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


/*TABLE BKP_CURSO*/
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDBACKUP  | int(11)     | NO   | PRI | NULL    | auto_increment |
| IDCURSOS  | int(11)     | YES  |     | NULL    |                |
| NOME      | varchar(30) | YES  |     | NULL    |                |
| HORAS     | int(11)     | YES  |     | NULL    |                |
| PRECO     | float(10,2) | YES  |     | NULL    |                |
| ID_PREREQ | int(11)     | YES  |     | NULL    |                |
| DATA      | datetime    | YES  |     | NULL    |                |
| USUARIO   | varchar(30) | YES  |     | NULL    |                |
| EVENTO    | char(1)     | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


USE CURSOS;

DELIMITER $

CREATE TRIGGER BKP_CURSO
AFTER INSERT ON CURSOS
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP_CURSOS.BKP_CURSO VALUES(NULL,NEW.IDCURSOS,NEW.NOME,NEW.HORAS,NEW.PRECO,NEW.ID_PREREQ,
											   NOW(),CURRENT_USER(),'C');

END
$


DELETE FROM CURSOS
WHERE NOME = 'BD RELACIONAL'$



CALL CAD_CURSO('BD RELACIONAL',20,400.00,NULL);
CALL CAD_CURSO('BI',40,800.00,2);
CALL CAD_CURSO('RELATORIOS AVANCADOS',20,600.00,2);
CALL CAD_CURSO('LOGICA PROGRAMACAO',20,400.00,NULL);
CALL CAD_CURSO('RUBY',30,500.00,4);



SELECT * FROM BACKUP_CURSOS.BKP_CURSO;


