#!/bin/bash

# Arquivo de log:
LOG="/var/log/syslog"

# Objetivo:
# Identificar qual serviço mais aparece no log

# Explicação:
# - awk '{print $5}': geralmente contém o nome do serviço (ex: sshd:)
# - sort + uniq -c: conta ocorrências
# - sort -nr: ordena do maior para o menor

awk '{print $5}' $LOG | sort | uniq -c | sort -nr