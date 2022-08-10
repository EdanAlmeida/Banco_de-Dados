/*SEÇÃO 11 - APROFUNDANDO*/

/*FUNÇÕES
-> IFNULL (ORACLE, MYSQL, SQL, POSTGREE, ETC.)
	- FUNÇÃO COM PARÂMETRO.

	- FUNÇÃO:
		- BLOCO DE CÓDIGO DE PROGRAMAÇÃO PARA ALGUMA COISA;
		-SELECT NOW(); -> NOME DE UMA FUNÇÃO QUE JÁ ESTÁ BUILT-IN; 

*/


/* NOME, EMAIL, ESTADO */

SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------------+-------------------+--------+--------------+
| NOME          | EMAIL             | ESTADO | NUMERO       |
+---------------+-------------------+--------+--------------+
| EDAN ALMEIDA  | EDAN@GMAIL.COM    | PR     | 42 36245567  |
| EDAN ALMEIDA  | EDAN@GMAIL.COM    | PR     | 42 988233434 |
| GEOVANA MAYER | GEOVANA@GMAIL.COM | PR     | 42 36245566  |
| ALINE SANTOS  | ALINE@GMAIL.COM   | PR     | 42 986575543 |
| ALINE SANTOS  | ALINE@GMAIL.COM   | PR     | 42 36245432  |
+---------------+-------------------+--------+--------------+

SELECT C.NOME,
       IF NULL(C.EMAIL, 'EMAIL NÃO CADASTRADO'),
	   E.ESTADO,
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;



-------------------------------------------------------------------------------------------------

SELECT C.NOME,
       IF NULL(C.EMAIL, 'EMAIL NÃO CADASTRADO'), /*FICA APARECENDO A FUNÇÃO NO CABEÇALHO*/
	   E.ESTADO,
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


SELECT C.NOME,
       IF NULL(C.EMAIL, 'EMAIL NÃO CADASTRADO') AS 'EMAIL', 
	   E.ESTADO,
	   T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;





/*VIEWS*/
SELECT C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;


CREATE VIEW RELATORIO AS
SELECT C.NOME,
	   C.SEXO,
	   C.EMAIL,
	   T.TIPO,
	   T.NUMERO,
	   E.BAIRRO,
	   E.CIDADE,
	   E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

/*COMANDO COM VIEW:
	- PERDE UM POUCO DE PERFORMANCE;
	- EFEITO COLATERAL NECESSÁRIO;

*/
DROP VIEW RELATORIO;

CREATE VIEW V_RELATORIO AS
SELECT C.NOME,
	   C.SEXO,
	   C.EMAIL,
	   T.TIPO,
	   T.NUMERO,
	   E.BAIRRO,
	   E.CIDADE,
	   E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE;


SELECT NOME, ESTADO
FROM V_RELATORIO;


/*NÃO É POSSÍVEL FAZER INSERT NEM DELETE EM VIEWS QUE POSSUEM 'JOIN'
	- UPDATE É POSSÍVEL
*/



/*ORDENANDO DADOS: 'ORDER BY'*/

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1, 'EDAN ALMEIDA');
INSERT INTO ALUNOS VALUES(2, 'MARIA ALMEIDA');
INSERT INTO ALUNOS VALUES(3, 'ANA SILVA');
INSERT INTO ALUNOS VALUES(4, 'JOAO SOUZA');
INSERT INTO ALUNOS VALUES(5, 'MARCIO SANTOS');

SELECT * FROM ALUNOS
ORDER BY NUMERO;
+--------+---------------+
| NUMERO | NOME          |
+--------+---------------+
|      1 | EDAN ALMEIDA  |
|      2 | MARIA ALMEIDA |
|      3 | ANA SILVA     |
|      4 | JOAO SOUZA    |
|      5 | MARCIO SANTOS |
+--------+---------------+

SELECT * FROM ALUNOS
ORDER BY 1; /*COLUNA 1*/


SELECT * FROM ALUNOS
ORDER BY 2; /*COLUNA 2*/
+--------+---------------+
| NUMERO | NOME          |
+--------+---------------+
|      3 | ANA SILVA     |
|      1 | EDAN ALMEIDA  |
|      4 | JOAO SOUZA    |
|      5 | MARCIO SANTOS |
|      2 | MARIA ALMEIDA |
+--------+---------------+


INSERT INTO ALUNOS VALUES(1, 'VILMA SCHMITZ');
INSERT INTO ALUNOS VALUES(1, 'LICE DA COSTA');
INSERT INTO ALUNOS VALUES(2, 'JANAINA STUTZ');


/*ORDENANDO POR MAIS DE UMA COLUNA*/
SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 1 ASC;


SELECT * FROM ALUNOS
ORDER BY 1 DESC;



/*SEÇÃO 12*/
/*OUTRAS NOTAÇÕES:
	-PETER CHEN -> 1 == 1 AND 0 == 0 AND N == MANY;

	- CROSS -> __,_______ == 1 AND _>________ == MANY;


*/

