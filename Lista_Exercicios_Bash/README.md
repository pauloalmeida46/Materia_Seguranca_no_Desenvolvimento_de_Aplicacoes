# Lista de Exercícios Bash com Menu

Feito por: Paulo Almeida

Descrição
-	Este projeto contém um conjunto de scripts em Bash para análise de logs e exercícios de segurança/administração de sistemas, organizados conforme os tópicos do PDF fornecido.
-	O script principal `Lista_Exercicios_Bash_com_Menu.sh` roda um menu interativo que permite executar cada exercício individualmente.
-	Além do script principal, existe a pasta `Lista_Exercicios_Bash_Separadamente/` que agrupa subpastas. Cada subpasta contém scripts que implementam os exercícios de um tópico específico do PDF de forma separada.

Estrutura
-	`Lista_Exercicios_Bash_com_Menu.sh`: script principal com o menu para executar os exercícios.
-	`Lista_Exercicios_Bash_Separadamente/`: diretório com subpastas (por exemplo, "Tentativas de Senha Incorreta", "Analise de Atividade do Sistema", etc.) onde cada uma contém os scripts `exercicio_XX.sh` correspondentes.

Requisitos
-	Sistema operacional: Linux (testado em Ubuntu).
-	Shell: Bash.
-	Permissões de leitura em arquivos de log do sistema (algumas consultas usam `/var/log/*` e podem exigir `sudo`).

Como rodar
1. Abra o terminal no diretório do projeto (onde está `Lista_Exercicios_Bash_com_Menu.sh`).
2. Dê permissão de execução ao script (se ainda não tiver):

```bash
chmod +x Lista_Exercicios_Bash_com_Menu.sh
```

3. Execute o script (uso normal):

```bash
./Lista_Exercicios_Bash_com_Menu.sh
```

4. Se o script precisar acessar logs do sistema (por exemplo `/var/log/auth.log`), execute com `sudo`:

```bash
sudo ./Lista_Exercicios_Bash_com_Menu.sh
```

Executar exercícios individualmente
-	Para rodar um exercício específico, navegue até a subpasta correspondente em `Lista_Exercicios_Bash_Separadamente/` e torne o script executável, por exemplo:

```bash
cd "Lista_Exercicios_Bash_Separadamente/Tentativas de Senha Incorreta"
chmod +x exercicio_01.sh
./exercicio_01.sh
```

Observações
-	Alguns comandos dependem de arquivos de log presentes em distribuições Debian/Ubuntu (`/var/log/auth.log`, `/var/log/syslog`, etc.). Se estiver em outra distro, ajuste os caminhos de log conforme necessário.
-	O script foi pensado para uso educacional e de análise; revise e adapte comandos antes de rodar em ambientes de produção.

Contato
-	Autor: Paulo Almeida
