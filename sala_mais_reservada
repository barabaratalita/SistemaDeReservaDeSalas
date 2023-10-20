/* criando uma tabela  com a quantidade de reservas por sala*/

SELECT id_sala, COUNT(id_reserva) AS contagem_reservas 
FROM reserva
GROUP BY id_sala
/* selecionando a sala o a maior quantidade de reserva*/

SELECT MAX(contagem_reservas) 
FROM (SELECT id_sala, COUNT(id_reserva) AS contagem_reservas
FROM Reserva 
GROUP BY id_sala) 