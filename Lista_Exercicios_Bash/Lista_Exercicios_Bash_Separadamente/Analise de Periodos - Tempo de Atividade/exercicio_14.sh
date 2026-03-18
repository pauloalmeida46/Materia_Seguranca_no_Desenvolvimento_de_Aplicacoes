#!/bin/bash

# Arquivo de log:
# Vamos usar o comando "last", que lê /var/log/wtmp

# Objetivo:
# Calcular o tempo entre o último boot e o último shutdown

# Explicação:
# - last -x: mostra eventos de reboot e shutdown
# - grep reboot/shutdown: filtra eventos
# - head: pega os mais recentes
# - date -d: converte para timestamp (segundos)
# - diferença entre tempos = uptime

# Último boot
BOOT=$(last -x | grep reboot | head -n 1 | awk '{print $5, $6, $7, $8}')

# Último shutdown
SHUTDOWN=$(last -x | grep shutdown | head -n 1 | awk '{print $5, $6, $7, $8}')

# Converter para segundos
BOOT_SEC=$(date -d "$BOOT" +%s 2>/dev/null)
SHUTDOWN_SEC=$(date -d "$SHUTDOWN" +%s 2>/dev/null)

# Verificação simples
if [[ -z "$BOOT_SEC" || -z "$SHUTDOWN_SEC" ]]; then
    echo "Erro ao obter datas. Verifique o formato do log."
    exit 1
fi

# Cálculo do tempo de atividade
UPTIME_SEC=$((BOOT_SEC - SHUTDOWN_SEC))

# Converter para formato legível
echo "Tempo de atividade do sistema:"
echo "$UPTIME_SEC segundos"