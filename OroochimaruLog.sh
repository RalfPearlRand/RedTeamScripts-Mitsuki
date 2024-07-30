#!/bin/bash

# Define cores para formatação
cor_vermelho="\e[1;31m"   # Define vermelho claro e negrito
cor_verde="\e[1;32m"     # Define verde claro e negrito
cor_azul="\e[1;34m"      # Azul claro e negrito
cor_reset="\e[0m"        # Reseta a formatação para o padrão
x="teste"

banner() {
    echo "Use: ./script.sh Opcao /var/log/apache2/access.log"
    echo "Ex: ./script.sh 1 /var/log/apache2/access.log"
    echo ""
    echo " [1] Listar Ips"
    echo " [2] Qtd de acesso por recurso"
    echo " [3] User-Agente utilizados por IP"
    echo " [4] Tools utilizadas pelo IP"
    echo " [5] Procurar acesso por arquivo"
    echo " [6] Primeiro/Último acesso pelo IP"
}

banner2() {
    echo  -e "\e[31m ▒█████   ██▀███   ▒█████   ▄████▄   ██░ ██  ██▓ ███▄ ▄███▓ ▄▄▄       ██▀███   █    ██ \e[0m"
    echo  -e "\e[31m▒██▒  ██▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ▀█  ▓██░ ██▒▓██▒▓██▒▀█▀ ██▒▒████▄    ▓██ ▒ ██▒ ██  ▓██▒\e[0m"
    echo  -e "\e[31m▒██░  ██▒▓██ ░▄█ ▒▒██░  ██▒▒▓█    ▄ ▒██▀▀██░▒██▒▓██    ▓██░▒██  ▀█▄  ▓██ ░▄█ ▒▓██  ▒██░\e[0m"
    echo  -e "\e[31m▒██   ██░▒██▀▀█▄  ▒██   ██░▒▓▓▄ ▄██▒░▓█ ░██ ░██░▒██    ▒██ ░██▄▄▄▄██ ▒██▀▀█▄  ▓▓█  ░██░\e[0m"
    echo  -e "\e[31m░ ████▓▒░░██▓ ▒██▒░ ████▓▒░▒ ▓███▀ ░░▓█▒░██▓░██░▒██▒   ░██▒ ▓█   ▓██▒░██▓ ▒██▒▒▒█████▓ \e[0m"
    echo  -e "\e[31m░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ░▒ ▒  ░ ▒ ░░▒░▒░▓  ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ \e[0m"
    echo  -e "\e[31m  ░ ▒ ▒░   ░▒ ░ ▒░  ░ ▒ ▒░   ░  ▒    ▒ ░▒░ ░ ▒ ░░  ░      ░  ▒   ▒▒ ░  ░▒ ░ ▒░░░▒░ ░ ░ \e[0m"
    echo  -e "\e[31m░ ░ ░ ▒    ░░   ░ ░ ░ ░ ▒  ░         ░  ░░ ░ ▒ ░░      ░     ░   ▒     ░░   ░  ░░░ ░ ░ \e[0m"
    echo  -e "\e[31m    ░ ░     ░         ░ ░  ░ ░       ░  ░  ░ ░         ░         ░  ░   ░        ░     \e[0m"
    echo  -e "\e[31m                           ░                                                           \e[0m"
    echo  -e "\e[31m                            ██▓     ▒█████    ▄████                                    \e[0m"
    echo  -e "\e[31m                           ▓██▒    ▒██▒  ██▒ ██▒ ▀█▒                                   \e[0m"
    echo  -e "\e[31m                           ▒██░    ▒██░  ██▒▒██░▄▄▄░                                   \e[0m"
    echo  -e "\e[31m                           ▒██░    ▒██   ██░░▓█  ██▓                                   \e[0m"
    echo  -e "\e[31m                           ░██████▒░ ████▓▒░░▒▓███▀▒                                   \e[0m"
    echo  -e "\e[31m                           ░ ▒░▓  ░░ ▒░▒░▒░  ░▒   ▒                                    \e[0m"
    echo  -e "\e[31m                           ░ ░ ▒  ░  ░ ▒ ▒░   ░   ░                                    \e[0m"
    echo  -e "\e[31m                             ░ ░   ░ ░ ░ ▒  ░ ░   ░                                    \e[0m"
    echo  -e "\e[31m                               ░  ░    ░ ░        ░                                    \e[0m"
    echo  -e "\e[1;32m B y - Ralf Rand -  V.0.1   \e[0m"
    echo  -e "\e[1;32m   MENTORED BY Bl4dsc4n     \e[0m"
    echo  -e "\e[31m      0ff3ns!v3 S3cur!ty   \e[0m"
    echo '   _   _   _   _   _   _   _   _   _     _   _   _   _   _   _   _   _'
    echo '  / \ / \ / \ / \ / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \ '
    echo ' ( 0 | f | f | 3 | n | s | ! | v | 3 ) ( S | 3 | c | u | r | ! | t | y )'
    echo '  \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/  '
    echo ''
    sleep 2 # espera 2 segundos com banner
    clear # limpa a tela
    echo  -e "\e[31m ▒█████   ██▀███   ▒█████   ▄████▄   ██░ ██  ██▓ ███▄ ▄███▓ ▄▄▄       ██▀███   █    ██ \e[0m"
    echo  -e "\e[31m▒██▒  ██▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ▀█  ▓██░ ██▒▓██▒▓██▒▀█▀ ██▒▒████▄    ▓██ ▒ ██▒ ██  ▓██▒\e[0m"
    echo  -e "\e[31m▒██░  ██▒▓██ ░▄█ ▒▒██░  ██▒▒▓█    ▄ ▒██▀▀██░▒██▒▓██    ▓██░▒██  ▀█▄  ▓██ ░▄█ ▒▓██  ▒██░\e[0m"
    echo  -e "\e[31m▒██   ██░▒██▀▀█▄  ▒██   ██░▒▓▓▄ ▄██▒░▓█ ░██ ░██░▒██    ▒██ ░██▄▄▄▄██ ▒██▀▀█▄  ▓▓█  ░██░\e[0m"
    echo  -e "\e[31m░ ████▓▒░░██▓ ▒██▒░ ████▓▒░▒ ▓███▀ ░░▓█▒░██▓░██░▒██▒   ░██▒ ▓█   ▓██▒░██▓ ▒██▒▒▒█████▓ \e[0m"
    echo  -e "\e[31m░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ░▒ ▒  ░ ▒ ░░▒░▒░▓  ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ \e[0m"
    echo  -e "\e[31m  ░ ▒ ▒░   ░▒ ░ ▒░  ░ ▒ ▒░   ░  ▒    ▒ ░▒░ ░ ▒ ░░  ░      ░  ▒   ▒▒ ░  ░▒ ░ ▒░░░▒░ ░ ░ \e[0m"
    echo  -e "\e[31m░ ░ ░ ▒    ░░   ░ ░ ░ ░ ▒  ░         ░  ░░ ░ ▒ ░░      ░     ░   ▒     ░░   ░  ░░░ ░ ░ \e[0m"
    echo  -e "\e[31m    ░ ░     ░         ░ ░  ░ ░       ░  ░  ░ ░         ░         ░  ░   ░        ░     \e[0m"
    echo  -e "\e[31m                           ░                                                           \e[0m"
    echo  -e "\e[31m                            ██▓     ▒█████    ▄████                                    \e[0m"
    echo  -e "\e[31m                           ▓██▒    ▒██▒  ██▒ ██▒ ▀█▒                                   \e[0m"
    echo  -e "\e[31m                           ▒██░    ▒██░  ██▒▒██░▄▄▄░                                   \e[0m"
    echo  -e "\e[31m                           ▒██░    ▒██   ██░░▓█  ██▓                                   \e[0m"
    echo  -e "\e[31m                           ░██████▒░ ████▓▒░░▒▓███▀▒                                   \e[0m"
    echo  -e "\e[31m                           ░ ▒░▓  ░░ ▒░▒░▒░  ░▒   ▒                                    \e[0m"
    echo  -e "\e[31m                           ░ ░ ▒  ░  ░ ▒ ▒░   ░   ░                                    \e[0m"
    echo  -e "\e[31m                             ░ ░   ░ ░ ░ ▒  ░ ░   ░                                    \e[0m"
    echo  -e "\e[31m                               ░  ░    ░ ░        ░                                    \e[0m"
    echo  -e "\e[1;32m B y - Ralf Rand -  V.0.1   \e[0m"
    echo  -e "\e[1;32m   MENTORED BY Bl4dsc4n     \e[0m"
    echo  -e "\e[31m      0ff3ns!v3 S3cur!ty   \e[0m"
    echo  -e "\e[31m    _   _   _   _   _   _   _   _   _     _   _   _   _   _   _   _   _"
    echo  -e "\e[31m   / \ / \ / \ / \ / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \ "
    echo  -e "\e[31m  ( 0 | f | f | 3 | n | s | ! | v | 3 ) ( S | 3 | c | u | r | ! | t | y )"
    echo  -e "\e[31m   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/  "
    echo ''
}

if [[ -f "$2" && "$2" == *.log ]]
then
        echo ""
else
        echo "Arquivo de log Inválido"
        banner
        exit
fi

# Escreve os ips em um arquivo ips.txt
cat $2 | cut -d " " -f 1 | sort -u > ips.txt

# Escreve as requisições que cada IP teve
for i in $(cat ips.txt);do cat $2 | grep "$i" > $i.txt;done


if [ $2 == "1" ]
then
   banner2
   echo -e "${cor_vermelho}Ips que acessam o Servidor\e[0m"
   echo -e "${cor_verde}Qtd Acessos:\e[0m"
   cat $1 | cut -d " " -f 1 | sort | uniq -c | sort -unr

elif [ $2 == "2" ]
then
   banner2
   echo -e "${cor_vermelho}Qtd de acesso por recurso\e[0m"
   for i in $(cat ips.txt);do echo -e "${cor_verde}Recursos mas acessados pelo IP: $i \e[0m"; cat $2 | grep "$i" | cut -d " " -f 7 | sort | uniq -c;done

elif [ $2 == "3" ]
then
   banner2
   for i in $(cat ips.txt);do echo -e "${cor_verde}User-Agente utilizados pelo IP: $i \e[0m"; cat $2 | grep "$i" | cut -d '"' -f 6-10 | cut -d '"' -f1 | sort | uniq -c ;done

elif [ $2 == "4" ]
then
   banner2
   
   for i in $(cat ips.txt);do echo -e "${cor_vermelho}Tools utilizadas pelo IP: $i \e[0m"; cat $2 | grep "$i" | cut -d '"' -f 6-10 | egrep -oi "AppleWebKit|nmap|curl|wget|nikto" | sort -u;done
   
elif [ $2 == "5" ]
then
   banner2
   echo -e "${cor_vermelho}Qual arquivo quer procurar?\e[0m"
   echo -e "${cor_verde}Ex: passwords.txt\e[0m"
   read arquivo
   cat $2 | grep -i "$arquivo" | sort -u 

elif [ $2 == "6" ]
then
   banner2
   for i in $(cat ips.txt);do echo -e "${cor_verde}Primeio acesso do IP: $i \e[0m"; cat $2 | grep "$i" | head -n1;done
   for i in $(cat ips.txt);do echo -e "${cor_verde}Ultimo acesso do IP: $i \e[0m"; cat $2 | grep "$i" | tail -n1;done 

else
 banner
 banner2
 exit
fi
