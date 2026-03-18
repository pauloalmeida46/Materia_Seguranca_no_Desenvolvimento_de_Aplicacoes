#!/bin/bash

# Arquivo de log:
LOG="/var/log/syslog"

# Objetivo:
# Encontrar mensagens críticas no sistema

# Explicação:
# - grep -Ei: busca sem diferenciar maiúsculas/minúsculas
# - regex com múltiplas palavras-chave

grep -Ei "critical|fatal|segfault" $LOG | awk '{
    print "Data/Hora:", $1, $2, $3, "| Evento:", $0
}'