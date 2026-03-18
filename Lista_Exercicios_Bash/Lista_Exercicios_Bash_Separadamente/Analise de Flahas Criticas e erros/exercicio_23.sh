#!/bin/bash

# Arquivo de log:
# Usamos "last", baseado em /var/log/wtmp

# Objetivo:
# Calcular tempo de sessão do usuário

# Usuário alvo (pode alterar)
USUARIO="$1"

# Explicação:
# - last usuario: lista sessões
# - awk:
#   extrai horários de login e logout
#   calcula duração

last $USUARIO | grep -v "still logged in" | while read linha; do
    LOGIN=$(echo $linha | awk '{print $4, $5, $6, $7}')
    LOGOUT=$(echo $linha | awk '{print $8, $9, $10, $11}')

    LOGIN_SEC=$(date -d "$LOGIN" +%s 2>/dev/null)
    LOGOUT_SEC=$(date -d "$LOGOUT" +%s 2>/dev/null)

    if [[ -n "$LOGIN_SEC" && -n "$LOGOUT_SEC" ]]; then
        TEMPO=$((LOGOUT_SEC - LOGIN_SEC))
        echo "Usuário: $USUARIO | Tempo logado: $TEMPO segundos"
    fi
done