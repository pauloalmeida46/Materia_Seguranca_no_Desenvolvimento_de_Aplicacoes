#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Identificar falhas que NÃO são senha incorreta

# Explicação:
# - grep "Failed": pega falhas gerais
# - grep -v "Failed password": remove erros de senha
# - awk:
#   mostra data/hora + mensagem completa para análise

grep "Failed" $LOG | grep -v "Failed password" | awk '{
    print "Data/Hora:", $1, $2, $3, "| Evento:", $0
}'