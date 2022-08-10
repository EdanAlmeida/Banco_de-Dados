SELECT COUNT(*) FROM FUNCIONARIOS;

--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

-- 21 | Filmes   53 | Roupas

--Como estamos trabalhando com OR e a segunda condicao é opcional
--colocamos na primeira condicao quem tem mais chances de uma saida
--verdadeira, pois a segunda condicao nao será checada nesse caso.

select * from funcionarios
where departamento = 'Roupas'
or
departamento = 'Filmes';

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
group by departamento;

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
group by departamento
order by 1;

WHERE DEPARTAMENTO = 'Filmes' OR DEPARTAMENTO = 'Roupas'

--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *

--Feminino 491 ocorrencias
select count(*), sexo
from funcionarios
group by sexo;

--52 | Lar  21 Filmes
select count(*), departamento
from funcionarios
group by departamento;

SELECT * FROM FUNCIONARIOS
WHERE
( DEPARTAMENTO = 'Lar' AND SEXO = 'Feminino' )
OR
( DEPARTAMENTO = 'Filmes' AND SEXO = 'Feminino' );

--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim

SELECT * FROM FUNCIONARIOS
WHERE
SEXO = 'Masculino' OR
DEPARTAMENTO = 'Jardim';

create database exercicio;

use exercicio;

create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );
  
  
  
SELECT COUNT(*) AS "Numero de funcionarios" FROM FUNCIONARIOS;

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
GROUP BY departamento
ORDER BY 1;  

/*21 FUNCIONARIOS NO DEP. DE FILMES
  53  FUNCIONARIOS NO DEP. DE ROUPAS */

/* PRIMEIRO O QUE TEM MAIS CHANCES DE DE SER VERDADEIRO (ROUPAS = 53 FUNCIONARIOS)*/
SELECT idFuncionario, nome FROM FUNCIONARIOS
WHERE departamento = 'ROUPAS' OR departamento = 'FILMES';


/*Feminino = 491*/
select count(*), sexo from funcionarios
group by sexo;


/*Filmes = 21 e lar = 52*/
select count(*), departamento
from funcionarios
group by departamento;

select idFuncionario, nome from funcionarios
where (departamento = 'lar' and sexo = 'feminino') or (departamento = 'filmes' and sexo = 'feminino');  


select * from funcionarios
where sexo = 'Masculino' or departamento = 'Jardim';

