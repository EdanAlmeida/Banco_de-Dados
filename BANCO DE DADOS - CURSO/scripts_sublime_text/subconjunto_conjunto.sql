/*SUBCONJUNTO DO CONJUNTO*/

/*
VENDEDOR QUE VENDEU MENOS EM MARCO E O SEU NOME

NOME E VALOR DE QUEM VENDEU MAIS EM MARCO

QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEVEREIRO

*/
 


SELECT NOME, MAR FROM VENDEDORES
WHERE MAR = (SELECT MIN(MAR) FROM VENDEDORES); //INNER QUERY == RESOLVIDA PRIMEIRO [TRAZ UM RESULTADO QUE SEVE DE PARAMETRO PARA A OUTRA QUERY]


SELECT NOME, MAR FROM VENDEDORES
WHERE MAR = (SELECT MAX(MAR) FROM VENDEDORES); 

SELECT NOME, FEV FROM VENDEDORES
WHERE FEV > (SELECT AVG(FEV) FROM VENDEDORES); 

