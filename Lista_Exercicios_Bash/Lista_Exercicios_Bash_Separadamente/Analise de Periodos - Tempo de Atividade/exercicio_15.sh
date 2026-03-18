#!/bin/bash

# Arquivo de log (pode ser qualquer um, vamos usar syslog como exemplo)
LOG="/var/log/syslog"

# Objetivo:
# Mostrar eventos entre 14:00 e 15:00 de um dia específico

# Você pode alterar a data aqui (formato: Mês Dia)
DIA="Mar 18"

# Explicação:
# - grep "$DIA": filtra o dia específico
# - awk:
#   extrai a hora (campo $3 no formato HH:MM:SS)
#   compara se está entre 14:00:00 e 14:59:59

grep "$DIA" $LOG | awk '{
    split($3, tempo, ":")
    hora=tempo[1]

    if(hora >= 14 && hora < 15){
        print $0
    }
}'