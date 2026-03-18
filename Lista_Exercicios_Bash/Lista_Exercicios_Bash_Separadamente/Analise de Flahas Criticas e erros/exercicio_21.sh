#!/bin/bash

# Arquivo de log:
LOG="/var/log/syslog"

# Serviço escolhido:
SERVICO="sshd"

# Objetivo:
# Buscar erros e avisos de um serviço

# Explicação:
# - grep "$SERVICO": filtra o serviço
# - grep -Ei "error|warning": filtra problemas

grep "$SERVICO" $LOG | grep -Ei "error|warning"