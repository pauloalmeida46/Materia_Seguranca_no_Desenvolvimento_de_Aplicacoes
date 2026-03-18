#!/bin/bash

# Arquivo de log:
# Podemos usar o comando "last", que lê o /var/log/wtmp

# Objetivo:
# Mostrar quando o sistema foi iniciado pela última vez

# Explicação:
# - last reboot: mostra histórico de boots
# - head -n 1: pega o mais recente

last reboot | head -n 1