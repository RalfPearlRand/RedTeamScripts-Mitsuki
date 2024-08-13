JiraiyaRecon é um script de shell desenvolvido para realizar varreduras de portas e serviços em redes. Com uma interface de linha de comando simples, ele permite que os usuários realizem uma variedade de operações de rede, como varredura de portas usando diferentes ferramentas e técnicas.
Funcionalidades

O script oferece as seguintes opções:

    -a: PortScan com Hping3
    -b: Ping Sweep
    -c: Ping Sweep Porta/Serviço
    -d: PortScan em /dev/tcp
    -e: PortScan com NetCat
    -f: Chamar Script Externo
    -g: Extração de Dados
    -h: Localizando Serviços
    -i: Identifica Métodos
    -j: Localizando Servidores Web

Requisitos

    hping3: Para realizar varreduras de portas.
    netcat: Para comunicação de rede.
    nmap: Para identificação de serviços.

Instalação

Clone o repositório:

git clone https://github.com/RalfPearlRand/RedTeamScripts-Mitsuki.git
cd Jirayarecon

Dê permissão de execução ao script:

chmod +x Jiraiyarecon.sh

Uso

Execute o script com uma das opções disponíveis. Por exemplo:

./Jiraiyarecon.sh -a


Desenvolvedor Principal: Rafael Lira de Oliveira/0R0CH!S4G3 - https://www.linkedin.com/in/rafael-lira-de-oliveira-734b75224/)

Contribuições Especiais: Carlos Tuma - https://github.com/carlosalbertotuma | https://www.linkedin.com/in/carlos-tuma

0ff3ns!v3 S3cur!ty ®