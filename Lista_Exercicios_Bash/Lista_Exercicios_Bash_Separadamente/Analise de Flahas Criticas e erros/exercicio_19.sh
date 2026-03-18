#!/bin/bash

# Arquivo de log:
LOG="/var/log/auth.log"

# Objetivo:
# Monitorar falhas de login em tempo real

# Explicação:
# - tail -f: acompanha o log em tempo real
# - grep --line-buffered: mostra imediatamente quando encontra

tail -f $LOG | grep --line-buffered "Failed password"