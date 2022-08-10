/*Criar um banco de dados:
	- Sr. José tem uma oficina:
		- carros que entram e seus respectivos donos.
		- cada cliente possui apenas um carro.
		- Cada carro possui uma marca, cor (pode ter mais de uma).
		- Telefone dos clientes, mas não é obrigatório.

*/


CREATE DATABASE OFICINA;
USE OFICINA;

CREATE TABLE CLIENTES(
	IDCLIENTE INT,
	NOME VARCHAR(30),
	CPF VARCHAR(12)
);


CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3),
	NUMERO VARCHAR(10),
	ID_CLIENTE INT
);


CREATE TABLE CARRO(
	IDCARRO INT,
	MARCA VARCHAR(25),
	MODELO VARCHAR(25),
	COR VARCHAR(20),
	ID_CLIENTE INT
);


ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(IDCLIENTE);

ALTER TABLE CARRO ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(IDCLIENTE);



INSERT INTO CLIENTES VALUES()



/*REFATORAÇÃO SISTEMA SEU JOSE:*/

/*NA RELAÇÃO ENTRE CARRO E COR (N X N)
	- PRECISA APLICAR A RELAÇÃO DE TABELA ASSOCIATIVA;
*/


CREATE DATABASE OFICINA;
USE OFICINA;

CREATE TABLE CLIENTES(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL,
	CPF VARCHAR(12),
	EMAIL VARCHAR(30),
	ID_CARRO INT UNIQUE
);


CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO CHAR(3),
	NUMERO VARCHAR(12) NOT NULL,
	ID_CLIENTE INT
);


CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30) UNIQUE
);


CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(30) NOT NULL,
	PLACA VARCHAR(30) NOT NULL,
	ID_MARCA INT
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(30) UNIQUE
);


CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO, ID_COR)
);



/*SEMPRE CUIDAR COM OS ERROS DE VALIDAÇÃO EM TODAS AS CAMADAS*/


/*CONSTRAINTS*/
ALTER TABLE TELEFONE
ADD CONSTRAINT FK_TELEFONE_CLIENTES
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTES(IDCLIENTE);


ALTER TABLE CLIENTES
ADD CONSTRAINT FK_CLIENTES_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);


ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA)
REFERENCES MARCA(IDMARCA);


ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);


ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

/*UMA CHAVE PRIMÁRIA PODE SER ESTRANGEIRA AO MESMO TEMPO E VICE-VERSA;*/
