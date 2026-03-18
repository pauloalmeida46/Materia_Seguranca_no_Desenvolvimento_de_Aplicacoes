# Lista de Exercícios de Firewall

Feito por: Paulo Almeida

## Descrição
Esta pasta reúne uma coleção de exercícios práticos sobre firewall (UFW e iptables), organizada por temas. Os exercícios mostram comandos exemplares para verificação, liberação, bloqueio, regras contextuais, gerenciamento e casos mais avançados úteis para desenvolvedores.

## Como usar
- Navegue pelas subpastas abaixo e abra os arquivos de texto para ver as questões e os comandos sugeridos.
- Os exemplos incluem comandos tanto para `ufw` quanto para `iptables` quando aplicável.

## Índice de arquivos e onde encontrar os comandos

- **Verificação e Políticas Padrão**: [Exercicios_01_04.txt](Verificacao%20e%20Politicas%20Padrao/Exercicios_01_04.txt) — Comandos para checar status (`ufw status`, `iptables -L`), habilitar/desabilitar UFW, e definir políticas padrão (DROP/ACCEPT).

- **Liberação Básica por Porta/Protocolo**: [Exercicios_05_09.txt](Liberacao%20Basica%20por%20Porta%20Protocolo/Exercicios_05_09.txt) — Exemplos para permitir portas comuns (SSH 22, HTTP 80, 8080, DNS 53) e regras para loopback/ESTABLISHED.

- **Bloqueio e Rejeição**: [Exercicio_10_12.txt](Bloqueio%20e%20Rejeicao/Exercicio_10_12.txt) — Como negar (DROP) ou rejeitar (REJECT) portas específicas e bloquear IPs.

- **Regras Contextuais (IP e Interface)**: [Exercicios_13_15.txt](Regras%20Contextuais%20-%20Ip%20e%20Interface/Exercicios_13_15.txt) — Regras condicionais por endereço de origem ou interface (ex.: permitir SSH só a um IP, permitir MySQL apenas pela rede interna, lidar com pacotes INVALID).

- **Gerenciamento de Regras**: [Exercicios_16_18.txt](Gerenciamento%20de%20Regras/Exercicios_16_18.txt) — Listagem numerada de regras, remoção por número, e como resetar/limpar o firewall.

- **Nível Intermediário / Relevante para Devs**: [Exercicios_19_21.txt](Nivel%20Intermediario%20-%20Relevante%20para%20Devs/Exercicios_19_21.txt) — Táticas como `ufw limit`, rate limiting no `iptables`, logging de tentativas e redirecionamento de portas (80 -> 8080) via NAT.

- **Material adicional (PDF)**: [ExerciciosFirewall.pdf](ExerciciosFirewall.pdf) — PDF original com os exercícios propostos pelo professor.

## Observações rápidas
- Os exemplos usam `sudo` onde necessário; adapte conforme seu ambiente.
- `ufw` é uma camada de alto nível mais simples; `iptables` oferece controle mais fino (ex.: NAT, logging, limites). Muitos exercícios mostram ambos para comparação.

Contato
-	Autor: Paulo Almeida
