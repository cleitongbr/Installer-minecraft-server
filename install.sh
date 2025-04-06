#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # Reset
clear
echo -e "${BLUE}╔═══════════════════════════════════════════════╗${NC}"
sleep 0.1
echo -e "${BLUE}║       ${YELLOW}Automatic Installer - PaperMC      ${BLUE}║${NC}"
sleep 0.1
echo -e "${BLUE}║     ${MAGENTA}by cleitongbr and ChatGPT <3       ${BLUE}║${NC}"
sleep 0.1
echo -e "${BLUE}╚═════════════════════════════════════v1════════╝${NC}"
sleep 1
echo -e "\n${YELLOW}Select your language:${NC}"
echo -e " ${GREEN}1${NC} - Português"
echo -e " ${GREEN}2${NC} - English"
echo -e " ${GREEN}3${NC} - Español"
echo -e " ${RED}0${NC} - Exit"
read -p "> " idioma

case $idioma in
  1) MSG_LANG="pt" ;;
  2) MSG_LANG="en" ;;
  3) MSG_LANG="es" ;;
  0) echo -e "${RED}Exiting...${NC}"; exit 0 ;;
  *) echo -e "${RED}Invalid option. Exiting...${NC}"; exit 1 ;;
esac

msg() {
    case $MSG_LANG in
        pt)
            case $1 in
                criando_pasta) echo "Criando pasta Paper..." ;;
                baixando_java) echo "Baixando Java 21..." ;;
                extraindo_java) echo "Extraindo Java 21..." ;;
                baixando_paper) echo "Baixando PaperMC..." ;;
                configurando) echo "Configurando servidor..." ;;
                firewall) echo "Abrindo porta 25565 no firewall..." ;;
                finalizado) echo "Instalação concluída! Iniciando em 3 segundos..." ;;
                pergunta_modo) read -p "Permitir apenas jogadores com conta original (yes/no)? " modo_online ;;
            esac
        ;;
        en)
            case $1 in
                criando_pasta) echo "Creating Paper folder..." ;;
                baixando_java) echo "Downloading Java 21..." ;;
                extraindo_java) echo "Extracting Java 21..." ;;
                baixando_paper) echo "Downloading PaperMC..." ;;
                configurando) echo "Configuring server..." ;;
                firewall) echo "Allowing port 25565 in firewall..." ;;
                finalizado) echo "Setup complete! Starting in 3 seconds..." ;;
                pergunta_modo) read -p "Allow only premium Minecraft accounts (yes/no)? " modo_online ;;
            esac
        ;;
        es)
            case $1 in
                criando_pasta) echo "Creando carpeta Paper..." ;;
                baixando_java) echo "Descargando Java 21..." ;;
                extraindo_java) echo "Extrayendo Java 21..." ;;
                baixando_paper) echo "Descargando PaperMC..." ;;
                configurando) echo "Configurando el servidor..." ;;
                firewall) echo "Abriendo puerto 25565 en el firewall..." ;;
                finalizado) echo "¡Instalación completa! Iniciando en 3 segundos..." ;;
                pergunta_modo) read -p "¿Permitir solo jugadores con cuenta original (yes/no)? " modo_online ;;
            esac
        ;;
    esac
}

msg criando_pasta
mkdir -p Paper && cd Paper || exit

msg baixando_java
curl -# -o jdk-21_linux-x64_bin.tar.gz https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.tar.gz

msg extraindo_java
tar -xzf jdk-21_linux-x64_bin.tar.gz
rm jdk-21_linux-x64_bin.tar.gz
mv jdk-* java21

export JAVA_HOME=$(pwd)/java21
export PATH=$JAVA_HOME/bin:$PATH

msg baixando_paper
curl -# -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/222/downloads/paper-1.21.4-222.jar

echo "eula=true" > eula.txt

TOTAL_RAM=$(free -g | awk '/^Mem:/{print $2}')
if [ "$TOTAL_RAM" -ge 4 ]; then
    RAM_ALLOC=3
elif [ "$TOTAL_RAM" -ge 3 ]; then
    RAM_ALLOC=2
elif [ "$TOTAL_RAM" -ge 2 ]; then
    RAM_ALLOC=1
else
    RAM_ALLOC=1
fi

# Perguntar modo online
msg pergunta_modo
if [[ "$modo_online" == "yes" ]]; then
    ONLINE_MODE="true"
else
    ONLINE_MODE="false"
fi

# Criar server.properties
cat <<EOF > server.properties
online-mode=$ONLINE_MODE
motd=Github.com/cleitongbr
EOF

cat <<EOF > start.sh
#!/bin/bash
export JAVA_HOME=\$(pwd)/java21
export PATH=\$JAVA_HOME/bin:\$PATH
\$JAVA_HOME/bin/java -Xms${RAM_ALLOC}G -Xmx${RAM_ALLOC}G -jar paper.jar nogui
EOF

chmod +x start.sh

msg firewall
if command -v ufw &> /dev/null; then
    if [[ $EUID -ne 0 ]]; then
        echo "??  Rode este comando manualmente com sudo: sudo ufw allow 25565"
    else
        ufw allow 25565
    fi
fi
msg finalizado
sleep 3
./start.sh
