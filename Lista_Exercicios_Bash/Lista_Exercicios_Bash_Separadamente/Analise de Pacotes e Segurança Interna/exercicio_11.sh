#!/bin/bash

# Arquivo de log:
LOG="/var/log/dpkg.log"

# Objetivo:
# Listar pacotes instalados nos últimos 7 dias com data

# Explicação:
# - grep "install": filtra instalações de pacotes
# - awk '{print $1}': pega a data do log
# - date -d: converte datas para comparar com hoje - 7 dias
# - lógica: filtrar apenas datas recentes

DATA_LIMITE=$(date -d "7 days ago" +"%Y-%m-%d")

grep " install " $LOG | while read linha; do
    DATA=$(echo $linha | awk '{print $1}')
    
    # Compara se a data é maior ou igual ao limite
    if [[ "$DATA" > "$DATA_LIMITE" ]]; then
        PACOTE=$(echo $linha | awk '{print $4}')
        echo "Data: $DATA | Pacote instalado: $PACOTE"
    fi
done