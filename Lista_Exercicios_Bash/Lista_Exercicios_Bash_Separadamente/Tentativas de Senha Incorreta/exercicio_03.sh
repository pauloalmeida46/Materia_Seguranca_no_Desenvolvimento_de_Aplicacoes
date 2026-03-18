#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Mostrar quem usou su e para qual usuário mudou

# Explicação:
# - grep "su:": filtra eventos do comando su
# - grep "session opened": pega apenas trocas bem-sucedidas
# - awk:
#   procura padrões "by USER" e "(to USER)"

grep "su:" $LOG | grep "session opened" | awk '{
    for(i=1;i<=NF;i++){
        if($i=="by"){
            origem=$(i+1)
        }
        if($i=="for"){
            destino=$(i+1)
        }
    }
    print "Usuário origem:", origem, "-> Usuário destino:", destino
}'