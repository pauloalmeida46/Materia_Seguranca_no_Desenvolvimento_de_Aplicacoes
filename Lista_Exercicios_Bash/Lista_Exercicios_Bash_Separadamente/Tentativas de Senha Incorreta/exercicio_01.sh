#!/bin/bash

# Arquivo de log mais apropriado:
# /var/log/auth.log (Debian/Ubuntu) ou /var/log/secure (CentOS/RHEL)
LOG="/var/log/auth.log"

# Objetivo:
# Identificar tentativas de login com senha incorreta e contar por usuário

# Explicação:
# - grep "Failed password": filtra tentativas de login com senha errada
# - awk '{print $(NF-5)}': pega o nome do usuário (posição padrão do log)
# - sort: ordena os usuários
# - uniq -c: conta quantas vezes cada usuário apareceu
# - sort -nr: ordena do maior para o menor número de tentativas

grep "Failed password" $LOG | awk '{print $(NF-5)}' | sort | uniq -c | sort -nr