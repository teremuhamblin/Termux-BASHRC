cat > ~/.zshrc << 'EOF'
############################################################
# ZSH — LégionOS CYBER OPS v16 (XTREM RensOps Edition)
# Furtif • SIGINT++ • OSINT++ • Renseignement technique • SOC++++
############################################################

# ===========================
# 1. Optimisations ZSH (XTREM)
# ===========================
export HISTSIZE=120000
export SAVEHIST=120000
export HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
setopt AUTO_CD
setopt CORRECT
setopt NO_BEEP
setopt PROMPT_SUBST
setopt INTERACTIVE_COMMENTS

# Accélération compinit
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit -d ~/.zcompdump

# ===========================
# 2. Logo furtif RensOps (minimal)
# ===========================
echo -e "\e[90m[ LégionOS — CYBER OPS v16 XTREM RensOps ]\e[0m"

# ===========================
# 3. Alias tactiques RensOps++
# ===========================

# Système
alias ll='ls -alh --color=auto'
alias la='ls -A'
alias cls='clear'
alias update='pkg update && pkg upgrade -y'
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'

# Réseau
alias myip='curl -s ifconfig.me'
alias ports='ss -tulnp'
alias conns='ss -tanp'
alias stealthscan='nmap -sS -T1'
alias fullscan='nmap -p- -T4'
alias fastscan='nmap -T4 -F'
alias netwatch='watch -n 1 ss -tulnp'

# OSINT
alias osintip='curl -s https://ipinfo.io'
alias osintdns='dig ANY'
alias whois='whois'

# Logs / Forensic
alias syslog='logcat -d | tail -n 120'
alias netlog='logcat -d | grep -i net'

# Navigation RensOps
alias ops='cd ~/RensOps'
alias sig='cd ~/SIGINT'
alias os='cd ~/OSINT'
alias tools='cd ~/Tools'
alias scripts='cd ~/Scripts'

# ===========================
# 4. HUD — Vision tactique XTREM
# ===========================
hud() {
  echo -e "\e[32m========== HUD — LégionOS CYBER OPS v16 ==========\e[0m"
  echo -e "\e[36m[CPU]\e[0m"; top -bn1 | head -n 3
  echo -e "\e[36m[RAM]\e[0m"; free -h | head -n 2
  echo -e "\e[36m[STOCKAGE]\e[0m"; df -h | grep -E '(/data|/storage)'
  echo -e "\e[36m[IP]\e[0m"; curl -s ifconfig.me
  echo -e "\e[36m[CONNEXIONS]\e[0m"; ss -tulnp | head -n 10
  echo -e "\e[36m[PROCESS SUSPECTS]\e[0m"
  ps -aux | grep -v grep | grep -Ei "python|node|ssh|curl|wget"
}

# ===========================
# 5. Fonctions RensOps++ / SIGINT++ / OSINT++
# ===========================

extract() {
  case "$1" in
    *.tar.gz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "Format non reconnu." ;;
  esac
}

h() { history | grep "$1"; }

sysinfo() {
  echo "=== SYSTEM INFO ==="
  uname -a
  echo "=== STORAGE ==="
  df -h
}

netinfo() {
  echo "=== NET INFO ==="
  ip a
  echo "=== PORTS ==="
  ss -tulnp
}

pscan() {
  echo "=== PROCESS SCAN (RensOps) ==="
  ps -aux | grep -v grep | grep -Ei "python|node|ssh|curl|wget"
}

# Threat Hunt XTREM (SOC++++)
threathunt() {
  echo "=== THREAT HUNT — XTREM RensOps ==="
  logcat -d | grep -Ei "denied|forbidden|unauthorized|attack|intrusion|malicious|exploit|payload|breach|scan|suspicious|critical|alert"
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

# SIGINT++ — Surveillance réseau furtive
sigint() {
  echo "=== SIGINT — Surveillance réseau XTREM ==="
  ss -tulnp
  logcat -d | grep -Ei "network|conn|tcp|udp|drop|reset"
}

# Diagnostic XTREM
diagnostic() {
  echo "=== AUTO-DIAGNOSTIC — LégionOS XTREM ==="
  top -bn1 | head -n 3
  free -h | head -n 2
  df -h | grep -E '(/data|/storage)'
  ip a | grep inet
  ss -tulnp | head -n 10
}

# ===========================
# 6. Menu interactif XTREM RensOps
# ===========================
menu() {
  echo -e "\e[32m===== MENU CYBER OPS — LégionOS v16 XTREM =====\e[0m"
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

# ===========================
# 7. Prompt furtif RensOps++
# ===========================
PS1="%F{grey}[RensOps]%f %F{green}%~%f %F{red}⚡%f "

# ===========================
# 8. Loader militaire furtif XTREM
# ===========================
echo -e "\e[32m[ LégionOS ] Initialisation CYBER OPS v16 (XTREM RensOps)...\e[0m"
sleep 0.08
echo -e "\e[32m[ OK ] Modules RensOps++ chargés.\e[0m"
sleep 0.08
echo -e "\e[32m[ OK ] SIGINT++ opérationnel.\e[0m"
sleep 0.08
echo -e "\e[32m[ OK ] OSINT++ actif.\e[0m"
sleep 0.08
echo -e "\e[32m[ OK ] Environnement XTREM prêt.\e[0m"
EOF
