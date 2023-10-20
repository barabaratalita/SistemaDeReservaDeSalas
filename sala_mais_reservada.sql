/*Qual a sala mais utilizada*/
/* criando uma tabela  com a quantidade de reservas por sala*/

reservas_por_sala as (
    SELECT id_sala, numero, COUNT(id_reserva) AS contagem_reservas 
        FROM reserva
        GROUP BY id_sala, numero)
/* selecionando a sala o a maior quantidade de reserva*/

SELECT *
    FROM reservas_por_sala 
        WHERE contagem_reservas = MAX(contagem_reservas);