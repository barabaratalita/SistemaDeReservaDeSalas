/*Registros anteriores de limpeza da sala fornecido o id da sala*/

use sistema_reserva_salas_db;

SELECT id_sala, data_hora AS data_limpeza 
        FROM limpeza_manutencao
        WHERE id_sala = '1'
