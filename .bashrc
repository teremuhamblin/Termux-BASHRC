cat > ~/.bashrc << 'EOF'
############################################################
# BASH — LégionOS CYBER OPS v6 (ULTIMATE Military Edition)
# Défense, Forensic, OSINT, SIGINT, Audit réseau, SOC++++
############################################################

# Historique — forensic
HISTSIZE=60000
HISTFILE=~/.bash_history

############################################################
# ASCII LOGO — Cyber minimal, moderne, militaire
############################################################
echo -e "\e[36m
   ___      _            ___   ____   _____ 
  / _ \ ___(_) ___  ___ / _ \ / ___| | ____|
 | | | / __| |/ _ \/ __| | | |\___ \ |  _|  
 | |_| \__ \ |  __/\__ \ |_| | ___) || |___ 
  \___/|___/_|\___||___/\___/ |____/ |_____|
\e[0m"

echo -e "\e[32m[ LégionOS — CYBER OPS v6 ULTIMATE ]\e[0m"

############################################################
# Alias CYBER OPS — Réseau / Forensic / OSINT / SOC++++
############################################################

# Système
alias ll='ls -alh --color=auto'
alias la='ls -A'
alias cls='clear'
alias update='pkg update && pkg upgrade -y'
alias reload='source ~/.bashrc'

# Réseau
alias myip='curl -s ifconfig.me'
alias ports='ss -tulnp'
alias conns='ss -tanp'
alias dns='getent hosts'
alias scan='nmap -sV'
alias fastscan='nmap -T4 -F'
alias stealth='nmap -sS -T2'
alias fullscan='nmap -p- -T4'
alias quickping='ping -c 4'
alias netwatch='watch -n 1 ss -tulnp'

# OSINT
alias whois='whois'
alias osintip='curl -s https://ipinfo.io'
alias osintdns='dig ANY'

# Logs / Forensic
alias dmesg='dmesg | tail -n 50'
alias syslog='logcat -d | tail -n 80'
alias netlog='logcat -d | grep -i net'

# Navigation Cyber
alias ops='cd ~/CyberOps'
alias tools='cd ~/Tools'
alias scripts='cd ~/Scripts'
alias wordlists='cd ~/Wordlists'

############################################################
# HUD CYBER OPS — Vision tactique v6 (Ultra optimisé CPU)
############################################################
hud() {
  echo -e "\e[32m========== HUD — LégionOS CYBER OPS v6 ==========\e[0m"

  echo -e "\e[36m[CPU]\e[0m"
  top -bn1 | head -n 3

  echo -e "\e[36m[RAM]\e[0m"
  free -h | head -n 2

  echo -e "\e[36m[STOCKAGE]\e[0m"
  df -h | grep -E '(/data|/storage|/dev/block)'

  echo -e "\e[36m[IP]\e[0m"
  curl -s ifconfig.me

  echo -e "\e[36m[CONNEXIONS]\e[0m"
  ss -tulnp | head -n 10

  echo -e "\e[36m[PROCESS SUSPECTS]\e[0m"
  ps -aux | grep -v grep | grep -Ei "python|node|ssh|curl|wget"
}

############################################################
# Fonctions CYBER OPS — SOC++++ / OSINT / Audit réseau / SIGINT
############################################################

# Décompression universelle
extract () {
  case "$1" in
    *.tar.gz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "Format non reconnu" ;;
  esac
}

# Recherche dans l’historique
h() {
  history | grep "$1"
}

# Info système rapide
sysinfo() {
  echo "=== SYSTEM INFO ==="
  uname -a
  echo
  echo "=== STORAGE ==="
  df -h
}

# Info réseau rapide
netinfo() {
  echo "=== NET INFO ==="
  ip a
  echo
  echo "=== PORTS ==="
  ss -tulnp
}

# Analyse des processus suspects
pscan() {
  echo "=== PROCESS SCAN (Cyber Ops) ==="
  ps -aux | grep -v grep | grep -Ei "python|node|ssh|curl|wget"
}

# Threat Hunt avancé (SOC++++)
threathunt() {
  echo "=== THREAT HUNT — SOC++++ ==="
  logcat -d | grep -Ei "denied|forbidden|unauthorized|attack|intrusion|malicious|exploit|payload|breach|scan|suspicious|violation|critical|alert"
}

# Log Hunt (forensic)
loghunt() {
  echo "=== LOG HUNT ==="
  logcat -d | grep -Ei "http|https|ssl|tls|connection|failed|timeout|drop|refused|blocked|reset|error|fatal"
}

# Net Hunt (analyse réseau)
nethunt() {
  echo "=== NET HUNT ==="
  ss -tulnp | grep -Ei "tcp|udp"
}

# OSINT — Analyse IP
osint_ip() {
  echo "=== OSINT — IP ==="
  curl -s https://ipinfo.io/"$1"
}

# OSINT — Analyse domaine
osint_domain() {
  echo "=== OSINT — DOMAIN ==="
  dig ANY "$1"
  whois "$1"
}

############################################################
# SIGINT — Surveillance réseau (lite)
############################################################
sigint() {
  echo "=== SIGINT — Surveillance réseau ==="
  ss -tulnp
  logcat -d | grep -Ei "network|conn|tcp|udp|drop|reset"
}

############################################################
# Auto-diagnostic système
############################################################
diagnostic() {
  echo "=== AUTO-DIAGNOSTIC — LégionOS ==="
  echo "[CPU]"
  top -bn1 | head -n 3
  echo "[RAM]"
  free -h | head -n 2
  echo "[STORAGE]"
  df -h | grep -E '(/data|/storage)'
  echo "[NETWORK]"
  ip a | grep inet
  echo "[PORTS]"
  ss -tulnp | head -n 10
}

############################################################
# MENU INTERACTIF — LégionOS CYBER OPS v6
############################################################
menu() {
  echo -e "\e[32m===== MENU CYBER OPS — LégionOS v6 =====\e[0m"
  echo "1) HUD"
  echo "2) Info système"
  echo "3) Info réseau"
  echo "4) Threat Hunt"
  echo "5) Log Hunt"
  echo "6) Net Hunt"
  echo "7) OSINT IP"
  echo "8) OSINT Domaine"
  echo "9) Full Scan"
  echo "10) Quick Ping"
  echo "11) SIGINT"
  echo "12) Diagnostic"
  echo "13) Quitter"
  echo -n "Choix : "
  read choix

  case $choix in
    1) hud ;;
    2) sysinfo ;;
    3) netinfo ;;
    4) threathunt ;;
    5) loghunt ;;
    6) nethunt ;;
    7) echo -n "IP : "; read ip; osint_ip "$ip" ;;
    8) echo -n "Domaine : "; read dom; osint_domain "$dom" ;;
    9) echo -n "Cible : "; read tgt; nmap -p- -T4 "$tgt" ;;
    10) echo -n "Cible : "; read host; ping -c 4 "$host" ;;
    11) sigint ;;
    12) diagnostic ;;
    13) echo "Fermeture." ;;
    *) echo "Choix invalide." ;;
  esac
}

############################################################
# Prompt CYBER OPS — style Kali LegionOS (ULTIMATE)
############################################################
PS1="\[\e[1;36m\][Cyber]\[\e[0m\] \[\e[1;32m\][LégionOS]\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] \[\e[1;36m\]>\[\e[0m\] "

############################################################
# Loader militaire (animé)
############################################################
echo -e "\e[32m[ LégionOS ] Initialisation CYBER OPS v6...\e[0m"
sleep 0.2
echo -e "\e[32m[ OK ] SOC++++ chargé.\e[0m"
sleep 0.2
echo -e "\e[32m[ OK ] OSINT opérationnel.\e[0m"
sleep 0.2
echo -e "\e[32m[ OK ] SIGINT actif.\e[0m"
sleep 0.2
echo -e "\e[32m[ OK ] Audit réseau prêt.\e[0m"
EOF
