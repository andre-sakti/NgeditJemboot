#!/bin/bash
# COLOR VALIDATION
clear
function xmenu(){
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | AndreSakti
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi

echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | AndreSakti
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | AndreSakti
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="✔️"
else
   status_ssh="${RED}❌${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}✔️${NC}"
else
    status_ws_epro="${RED}❌${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}✔️${NC}"
else
   status_haproxy="${RED}❌${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}✔️${NC}"
else
   status_xray="${RED}❌${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}✔️${NC}"
else
   status_nginx="${RED}❌${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}✔️${NC}"
else
   status_dropbear="${RED}❌${NC} "
fi
vm=$(cat /etc/vmess/.vmess.db | wc -l)
vll=$(cat /etc/vless/.vless.db | wc -l)
trr=$(cat /etc/trojan/.trojan.db | wc -l)
ssk=$(cat /etc/shadowsocks/.shadowsocks.db | wc -l)
sssh=$(cat /etc/ssh/.ssh.db | wc -l)
echo -e " "
echo -e " ${IPurple}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${IPurple}│$NC\033[41m                    SYSTEM INFORMATION                    $NC${IPurple}│$NC"
echo -e " ${IPurple}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " ${IPurple}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${IPurple}│$NC System OS${NC}     $IPurple=$NC $MODEL${NC}"
echo -e " ${IPurple}│$NC IP VPS${NC}        $IPurple=$NC $IPVPS${NC}"
echo -e " ${IPurple}│$NC Domain${NC}        $IPurple=$NC $domain${NC}"
echo -e " ${IPurple}│$NC Expiry script${NC} $IPurple=$green $certifacate ${NC}days"
echo -e " ${IPurple}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "         SSH : $status_ssh" "         NGINX : $status_nginx" "         XRAY : $status_xray         $NC" 
echo -e " ${IPurple}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${IPurple}│"
echo -e " ${IPurple}│$NC [${green}01${NC}] SSH MENU     ${IPurple}│$NC [${green}07${NC}] DELL ALL EXP ${IPurple}│$NC [${green}13${NC}] BCKP/RSTR   $NC${IPurple}│$NC" 
echo -e " ${IPurple}│$NC [${green}02${NC}] VMESS MENU   ${IPurple}│$NC [${green}08${NC}] AUTOREBOOT  ${IPurple} │$NC [${green}14${NC}] REBOOT      $NC${IPurple}│$NC"    
echo -e " ${IPurple}│$NC [${green}03${NC}] VLESS MENU   ${IPurple}│$NC [${green}09${NC}] INFO PORT   ${IPurple} │$NC [${green}15${NC}] RESTART     $NC${IPurple}│$NC"   
echo -e " ${IPurple}│$NC [${green}04${NC}] TROJAN MENU  ${IPurple}│$NC [${green}10${NC}] SPEEDTEST   ${IPurple} │$NC [${green}16${NC}] DOMAIN      $NC${IPurple}│$NC" 
echo -e " ${IPurple}│$NC [${green}05${NC}] SHADOW MENU  ${IPurple}│$NC [${green}11${NC}] RUNNING     ${IPurple} │$NC [${green}17${NC}] CERT SSL    $NC${IPurple}│$NC"
echo -e " ${IPurple}│$NC [${green}06${NC}] TRIAL MENU   ${IPurple}│$NC [${green}12${NC}] CLEAR LOG   ${IPurple} │ $NC[${green}18${NC}] CLEAR CACHE$NC${IPurple} │$NC"
echo -e " ${IPurple}│"
echo -e " ${IPurple}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "               SSH = $sssh" "  VMESS = $vm"  " VLESS = $vll"
echo -e "                 TROJAN = $trr" "SHADOWSICKS = $ssk"
echo -e " ${IPurple}╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " ${IPurple}│$NC Version       ${IPurple}=$NC V3.0"
echo -e " ${IPurple}│$NC User          ${IPurple}=$NC $username"
echo -e " ${IPurple}│$NC Script Status ${IPurple}=$NC $exp $sts "
echo -e " ${IPurple}╰══════════════════════════════════════════════════════════╯${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
m-trial
;;
7 | 07)
clear
xp
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
8 | 08)
clear
autoreboot
;;
9 | 09)
clear
prot
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
10)
clear
speedtest
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
11)
clear
run
;;
12)
clear
clearlog
;;
13)
clear
menu-backup
;;
14)
clear
reboot
;;
15)
clear
restart
;;
16)
clear
addhost
;;
17)
clear
fixcert
;;
18)
clear
clearcache
;;
esac
esac
read -n 1 -s -r -p "Press any key to back on menu"

menu
}
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | AndreSakti
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/andre-sakti/kintil/main/ip | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi

echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | AndreSakti
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | AndreSakti
clear
is_root() {
    if [ 0 == $UID ]; then
        echo -e "${OK} ${yl} The current user is the root user..${yl}"
        sleep 1
        echo -e "Getting Information...."
    else
        echo -e "${Error} ${yl} Please switch to the root user and execute start-menu again ${yl}"
        exit 1
    fi
}
clear
export m="\033[0;1;31m"
export y="\033[0;1;34m"
export yy="\033[0;1;36m"
export yl="\033[0;1;37m"
export wh="\033[0;1;33m"
export xz="\033[0;1;35m"
export gr="\033[0;1;32m"
echo "1;36m" > /etc/banner
echo "30m" > /etc/box
echo "1;31m" > /etc/line
echo "1;32m" > /etc/text
echo "1;33m" > /etc/below
echo "47m" > /etc/back
echo "1;35m" > /etc/number
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo 3d > /usr/bin/test
GitUser="givpn"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
#Domain
Domen=$(cat /etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
CITY=$(curl -s ipinfo.io/city)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipinfo.io/ip)
cpu=$(neofetch | grep "CPU" | cut -d: -f2 | sed 's/ //g')
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')
clear
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# Order ID
rm -f /usr/bin/ver
user=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $3}')
echo "$user" >/usr/bin/ver
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}$version${Font_color_suffix}"
Info2="${Green_font_prefix} Latest Version ${Font_color_suffix}"
Error=" Version ${Green_font_prefix}[$ver]${Font_color_suffix} Available${Red_font_prefix}[Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
stl="${Info2}"
else
stl="${Error}"
fi
clear
# Getting CPU Information
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
bulan=$(date +%b)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
    bulan=$(date +%b)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $10}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $4}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $7}')
else
    bulan=$(date +%Y-%m)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $8}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $2}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $5}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
    yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
    yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
    yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
    yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
    yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
    yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
    yesterday=NULL
    yesterday_v=NULL
    yesterday_rx=NULL
    yesterday_rxv=NULL
    yesterday_tx=NULL
    yesterday_txv=NULL
fi
#if [ "$(grep -wc live /root/t1)" != '0' ]; then
#    live=$(vnstat -i ${vnstat_profile} | grep live | awk '{print $8}')
#    live_v=$(vnstat -i ${vnstat_profile} | grep live | awk '{print $9}')
#    live_rx=$(vnstat -i ${vnstat_profile} | grep live | awk '{print $2}')
#    live_rxv=$(vnstat -i ${vnstat_profile} | grep live | awk '{print $3}')
#    live_tx=$(vnstat -i ${vnstat_profile} | grep live | awk '{print $5}')
#    live_txv=$(vnstat -i ${vnstat_profile} | grep live | awk '{print $6}')
#fi


# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(Registered)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
vm=$(cat /etc/vmess/.vmess.db | wc -l)
vll=$(cat /etc/vless/.vless.db | wc -l)
trr=$(cat /etc/trojan/.trojan.db | wc -l)
ssk=$(cat /etc/shadowsocks/.shadowsocks.db | wc -l)
sssh=$(cat /etc/ssh/.ssh.db | wc -l)
# TOTAL ACC CREATE VMESS WS
#vmess=$(grep -c -E "^###vms " "/etc/xray/config.json")
#vmess1=$(grep -c -E "^###vmstrial " "/etc/xray/config.json")
#vmess2=$(expr "$vmess" + "$vmess1")
# TOTAL ACC CREATE  VLESS WS
#less=$(grep -c -E "^###vls " "/etc/xray/config.json")
#less1=$(grep -c -E "^###vlstrial " "/etc/xray/config.json")
#less2=$(expr "$vless" + "$vless1")
# TOTAL ACC CREATE  VLESS TCP XTLS
#sws=$(grep -c -E "^###ssws " "/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
#rtls=$(grep -c -E "^###trx " "/etc/xray/tcp.json")
# TOTAL ACC CREATE  TROJAN WS TLS
#rws=$(grep -c -E "^###trs " "/etc/xray/config.json")
#rws1=$(grep -c -E "^###trstrial " "/etc/xray/config.json")
#rws2=$(expr "$trws" + "$trws1")
# TOTAL ACC CREATE  SOCKWS
#hockws=$(grep -c -E "^###sckws " "/etc/xray/config.json")
# TOTAL ACC CREATE OVPN SSH
#otal_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
echo -e "\e[$banner_colour"
#figlet -f $ascii "$banner"
#echo -e "\e[$text  VPS Script"
export sem=$( curl -s https://raw.githubusercontent.com/andresakti7/test/main/versions)
export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
export Server_URL="raw.githubusercontent.com/andresakti7/test/main"
License_Key=$(cat /etc/${Auther}/license.key)
export Nama_Issued_License=$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $License_Key | cut -d ' ' -f 7-100 | tr -d '\r' | tr -d '\r\n')
clear
echo -e " \e[$line╒════════════════════════════════════════════════════════════╕\e[m"
echo -e "  \e[$back_text                    \e[30m[\e[$box SERVER INFORMATION\e[30m ]\e[1m                  \e[m"
echo -e " \e[$line╘════════════════════════════════════════════════════════════╛\e[m"
echo -e "  \e[$yy CPU Model            : $cpu"
#echo -e "  \e[$yy CPU Model            :$cname \e[0m"
echo -e "  \e[$yy CPU Frequency        :$y$freq MHz $yl"
#echo -e "  \e[$yy Number Of Core       : $cores $yl"
echo -e "  \e[$yy Operating System     : "$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)
echo -e "  \e[$yy Kernel               : $(uname -r)"
echo -e "  \e[$yy Total Amount Of Ram  : $tram MB"
echo -e "  \e[$yy Used RAM             : $uram MB"
echo -e "  \e[$yy Free RAM             : $fram MB"
echo -e "  \e[$yy System Uptime        : $uptime"
echo -e "  \e[$yy Ip Vps/Address       :$xz $IPVPS $xz"
echo -e "  \e[$yy Domain Name          :$xz $Domen $xz"
echo -e "  \e[$yy Order ID             :$xz $Nama_Issued_License $xz"
#echo -e "  \e[$yy Expired Status       :$wh $(cat /etc/${Auther}/license-remaining-active-days.db)$wh Days$wh" | lolcat
echo -e "  \e[$yy Provided By          :$yl Script Credit by Andre Sakti $yl"
echo -e "  \e[$yy Status Update        :$stl"
echo -e "  $yy Expired Status       :$wh $(cat /etc/${Auther}/license-remaining-active-days.db)$wh Days$wh" #| lolcat
echo -e " \e[$line╒════════════════════════════════════════════════════════════╕\e[m"
echo -e " \e[$yy     Traffic        Today       Yesterday      Month   $yy"
echo -e "   \e[$text   Download${NC}     \e[${text}$today_tx $today_txv      $yesterday_tx $yesterday_txv     $month_tx $month_txv   \e[0m"
echo -e "   \e[$text   Upload${NC}       \e[${text}$today_rx $today_rxv      $yesterday_rx $yesterday_rxv     $month_rx $month_rxv   \e[0m"
echo -e "   \e[$text   Total${NC}      \e[${text}  $todayd $today_v     $yesterday $yesterday_v     $month $month_v  \e[0m "
echo -e " \e[$line╘════════════════════════════════════════════════════════════╛\e[m"
#echo -e "                       \E[0;41;37m LIST ACCOUNTS \E[0m" 
echo -e "                        $BOLD $UNDERLINE LIST ACCOUNTS " | lolcat
echo -e " \e[$yy          SSH      Vmess     Vless    Trojan-Ws   SOCK-WS        "  
echo -e " \e[$below           $sssh         $vm         $vll         $trr          $ssk            \e[0m "
echo -e " \e[$yy  Account   Account   Account    Account   Account   Account$yy "  
echo -e " \e[$line╒════════════════════════════════════════════════════════════╕\e[m"
#echo -e "  \e[   $yyExpired Status :$wh $(cat /etc/${Auther}/license-remaining-active-days.db)$wh Days$wh" | lolcat
echo -e " \e[$line╘════════════════════════════════════════════════════════════╛\e[m"
echo -e "  \e[$number (111)\e[m\e[$below xmenu"  ">>> >>> >>> >>> >>> >>> >>> >>> >>> >>> >>> >>> \e[m" | lolcat
echo -e " \e[$line╒════════════════════════════════════════════════════════════╕\e[m"
#echo -e " \e[$yy      Traffic        Download       Upload      Total   $yy"
#echo -e "   \e[$text    Live${NC}     \e[${text}$live_tx $live_txv      ${text}$live_rx $live_rxv     ${text}  $live $live_v   \e[0m"
#echo -e " \e[$line╘════════════════════════════════════════════════════════════╛\e[m"
echo -e "\e[$below "
read -p " Select xmenu :  " menu
echo -e ""
case $menu in
111) clear ; xmenu ;;
0) clear ; menu ;;
#x) exit ;;
#*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
