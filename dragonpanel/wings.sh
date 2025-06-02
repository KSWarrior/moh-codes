#!/bin/bash

sudo bash -c '
# ─── Install Dependencies ───────────────────────────────────────
apt update -y
apt install -y curl git software-properties-common

# Install Node.js 20 if not installed
if ! command -v node &>/dev/null || [[ $(node -v) != v20* ]]; then
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
  apt install -y nodejs
else
  echo -e "${GREEN}[✓] Node.js 20 already installed.${NC}"
fi

# ─── Clone Repository ───────────────────────────────────────────
if [ -d "node" ]; then
  echo -e "${RED}[!] 'node' directory already exists. Removing it...${NC}"
  rm -rf node
fi

echo -e "${CYAN}[+] Cloning draco-daemon...${NC}"
git clone https://github.com/dragonlabsdev/draco-daemon
mv draco-daemon node
cd node

# ─── Install Node Modules ───────────────────────────────────────
npm install

# ─── Prompt for Configuration ───────────────────────────────────
read -p "Enter configuration command or URL: " configure

# Convert http:// to https:// if needed
if [[ $configure == http://* ]]; then
  configure="${configure/http:\/\//https://}"
fi

# ─── Run Configuration ──────────────────────────────────────────
echo -e "${CYAN}[+] Running configuration: $configure${NC}"
eval "$configure"

# ─── Start Node Daemon ──────────────────────────────────────────
echo -e "${GREEN}[✓] Starting Draco Node...${NC}"
node .

echo -e "${GREEN}[✓] Node install and start completed.${NC}"
'
