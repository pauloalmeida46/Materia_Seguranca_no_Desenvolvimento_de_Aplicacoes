#!/bin/bash

# Arquivo de log:
LOG="/var/log/kern.log"

# Objetivo:
# Filtrar mensagens de erro do kernel

# Explicação:
# - grep -Ei: busca case insensitive
# - "error|fail|warn": regex para erros comuns
# - awk: exibe data/hora + mensagem

grep -Ei "error|fail|warn" $LOG | awk '{
    print "Data/Hora:", $1, $2, $3, "| Mensagem:", $0
}'