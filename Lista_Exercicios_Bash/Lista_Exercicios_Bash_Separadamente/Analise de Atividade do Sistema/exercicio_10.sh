#!/bin/bash

# Arquivo de log:
LOG="/var/log/syslog"

# Objetivo:
# Encontrar erros relacionados a hardware

# Explicação:
# - grep -Ei: busca sem diferenciar maiúsculas/minúsculas
# - "disk|usb|device|hardware": palavras-chave comuns
# - também combinamos com "error|fail|warn"
# - awk: mostra data/hora + mensagem

grep -Ei "disk|usb|device|hardware" $LOG | grep -Ei "error|fail|warn" | awk '{
    print "Data/Hora:", $1, $2, $3, "| Problema:", $0
}'