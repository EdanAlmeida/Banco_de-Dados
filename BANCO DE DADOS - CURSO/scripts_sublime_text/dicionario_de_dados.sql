/*O DICIONÁRIO DE DADOS

	-ALTERANDO TABELAS;
*/

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR (30)
);

/*ADICIONANDO PK*/
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);


/*ADICIONANDO COLUNA SEM POSIÇÃO*/
ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);


/*ADICIONANDO COLUNA COM POSIÇÃO*/
ALTER TABLE TABELA
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE AFTER COLUNA3;


/*MODIFICANDO O TIPO DE UM CAMPO*/
ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;


/*RENOMEANDO A TABELA*/
ALTER TABLE TABELA
RENAME PESSOA;



CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR (30)
);


--FOREIGN KEY
ALTER TABLE TIME
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);



/*VERIFICAR AS CHAVES:*/
SHOW CREATE TABLE TIME;


---------------------------------------------------------------------


/*ORGANIZANDO AS CHAVES E INTRODUÇÃO ÀS BASES DE DICIONÁRIOS

	- CHAVES -> CONSTRAINT (REGRA);
	- INTEGRIDADE REFERENCIAL (PRIMARY KEY);

*/

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);


INSERT INTO JOGADOR VALUES(NULL, 'ROMARIO');
INSERT INTO TIMES VALUES(NULL, 'VASCO', 1);

SHOW CREATE TABLE JOGADOR;


/*CRIAR AS CONSTRAINTS POR DENTRO DA TABELA É UMA PRÁTICA RUIM, O IDEAL É CRIAR POR FORA.
	- ISSO É MUITO IMPORTANTE POR CONTA DOS DICIONÁRIOS DE DADOS;
*/




---------------------------------------------------------------------

/*CONSTRAINTS NOMEADAS VS DICIONÁRIO DE DADOS:
	- CRIA-SE PRIMEIRO AS TABELAS,
	- DEPOIS, POR FORA, CRIA-SE AS REGRAS (CONSTRAINTS);

*/

SHOW TABLES;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);


ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;




/*DICIONÁRIO DE DADOS
	- METADATA -> DADOS DOS DADOS;

*/

SHOW DATABASES;
USE INFORMATION_SCHEMA;
SHOW TABLES;
DESC TABLE_CONSTRAINTS;

+--------------------+--------------+------+-----+---------+-------+
| Field              | Type         | Null | Key | Default | Extra |
+--------------------+--------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(512) | NO   |     |         |       |
| CONSTRAINT_SCHEMA  | varchar(64)  | NO   |     |         |       |
| CONSTRAINT_NAME    | varchar(64)  | NO   |     |         |       |
| TABLE_SCHEMA       | varchar(64)  | NO   |     |         |       |
| TABLE_NAME         | varchar(64)  | NO   |     |         |       |
| CONSTRAINT_TYPE    | varchar(64)  | NO   |     |         |       |
+--------------------+--------------+------+-----+---------+-------+

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS;


SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS 'NOME DA REGRA',
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

+----------+----------+-----------------+-------------+
| BANCO    | TABELA   | NOME DA REGRA   | TIPO        |
+----------+----------+-----------------+-------------+
| comercio | cliente  | PRIMARY         | PRIMARY KEY |
| comercio | cliente  | EMAIL           | UNIQUE      |
| comercio | cliente  | CPF             | UNIQUE      |
| comercio | endereco | PRIMARY         | PRIMARY KEY |
| comercio | endereco | ID_CLIENTE      | UNIQUE      |
| comercio | endereco | endereco_ibfk_1 | FOREIGN KEY |
| comercio | telefone | PRIMARY         | PRIMARY KEY |
| comercio | telefone | telefone_ibfk_1 | FOREIGN KEY |
+----------+----------+-----------------+-------------+



SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS 'NOME DA REGRA',
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = 'PROJETO';

+---------+----------+---------------------+-------------+
| BANCO   | TABELA   | NOME DA REGRA       | TIPO        |
+---------+----------+---------------------+-------------+
| projeto | cliente  | PRIMARY             | PRIMARY KEY |
| projeto | jogador  | PRIMARY             | PRIMARY KEY |
| projeto | telefone | FK_CLIENTE_TELEFONE | FOREIGN KEY |
| projeto | times    | PRIMARY             | PRIMARY KEY |
| projeto | times    | times_ibfk_1        | FOREIGN KEY |
+---------+----------+---------------------+-------------+


/*APAGANDO CONSTRAINT:*/

USE 'NOME_BANCO';

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;
