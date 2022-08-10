/*SEÇÃO 20 -> AUTORELACIONAMENTO*/


CREATE DATABASE CURSOS_SECTION_20;

USE CURSOS_SECTION_20;

CREATE TABLE CURSOS(
    IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    HORAS INT,
    VALOR FLOAT(10,2),
    ID_PREREQ INT
);


ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY (ID_PREREQ) REFERENCES CURSOS(IDCURSO);


SELECT * FROM CURSOS;

INSERT INTO CURSOS VALUES(NULL,'BD RELACIONAL',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'BI',40,800.00,1);
INSERT INTO CURSOS VALUES(NULL,'RELATORIOS AVANCADOS',20,600.00,2);
INSERT INTO CURSOS VALUES(NULL,'LOGICA PROGRAMACAO',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'RUBY',30,500.00,4);


SELECT * FROM CURSOS;

+---------+----------------------+-------+--------+-----------+
| IDCURSO | NOME                 | HORAS | VALOR  | ID_PREREQ |
+---------+----------------------+-------+--------+-----------+
|       1 | BD RELACIONAL        |    20 | 400.00 |      NULL |
|       2 | BI                   |    40 | 800.00 |         1 |
|       3 | RELATORIOS AVANCADOS |    20 | 600.00 |         2 |
|       4 | LOGICA PROGRAMACAO   |    20 | 400.00 |      NULL |
|       5 | RUBY                 |    30 | 500.00 |         4 |
+---------+----------------------+-------+--------+-----------+


SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ, 'SEM REQ') REQUISITO
FROM CURSOS;



/*NOME, VALOR, HORAS, NOME PREREQUISITO DO CURSO*/


SELECT 
C.NOME AS CURSO, 
C.VALOR AS VALOR, 
C.HORAS AS CARGA, 
IFNULL(P.NOME, '---') AS PREREQ
FROM CURSOS C
INNER JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;


+----------------------+--------+-------+--------------------+
| CURSO                | VALOR  | CARGA | PREREQ             |
+----------------------+--------+-------+--------------------+
| BI                   | 800.00 |    40 | BD RELACIONAL      |
| RELATORIOS AVANCADOS | 600.00 |    20 | BI                 |
| RUBY                 | 500.00 |    30 | LOGICA PROGRAMACAO |
+----------------------+--------+-------+--------------------+


SELECT 
C.NOME AS CURSO, 
C.VALOR AS VALOR, 
C.HORAS AS CARGA, 
IFNULL(P.NOME, '---') AS PREREQ
FROM CURSOS C
LEFT JOIN CURSOS P
ON P.IDCURSO = C.ID_PREREQ;

+----------------------+--------+-------+--------------------+
| CURSO                | VALOR  | CARGA | PREREQ             |
+----------------------+--------+-------+--------------------+
| BD RELACIONAL        | 400.00 |    20 | ---                |
| BI                   | 800.00 |    40 | BD RELACIONAL      |
| RELATORIOS AVANCADOS | 600.00 |    20 | BI                 |
| LOGICA PROGRAMACAO   | 400.00 |    20 | ---                |
| RUBY                 | 500.00 |    30 | LOGICA PROGRAMACAO |
+----------------------+--------+-------+--------------------+


/*INNER JOIN -> TRAZ SOMENTE A INTERSECÇÃO;
	- LEFT JOIN -> TRAZ TODOS DO CONJUNTO 'A' E A INTERSECÇÃO COM 'B' TAMBÉM;
	- EXITEM TAMBÉM O RIGHT JOIN, QUE NESSE BANCO NÃO SE APLICA.

*/


