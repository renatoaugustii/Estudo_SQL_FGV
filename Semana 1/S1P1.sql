/* Execute as duas consultas SQL. 
Verifique se a saída da primeira consulta retorna todos os instrutores registrados. 
A saída da segunda consulta retorna os instrutores que estão registrados no departamento de 'Comp. Sci'.
*/

-- Consulta 1
SELECT * FROM instrutor;

-- Consulta 2
SELECT nome FROM  instrutor where nome_dept= 'Comp. Sci.';

-- Para realizar cada consulta separadamente é necessário comentar a outra. Nao é possivel fazer 2 selects na mesma query