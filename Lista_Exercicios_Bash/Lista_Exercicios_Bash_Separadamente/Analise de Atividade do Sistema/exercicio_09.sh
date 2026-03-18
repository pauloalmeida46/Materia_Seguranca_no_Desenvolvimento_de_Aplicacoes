#!/bin/bash

# Arquivo de log:
LOG="/var/log/syslog"

# Objetivo:
# Identificar serviços que mudaram de estado

# Explicação:
# - grep -E "Started|Stopped": captura início/parada
# - awk:
#   $1 $2 $3 = data/hora
#   $0 = linha completa (inclui nome do serviço)

grep -E "Started|Stopped" $LOG | awk '{
    print "Data/Hora:", $1, $2, $3, "| Evento:", $0
}'