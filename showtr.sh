#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
export CHATID="2105857557"
export KEY="5672989052:AAH_GGouVS3rAmZ71nmdmRcloWAIZIQhiPc"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
echo -e "${Lyellow}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${Lred}                PERMISSION DENIED ! ${NC}"
echo -e "${Lyellow}     Your VPS ${NC}( ${green}$MYIP${NC} ) ${Lyellow}Has been Banned "
echo -e "         Buy access permissions for scripts "
echo -e "                 Contact Admin :"
echo -e "             ${green}Telegram t.me/Andresakti "
echo -e "             WhatsApp wa.me/081282840785"
echo -e "${Lyellow}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m" >/dev/null 2>&1
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
source /var/lib/Andre-Sakti/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
#tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY TROJAN WS"
	echo "Select the existing client you want to show the config"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | lolcat
	echo ""
	echo ""
	echo ""
	echo ""
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
Domen=$(cat /etc/xray/domain)
export user=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
#export time=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export tnggl=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
#export timecreated=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 6 | sed -n "${CLIENT_NUMBER}"p)
export masaaktif=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 6 | sed -n "${CLIENT_NUMBER}"p)


# Link Trojan Akun
trojanlink="trojan://${uuid}@${Domen}:443?path=%2Ftrojan-ws&security=tls&host=${Domen}&type=ws&sni=${Domen}#${user}"
trojanlink1="trojan://${uuid}@${Domen}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${Domen}#${user}"
clear
echo -e "\033[1;93m====================\033[0m"
echo -e " CREATE TROJAN ACCOUNT          "
echo -e "\033[1;93m====================\033[0m"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${Domen}"
#echo -e "User Quota       : ${Quota} GB"
echo -e "port             : 400-900" 
echo -e "Key              : ${uuid}" 
echo -e "Path             : /trojan-ws" 
echo -e "ServiceName      : trojan-grpc" 
echo -e "\033[0;34m====================\033[0m" 
echo -e "Link WS          : ${trojanlink}" 
echo -e "\033[0;34m====================\033[0m" 
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "\033[0;34m====================\033[0m" 
echo -e "Format OpenClash : https://${Domen}:81/trojan-$user.txt" 
echo -e "\033[0;34m====================\033[0m" 
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[0;34m====================\033[0m" 
echo "" 
