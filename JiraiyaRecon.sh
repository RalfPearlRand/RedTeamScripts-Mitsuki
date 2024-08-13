#!/bin/bash

# Define cores para formatação
cor_vermelho="\e[1;31m"   # Define vermelho claro e negrito
cor_verde="\e[1;32m"      # Define verde claro e negrito
cor_azul="\e[1;34m"       # Define azul
cor_reset="\e[0m"         # Reseta a formatação para o padrão

# Exibir o banner

banner()
{
    echo  -e "\e[31m     ██╗██╗██████╗  █████╗ ██╗██╗   ██╗ █████╗     \e[0m"
    echo  -e "\e[31m     ██║██║██╔══██╗██╔══██╗██║╚██╗ ██╔╝██╔══██╗    \e[0m"
    echo  -e "\e[31m     ██║██║██████╔╝███████║██║ ╚████╔╝ ███████║    \e[0m"
    echo  -e "\e[31m██   ██║██║██╔══██╗██╔══██║██║  ╚██╔╝  ██╔══██║    \e[0m"
    echo  -e "\e[31m╚█████╔╝██║██║  ██║██║  ██║██║   ██║   ██║  ██║    \e[0m"
    echo  -e "\e[31m ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝    \e[0m"
    echo  -e "\e[31m                                                   \e[0m"
    echo  -e "\e[31m    ██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗    \e[0m"
    echo  -e "\e[31m    ██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║    \e[0m"
    echo  -e "\e[31m    ██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║    \e[0m"
    echo  -e "\e[31m    ██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║    \e[0m"
    echo  -e "\e[31m    ██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║    \e[0m"
    echo  -e "\e[31m    ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝    \e[0m"
    echo  -e "\e[1;32m B y - 0R0CH!S4G3 -  V.0.1   \e[0m"
    echo  -e "\e[1;32m   MENTORED BY Bl4dsc4n     \e[0m"
    echo  -e "\e[31m      0ff3ns!v3 S3cur!ty   \e[0m"
    echo '   _   _   _   _   _   _   _   _   _     _   _   _   _   _   _   _   _   '
    echo '  / \ / \ / \ / \ / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \  '
    echo ' ( 0 | f | f | 3 | n | s | ! | v | 3 ) ( S | 3 | c | u | r | ! | t | y ) '
    echo '  \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/  '
    echo ''
banner2()
{
   echo "Opções" 
   echo " a - PortScan com Hping3 "
   echo " b - PingSweep "
   echo " c - PingSweep Porta/Serviço"
   echo " d - PortScan em /dev/tcp"
   echo " e - PortScan com NetCat"
   echo " f - Chamar Script Externos"
   echo " g - Extração de Dados"
   echo " h - Localização de Serviços"
   echo " i - Indentifica Metodos"
   echo " j - Localizador de Servidores Web"
}


# Função para exibir ajuda
exibir_ajuda() {
    echo -e "Uso: ./portrecon.sh [opção]"
    echo ""
    echo -e "Opções disponíveis:"
    echo ""
    echo -e "  -a\tPortScan com Hping3"
    echo -e "  -b\tPingSweep"
    echo -e "  -c\tPingSweep Porta/Serviço"
    echo -e "  -d\tPortScan em /dev/tcp"
    echo -e "  -e\tPortScan com NetCat"
    echo -e "  -f\tChamar Script Externo"
    echo -e "  -g\tExtração de Dados"
    echo -e "  -h\tLocalizando Serviços"
    echo -e "  -i\tIdentifica Metodos"
    echo -e "  -j\tLocalizador de Servidores Web"
#    echo -e "  -k\tOpcao K"
#    echo -e "  -l\tOpcao L"
#    echo -e "  -m\tOpcao M"
#    echo -e "  -n\tOpcao N"
#    echo -e "  -o\tOpcao O"
#    echo -e "  -p\tOpcao P"
#    echo -e "  -q\tOpcao Q"
#    echo -e "  -r\tOpcao R"
#    echo -e "  -s\tOpcao S"
#    echo -e "  -t\tOpcao T"
#    echo -e "  -u\tOpcao U"
#    echo -e "  -v\tOpcao V"
#    echo -e "  -x\tOpcao X"
#    echo -e "  -z\tOpcao Z"
    echo ""
}

# Função para validar a entrada do IP
validar_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        echo " IP inválido. Por favor, digite um IP válido."
        exit 1
    fi
}

# Lógica do script
if [[ "$1" == "--help" ]]; then
    banner
    exibir_ajuda
    exit 0
fi
if [ "$1" = "-a" ]
then
    echo "PortScan Hping3"
    echo "Digite o IP"
    read ip
    echo "Digite a porta inicial ex:22"
    read portai
    echo "Digite a porta final Ex:65000"
    read portaf
    sudo hping3 "$ip" -S --scan "$portai"-"$portaf"
    
elif [ "$1" = "-b" ]
then
    echo "Pingsweep"
    echo "Digite IP da Rede - Ex: 192.168.0"
    read ip
    echo "Digite a porta ex: 80"
    read porta
    for i in $(seq 1 254);do
    if [ -n "$(sudo timeout 0.5 hping3 -1 -c 1 "$ip"."$i" 2>/dev/null | grep 'ttl')" ];then echo "$ip"."$i";fi
    done
    
elif [ "$1" = "-c" ]
then
    echo "PingSweep Porta/Servico"     
    echo "Digite IP da Rede - Ex: 192.168.0"     
    read ip     
    echo "Digite a Porta - Ex: 80"     
    read porta     
    for i in $(seq 1 254);do
    if [ -n "$(sudo timeout 0.5 hping3 -p "$porta" -S -c 1 "$ip"."$i" 2>/dev/null | grep "SA")" ];then echo "$ip"."$i";fi;done
    

elif [ "$1" = "-d" ]
then
    echo "Portscan /dev/tcp"
    echo "Digite IP da Rede - Ex: 192.168.0"  
    read ip
    for i in $(seq 1 65000);do timeout 0.5 echo -n 2>/dev/null < "/dev/tcp/$ip/$i" && echo "$i open";done
    
elif [ "$1" = "-e" ]
then
    echo "PortScan ncat" 
    echo “Digite o IP - Ex: 192.168.0.1” 
    read ip 
    echo “Digite a porta inicial - Ex: 1” 
    read portai 
    echo “Digite a porta inicial - Ex: 6500” 
    read portaf 
    nc -w 1 -v -n -z “$ip” “$portai-$portaf”
elif [ "$1" = "-f" ]
then
    echo "Chamar Scripts Externos"
    PORT="$1" 
    trap "echo 'Stopping...'; exit" SIGINT SIGTERM 
    ifconfig | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' 
    while true; do     
    echo "Listening on port $PORT..."     
    nc -l -p $PORT | tee -a OK.txt done

elif [ "$1" = "-g" ]
then
    echo "Extração de dados"
    trap "echo 'Stopping...'; exit" SIGINT SIGTERM 
    ifconfig | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' 
    while true; do     
    echo "Listening on port $PORT..."     
    nc -l -p $PORT | tee -a OK.txt done

elif [ "$1" = "-h" ]
then
    echo "Localização de Serviços"
    echo "Escolha o IP do Alvo"
    read "ip"
    map -sV -T5 -p- -v "$ip" | grep -i "open"
    
elif [ "$1" = "-i" ]
then
    echo "Identifica Metodos"
    echo ""
    echo "Digite o dominio"
    read dominio
    echo "Digite a porta"
    read PORT
    echo "Digite o Endpoint Ex: /"
    read endpoint
    echo ""
    echo -e "OPTIONS "$endpoint" / HTTP/1.1\r\nHost: 127.0.0.1\r\n\r\n" | nc -w 1 $dominio $PORT
    elif [ "$1" = "-j" ]
then
    echo "Localizador de Servidores Web"
    echo "Localizando Servidores Web"
    echo ""
    echo -n -e "Digite a rede (ex: 10.0.0):"
    read rede 
    echo -n -e "Digite o intervalo (ex: 1 a 254):"
    read intervaloi
    echo -n -e "Digite o intervalo final (ex: 1 a 254):"
    read intervalof
    echo -n -e "Digite a quantidade de Processos (ex: 1 a 100): "
    read process
    for i in $(seq "$intervaloi" "$intervalof"); do 
           echo -e "80\n443\n8080" | xargs -P "$process" -I {} bash -c "curl -s -I $rede\.$i:{} && echo 'Porta: {} $rede.$i'"

elif [ "$1" = "-q" ]
then
    echo "Opcao R"

elif [ "$1" = "-s" ]
then
    echo "Opcao S"

elif [ "$1" = "-t" ]
then
    echo "Opcao T"

elif [ "$1" = "-u" ]
then
    echo "Opcao U"

elif [ "$1" = "-v" ]
then
    echo "Opcao V"

elif [ "$1" = "-x" ]
then
    echo "Opcao X"

elif [ "$1" = "-z" ]
then
    echo "Opcao Z"
else
    echo "Opcao vazia ou não existe"
fi
