#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Mostrar usuário + data/hora de login bem-sucedido

# Explicação:
# - grep "Accepted": filtra logins bem-sucedidos
# - awk '{print $1, $2, $3, $(NF-5)}':
#   $1 $2 $3 = data e hora
#   $(NF-5) = usuário

grep "Accepted" $LOG | awk '{print "Data/Hora:", $1, $2, $3, "| Usuário:", $(NF-5)}'