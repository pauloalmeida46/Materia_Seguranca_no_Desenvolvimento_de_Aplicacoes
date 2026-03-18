#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Mostrar quem executou comandos de gerenciamento de pacotes e qual ação

# Explicação:
# - grep -E: busca múltiplos comandos (apt, apt-get, dpkg)
# - normalmente esses comandos aparecem via sudo
# - awk:
#   $1 $2 $3 = data/hora
#   busca "COMMAND=" para identificar ação executada
#   $(NF-3) geralmente contém o usuário

grep -E "apt|apt-get|dpkg" $LOG | grep "COMMAND=" | awk '{
    usuario=$(NF-3)
    
    # Extrai o comando executado após "COMMAND="
    for(i=1;i<=NF;i++){
        if($i ~ /COMMAND=/){
            comando=substr($i,9)
        }
    }

    print "Data/Hora:", $1, $2, $3, "| Usuário:", usuario, "| Ação:", comando
}'