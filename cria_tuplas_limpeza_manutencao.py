import random
from datetime import datetime
# cria um arquivo sql com as queries para alimentar o banco de dados
with open("tuplas_limpeza_manutencao.sql", "w") as arquivo:
    
    for i in range(0,100,1):
        # gera valores de cpf compativeis com o arquivo insere_tuplas.sql
        cpf = random.randint(21,30)
        data = datetime.now()
        tipo='manutencao'
        sala_id = random.randint(1,10)
        if (random.randint(1,100000000) %2) == 0:
            tipo='limpeza'
        # Escreve linhas no arquivo
        arquivo.write(f"insert into limpeza_manutencao (cpf_funcionario, id_sala, data_hora_inicio, data_hora_fim, tipo) values (\'0000000{cpf}\',\'{sala_id}\',\'{data}\',\'{data}\',\'{tipo}\');\n")