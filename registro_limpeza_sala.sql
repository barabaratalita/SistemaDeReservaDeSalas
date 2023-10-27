/*Registros anteriores de limpeza da sala fornecido o id da sala*/

use sistema_reserva_salas_db;

SELECT id_sala, data_hora_inicio, data_hora_fim 
        FROM limpeza_manutencao
        WHERE id_sala = '2'
