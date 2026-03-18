#!/bin/bash

# Arquivo de log:
LOG="/var/log/dpkg.log"

# Objetivo:
# Listar todos os pacotes removidos

# Explicação:
# - grep "remove": filtra remoções
# - awk:
#   $1 = data
#   $4 = nome do pacote

grep " remove " $LOG | awk '{
    print "Data:", $1, "| Pacote removido:", $4
}'