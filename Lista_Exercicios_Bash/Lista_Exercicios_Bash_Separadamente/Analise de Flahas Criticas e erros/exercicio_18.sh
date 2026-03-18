#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Extrair usuário e método (ssh, su, etc.)

# Explicação:
# - grep "Failed": falhas de login
# - awk:
#   $(NF-5) = usuário
#   $5 = serviço (ex: sshd)

grep "Failed" $LOG | awk '{
    usuario=$(NF-5)
    metodo=$5
    print "Usuário:", usuario, "| Método:", metodo
}'