use sistema_reserva_salas_db;

/* Criando uma tabela com a quantidade de reservas por sala */
WITH reservas_por_sala AS (
    SELECT id_sala, COUNT(id_reserva) AS contagem_reservas 
    FROM reserva
    GROUP BY id_sala
)

/* Encontrando o valor máximo de contagem de reservas */
, max_contagem AS (
    SELECT MAX(contagem_reservas) AS max_reservas
    FROM reservas_por_sala
)

/* Selecionando a(s) sala(s) com a maior quantidade de reservas */
SELECT id_sala, contagem_reservas
FROM reservas_por_sala
WHERE contagem_reservas = (SELECT max_reservas FROM max_contagem);