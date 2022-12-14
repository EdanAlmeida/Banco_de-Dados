/*SGBD -> SISTEMA DE GERENCIAMENTO DE BANCO DE DADOS */


/* Modelagem básica - 
ENTIDADE = TABELA 
CAMPOS = ATRIBUTO  */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDEREÇO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM */
/* FASE 1 E 2 = AD ADMINISTRADOR DE DADOS */
MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 = DBA / AD */
MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS  */

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO DE DADOS */
USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
	
);

/* VERIFICANDO AS TABELAS DO BANCO */
SHOW TABLES;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */
DESC CLIENTE;


/* Sintaxe básica de inserção - INSERT INTO TABELA ...*/
/* FORMA 01 - OMITINDO COLUNAS (ESSA FORMA DEVE SEGUIR A ORDEM DOS DADOS PARA INSERÇÃO)*/
/* Números que não serão usados em operações devem ser colocados como VARCHAR/CHAR */


INSERT INTO CLIENTE VALUES ('EDAN ALMEIDA', 'M', 'EDAN@HOTMAIL.COM', 075376559, '984327441', 'RUA INACIO KARPINSKI - 129 - GUARAPUAVA - PR');
INSERT INTO CLIENTE VALUES ('MARLICE DA COSTA', 'F', 'MARLICE@GMAIL.COM', 091678729, '984093324', 'RUA VICENTE MACHADO - 2978 - GUARAPUAVA - PR');
INSERT INTO CLIENTE VALUES ('MARIA JULIANE DE ALMEIDA', 'F', NULL, 091234567, '984234545', 'RUA PEDRO VIDAL DA CRUZ - 236 - GUARAPUAVA - PR');


/* FORMA 02 - COLOCANDO COLUNAS */    /*Jeito correto para evitar trocar dados de lugar */

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES('LILIAN', 'F', 'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '947785696', 887774856);


/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */
INSERT INTO CLIENTE VALUES('ANA', 'F', 'ANA@GLOBO.COM', 85548962, '548556895', 'PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
							('CARLA', 'F', 'CARLA@GLOBO.COM', 7745828, '66587458', 'SAMUEL SILVA - CENTRO - GUARAPUAVA - PR');



/* QUESTÃO DO CPF */
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES('PAULO', 'M', 'SALDANHA MARINHO - CENTRO - GUARAPUAVA - PR', '94234556', 99999999999);


/* SELECT 
seleção, projeção e junção   (select == projeção)   (where == seleção)
	show tables; é um select from dicionário de dados
*/

SELECT NOW();
SELECT NOW() as DATA_HORA;
SELECT NOW() as DATA_HORA, 'EDAN ALMEIDA' AS PROFESSOR;

SELECT 'FELIPE MAFRA';
SELECT 'BANCO DE DADOS';
 

/*  ALIAS DE COLUNAS
	é possível alterar a ordem dos dados para usar o select
  */
SELECT NOME, SEXO, EMAIL FROM CLIENTE;
SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;
SELECT NOME AS CLIENTES, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT NOME AS CLIENTES, SEXO, EMAIL, ENDERECO, NOW() AS DATA_HORA FROM CLIENTE;
SELECT NOME AS CLIENTES, SEXO, EMAIL FROM CLIENTE;


/* APENAS PARA FINS ACADÊMICOS 
	Entregar somente o requisitado para evitar gargalos de processamento, tempo e de rede;
	Tuning = consulta pelo índice, divide os dados e diminui o tempo de pesquisa <> (full scan) == gasta tempo e processamento;
*/
SELECT * FROM CLIENTE;


/* filtrando dados com where e like 
	- o filtro funciona em nível de linha e não de coluna;
	- where == seleção
	- O banco de dados == teoria dos conjuntos
	
		- Ou seja, o select é a projeção do conjunto, o where a seleção dos elementos no conjunto e a junção é a união ou intersecção de conjuntos;
*/

SELECT NOME, TELEFONE FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, TELEFONE FROM CLIENTE
WHERE SEXO = 'F';


/* LIKE *
	caracter coringa == % -> qualquer coisa
	usar like '%___centro%';
	tecnologia AJAX (ver)
*/
SELECT NOME, TELEFONE FROM CLIENTE
WHERE ENDERECO LIKE '%GUARAPUAVA%';

