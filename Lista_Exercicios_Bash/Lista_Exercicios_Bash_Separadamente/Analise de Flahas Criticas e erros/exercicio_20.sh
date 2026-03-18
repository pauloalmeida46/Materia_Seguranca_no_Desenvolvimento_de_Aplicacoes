#!/bin/bash

# Arquivo de log:
LOG="/var/log/dpkg.log"

# Objetivo:
# Listar pacotes atualizados

# Explicação:
# - grep "upgrade": identifica atualização
# - awk:
#   $1 = data
#   $4 = nome do pacote

grep " upgrade " $LOG | awk '{
    print "Data:", $1, "| Pacote atualizado:", $4
}'