/*REVISÃO DA CRIAÇÃO DE TABELAS*/

/*PROJETO COMÉRCIO: */



CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+


CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(50) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(50) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+


CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO CHAR(12) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);


+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | char(12)                | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+



/*INSERINDO DADOS*/
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+


INSERT INTO CLIENTE VALUES(NULL, 'EDAN ALMEIDA', 'M', 'EDAN@GMAIL.COM', '07655434389');
INSERT INTO CLIENTE VALUES(NULL, 'GEOVANA MAYER', 'F', 'GEOVANA@GMAIL.COM', '07655434385');
INSERT INTO CLIENTE VALUES(NULL, 'LUCAS SOUZA', 'M', 'LUCAS@GMAIL.COM', '07655424376');
INSERT INTO CLIENTE VALUES(NULL, 'KAIO SILVA', 'M', 'KAIO@GMAIL.COM', '07655434569');
INSERT INTO CLIENTE VALUES(NULL, 'ALINE SANTOS', 'F', 'ALINE@GMAIL.COM', '07655434302');



+-----------+---------------+------+-------------------+-------------+
| IDCLIENTE | NOME          | SEXO | EMAIL             | CPF         |
+-----------+---------------+------+-------------------+-------------+
|         1 | EDAN ALMEIDA  | M    | EDAN@GMAIL.COM    | 07655434389 |
|         2 | GEOVANA MAYER | F    | GEOVANA@GMAIL.COM | 07655434385 |
|         3 | LUCAS SOUZA   | M    | LUCAS@GMAIL.COM   | 07655424376 |
|         4 | KAIO SILVA    | M    | KAIO@GMAIL.COM    | 07655434569 |
|         5 | ALINE SANTOS  | F    | ALINE@GMAIL.COM   | 07655434302 |
+-----------+---------------+------+-------------------+-------------+

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(50) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

INSERT INTO ENDERECO VALUES(NULL, 'SALDANHA MARINHO', 'CENTRO', 'GUARAPUAVA', 'PR', 1);
INSERT INTO ENDERECO VALUES(NULL, 'XV DE NOVEMBRO', 'CENTRO', 'GUARAPUAVA', 'PR', 2);
INSERT INTO ENDERECO VALUES(NULL, 'INACIO KARPINSKI', 'CONRADINHO', 'GUARAPUAVA', 'PR', 3);
INSERT INTO ENDERECO VALUES(NULL, 'GUAIRA', 'BATEL', 'GUARAPUAVA', 'PR', 4);
INSERT INTO ENDERECO VALUES(NULL, 'PEDRO VIDAL DA CRUZ', 'BOQUEIRAO', 'GUARAPUAVA', 'PR', 5);



+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | char(12)                | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

INSERT INTO TELEFONE VALUES(NULL, 'RES', '42 36245567', 1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '42 988233434', 1);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '42 36245566', 2);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '42 986575543', 5);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '42 36245432', 5);



/*PONTEIRAMENTO */

SELECT C.NOME AS CLIENTE, C.EMAIL, T.NUMERO AS TELEFONE, E.CIDADE
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT C.NOME AS CLIENTE, C.EMAIL, T.NUMERO AS TELEFONE, E.CIDADE
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
WHERE SEXO = 'F';


