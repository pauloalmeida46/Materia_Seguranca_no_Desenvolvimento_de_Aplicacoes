#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Listar eventos de desligamento e reinicialização

# Explicação:
# - grep -E: permite múltiplos padrões (regex)
# - "shutdown|reboot": busca ambos os eventos
# - awk: mostra data/hora + evento completo

grep -Ei "shutdown|reboot" $LOG | awk '{
    print "Data/Hora:", $1, $2, $3, "| Evento:", $0
}'