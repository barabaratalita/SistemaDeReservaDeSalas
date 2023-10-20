/*Buscar por reservas de sala em determinada data*/

select r.id_sala, r.horario_inicio, r.horario_fim, s.numero 
    from reserva r, sala s 
        where 
            s.id_sala = ' 93029'
            and r.id_sala = s.id_sala 
            and substr(r.horario_inicio, 0, 10) = "2023-10-20" /*considere que uma data e hora seja no formato: yyyy-mm-dd HH:MM:ss*/
