# 🏛️ Architecture — Termux‑BASHRC (LégionOS CYBER OPS)
Ce document décrit l’architecture interne du projet **Termux‑BASHRC**, conçu comme un environnement Bash militaire avancé pour Termux ARM64.

L’objectif est de fournir une structure claire, modulaire, tactique, inspirée des environnements cyber militaires (SOC, CERT, RensOps, SIGINT).

---

# 🧩 1. Vision d’ensemble

L’architecture de LégionOS CYBER OPS repose sur **6 couches tactiques** :

1. **Core Bash Layer** — Fondations Bash, alias, prompt, historique.  
2. **HUD Layer** — Monitoring système et réseau en temps réel.  
3. **SOC Layer** — Analyse, détection, forensic, threat hunting.  
4. **OSINT Layer** — Renseignement open‑source (IP, domaine).  
5. **SIGINT Layer** — Surveillance réseau (TCP/UDP, logs).  
6. **Command Suite Layer** — Menu interactif militaire + outils avancés.

Chaque couche est indépendante, modulaire, et peut évoluer jusqu’à la version 10.

---

# ⚙️ 2. Core Bash Layer

### Contenu :
- Alias système  
- Alias réseau  
- Alias forensic  
- Navigation cyber  
- Historique Bash optimisé  
- Prompt militaire LégionOS  
- Logo ASCII cyber minimal  

### Rôle :
Assurer une base **stable**, **rapide**, **ergonomique**, compatible Termux ARM64.

---

# 🧠 3. HUD Layer (Monitoring tactique)

### Fonctions :
- `hud`  
- CPU / RAM / stockage  
- IP publique  
- Ports ouverts  
- Processus suspects  

### Rôle :
Fournir une **vision tactique instantanée** de l’état du système.

### Optimisations :
- Appels système réduits  
- Filtrage intelligent  
- Affichage compact v6  

---

# 🛡️ 4. SOC Layer (Défense avancée)

### Modules :
- `threathunt`  
- `loghunt`  
- `pscan`  
- `nethunt`  

### Rôle :
Détection des anomalies, menaces, erreurs, comportements suspects.

### Filtrage :
- événements denied / forbidden  
- intrusion / exploit / payload  
- erreurs réseau / TLS / SSL  
- processus suspects (python, ssh, curl…)

---

# 🌐 5. OSINT Layer (Renseignement)

### Modules :
- `osint_ip`  
- `osint_domain`  

### Sources :
- ipinfo.io  
- dig  
- whois  

### Rôle :
Analyse rapide d’IP, domaines, DNS, informations publiques.

---

# 📡 6. SIGINT Layer (Surveillance réseau)

### Module :
- `sigint`

### Rôle :
Surveillance réseau légère :
- connexions TCP/UDP  
- logs réseau  
- resets / drops  

### Objectif :
Donner une **vision SIGINT** sans dépendances lourdes.

---

# 🧪 7. Audit Layer (Analyse réseau)

### Modules :
- `scan`  
- `fastscan`  
- `stealth`  
- `fullscan`  

### Rôle :
Audit réseau légal en environnement de test / lab / CTF.

---

# 🩺 8. Diagnostic Layer

### Module :
- `diagnostic`

### Rôle :
Auto‑diagnostic complet :
- CPU  
- RAM  
- stockage  
- réseau  
- ports  

---

# 🎛️ 9. Command Suite Layer (Menu militaire)

### Module :
- `menu`

### Rôle :
Interface militaire centralisée regroupant :
- HUD  
- SOC  
- OSINT  
- SIGINT  
- Audit  
- Diagnostic  

### Objectif :
Simplifier l’usage pour les opérations rapides.

---

# 🧱 10. Structure des fichiers
