#!/bin/bash

# ==============================
# COMO RODAR:
# ==============================

# Para rodar abra o terminal no local do arquivo e execute esses comandos:

# chmod +x analise_logs.sh
# sudo ./analise_logs.sh

# ==============================
# SCRIPT DE ANÁLISE DE LOGS
# ==============================

LOG_AUTH="/var/log/auth.log"
LOG_SYS="/var/log/syslog"
LOG_KERN="/var/log/kern.log"
LOG_DPKG="/var/log/dpkg.log"
LOG_BOOT="/var/log/wtmp"

# ==============================
# EXERCÍCIO 1
# ==============================
ex1() {
    echo "Usuários com tentativas de login falhas:"
    grep "Failed password" $LOG_AUTH | awk '{print $(NF-5)}' | sort | uniq -c | sort -nr
}

# ==============================
# EXERCÍCIO 2
# ==============================
ex2() {
    echo "Logins bem-sucedidos:"
    grep "Accepted" $LOG_AUTH
}

# ==============================
# EXERCÍCIO 3
# ==============================
ex3() {
    echo "Uso do comando su:"
    grep "su:" $LOG_AUTH
}

# ==============================
# EXERCÍCIO 4
# ==============================
ex4() {
    echo "Uso do sudo:"
    grep "sudo" $LOG_AUTH
}

# ==============================
# EXERCÍCIO 5
# ==============================
ex5() {
    echo "Logins rejeitados (outros motivos):"
    grep -E "invalid user|authentication failure" $LOG_AUTH
}

# ==============================
# EXERCÍCIO 6
# ==============================
ex6() {
    echo "Último boot:"
    who -b
}

# ==============================
# EXERCÍCIO 7
# ==============================
ex7() {
    echo "Eventos de reboot/shutdown:"
    last -x | grep -E "shutdown|reboot"
}

# ==============================
# EXERCÍCIO 8
# ==============================
ex8() {
    echo "Erros do kernel:"
    grep -iE "error|fail|warn" $LOG_KERN
}

# ==============================
# EXERCÍCIO 9
# ==============================
ex9() {
    echo "Serviços iniciados/parados:"
    grep -E "Started|Stopped" $LOG_SYS
}

# ==============================
# EXERCÍCIO 10
# ==============================
ex10() {
    echo "Problemas de hardware:"
    grep -iE "disk|usb|hardware" $LOG_SYS
}

# ==============================
# EXERCÍCIO 11
# ==============================
ex11() {
    echo "Pacotes instalados recentemente:"
    grep "install" $LOG_DPKG
}

# ==============================
# EXERCÍCIO 12
# ==============================
ex12() {
    echo "Pacotes removidos:"
    grep "remove" $LOG_DPKG
}

# ==============================
# EXERCÍCIO 13
# ==============================
ex13() {
    echo "Uso de apt/dpkg:"
    grep -E "apt|dpkg" $LOG_AUTH
}

# ==============================
# EXERCÍCIO 14
# ==============================
ex14() {
    echo "Tempo de atividade:"
    uptime
}

# ==============================
# EXERCÍCIO 15
# ==============================
ex15() {
    read -p "Digite a data (ex: Mar 10): " data
    echo "Eventos entre 14h e 15h:"
    grep "$data 14:" $LOG_SYS
}

# ==============================
# EXERCÍCIO 16
# ==============================
ex16() {
    grep -iE "critical|fatal|segfault" $LOG_SYS
}

# ==============================
# EXERCÍCIO 17
# ==============================
ex17() {
    echo "Serviços que mais geram logs:"
    awk '{print $5}' $LOG_SYS | sort | uniq -c | sort -nr | head
}

# ==============================
# EXERCÍCIO 18
# ==============================
ex18() {
    echo "Login falho + método:"
    grep "Failed password" $LOG_AUTH
}

# ==============================
# EXERCÍCIO 19
# ==============================
ex19() {
    echo "Monitorando log em tempo real..."
    tail -f $LOG_AUTH | grep "Failed password"
}

# ==============================
# EXERCÍCIO 20
# ==============================
ex20() {
    echo "Pacotes atualizados:"
    grep "upgrade" $LOG_DPKG
}

# ==============================
# EXERCÍCIO 21
# ==============================
ex21() {
    read -p "Digite o serviço (ex: sshd): " servico
    grep -iE "$servico.*error|warning" $LOG_SYS
}

# ==============================
# EXERCÍCIO 22
# ==============================
ex22() {
    grep -iE "segfault|killed" $LOG_SYS
}

# ==============================
# EXERCÍCIO 23
# ==============================
ex23() {
    echo "Tempo de login por usuário:"
    last
}

# ==============================
# MENU
# ==============================
while true; do
    echo ""
    echo "========= MENU ========="
    echo "(1) Exercicio_1_Tentativas_Login_Falhas"
    echo "(2) Exercicio_2_Logins_Sucesso"
    echo "(3) Exercicio_3_Uso_su"
    echo "(4) Exercicio_4_Uso_sudo"
    echo "(5) Exercicio_5_Logins_Rejeitados"
    echo "(6) Exercicio_6_Ultimo_Boot"
    echo "(7) Exercicio_7_Shutdown_Reboot"
    echo "(8) Exercicio_8_Erros_Kernel"
    echo "(9) Exercicio_9_Servicos_Status"
    echo "(10) Exercicio_10_Hardware"
    echo "(11) Exercicio_11_Pacotes_Instalados"
    echo "(12) Exercicio_12_Pacotes_Removidos"
    echo "(13) Exercicio_13_Uso_Apt"
    echo "(14) Exercicio_14_Uptime"
    echo "(15) Exercicio_15_Filtro_Horario"
    echo "(16) Exercicio_16_Erros_Criticos"
    echo "(17) Exercicio_17_Frequencia_Servicos"
    echo "(18) Exercicio_18_Login_Metodo"
    echo "(19) Exercicio_19_Monitoramento_Tempo_Real"
    echo "(20) Exercicio_20_Pacotes_Atualizados"
    echo "(21) Exercicio_21_Erros_Servico"
    echo "(22) Exercicio_22_Segfaults"
    echo "(23) Exercicio_23_Tempo_Login"
    echo "(0) Sair"
    echo "========================"

    read -p "Escolha uma opção: " op

    case $op in
        1) ex1 ;;
        2) ex2 ;;
        3) ex3 ;;
        4) ex4 ;;
        5) ex5 ;;
        6) ex6 ;;
        7) ex7 ;;
        8) ex8 ;;
        9) ex9 ;;
        10) ex10 ;;
        11) ex11 ;;
        12) ex12 ;;
        13) ex13 ;;
        14) ex14 ;;
        15) ex15 ;;
        16) ex16 ;;
        17) ex17 ;;
        18) ex18 ;;
        19) ex19 ;;
        20) ex20 ;;
        21) ex21 ;;
        22) ex22 ;;
        23) ex23 ;;
        0) echo "Saindo..."; exit ;;
        *) echo "Opção inválida!" ;;
    esac
done