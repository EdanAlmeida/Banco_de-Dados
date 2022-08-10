/*CURSORES*/


CREATE DATABASE CURSORES;

USE CURSORES;

CREATE TABLE VENDEDORES(
	 IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	 NOME VARCHAR(50),
	 JAN INT,
	 FEV INT,
	 MAR INT
);


INSERT INTO VENDEDORES VALUES(NULL,'MAFRA',6000.00,7000.00,4500);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA',3000.00,2500.00,7500);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO',8000.00,6500.00,1500);
INSERT INTO VENDEDORES VALUES(NULL,'LILIAN',5000.00,7000.00,4500);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO',2000.00,5000.00,6500);
INSERT INTO VENDEDORES VALUES(NULL,'GLORIA',4000.00,6000.00,5500);

+------------+---------+------+------+------+
| IDVENDEDOR | NOME    | JAN  | FEV  | MAR  |
+------------+---------+------+------+------+
|          1 | MAFRA   | 6000 | 7000 | 4500 |
|          2 | CLARA   | 3000 | 2500 | 7500 |
|          3 | JOAO    | 8000 | 6500 | 1500 |
|          4 | LILIAN  | 5000 | 7000 | 4500 |
|          5 | ANTONIO | 2000 | 5000 | 6500 |
|          6 | GLORIA  | 4000 | 6000 | 5500 |
+------------+---------+------+------+------+



SELECT NOME, (JAN+FEV+MAR) AS TOTAL FROM VENDEDORES;
+---------+-------+
| NOME    | TOTAL |
+---------+-------+
| MAFRA   | 17500 |
| CLARA   | 13000 |
| JOAO    | 16000 |
| LILIAN  | 16500 |
| ANTONIO | 13500 |
| GLORIA  | 15500 |
+---------+-------+

SELECT NOME, (JAN+FEV+MAR) AS TOTAL, (JAN+FEV+MAR)/3 AS MEDIA FROM VENDEDORES;
+---------+-------+-----------+
| NOME    | TOTAL | MEDIA     |
+---------+-------+-----------+
| MAFRA   | 17500 | 5833.3333 |
| CLARA   | 13000 | 4333.3333 |
| JOAO    | 16000 | 5333.3333 |
| LILIAN  | 16500 | 5500.0000 |
| ANTONIO | 13500 | 4500.0000 |
| GLORIA  | 15500 | 5166.6667 |
+---------+-------+-----------+




/*ESSES COMANDOS SÃO FEITOS EM TEMPO DE EXECUÇÃO,
  O QUE DEMANDA TEMPO E PROCESSAMENTO.
  UMA SOLUÇÃO É FAZER DIFERENTE
*/
CREATE TABLE VEND_TOTAL(
    NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);

+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| NOME  | varchar(50) | YES  |     | NULL    |       |
| JAN   | int(11)     | YES  |     | NULL    |       |
| FEV   | int(11)     | YES  |     | NULL    |       |
| MAR   | int(11)     | YES  |     | NULL    |       |
| TOTAL | int(11)     | YES  |     | NULL    |       |
| MEDIA | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+




DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);

	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;

	OPEN REG;

	REPEAT

		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN 

			SET VTOTAL = VAR1 + VAR2 + VAR3;

			SET VMEDIA = VTOTAL / 3;

			INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
		END IF;

	UNTIL FIM END REPEAT;

	CLOSE REG;

END
$

DELIMITER ;

SELECT * FROM VENDEDORES;
SELECT * FROM VEND_TOTAL;

CALL INSEREDADOS();

+---------+------+------+------+-------+-------+
| NOME    | JAN  | FEV  | MAR  | TOTAL | MEDIA |
+---------+------+------+------+-------+-------+
| MAFRA   | 6000 | 7000 | 4500 | 17500 |  5833 |
| CLARA   | 3000 | 2500 | 7500 | 13000 |  4333 |
| JOAO    | 8000 | 6500 | 1500 | 16000 |  5333 |
| LILIAN  | 5000 | 7000 | 4500 | 16500 |  5500 |
| ANTONIO | 2000 | 5000 | 6500 | 13500 |  4500 |
| GLORIA  | 4000 | 6000 | 5500 | 15500 |  5167 |
+---------+------+------+------+-------+-------+

