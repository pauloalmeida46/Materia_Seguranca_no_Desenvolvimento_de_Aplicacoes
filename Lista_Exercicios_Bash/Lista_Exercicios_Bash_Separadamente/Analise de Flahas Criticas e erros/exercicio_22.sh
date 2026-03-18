#!/bin/bash

# Arquivo de log:
LOG="/var/log/syslog"

# Objetivo:
# Identificar falhas graves de processos

# Explicação:
# - grep -Ei: busca "segfault" ou "killed"

grep -Ei "segfault|killed" $LOG | awk '{
    print "Data/Hora:", $1, $2, $3, "| Evento:", $0
}'