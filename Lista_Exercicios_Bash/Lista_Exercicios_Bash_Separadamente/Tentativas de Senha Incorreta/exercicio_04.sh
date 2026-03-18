#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Mostrar quem usou sudo e quando

# Explicação:
# - grep "sudo": filtra uso do sudo
# - awk:
#   $1 $2 $3 = data/hora
#   $(NF-3) geralmente contém o usuário que executou

grep "sudo" $LOG | awk '{print "Data/Hora:", $1, $2, $3, "| Usuário:", $(NF-3)}'