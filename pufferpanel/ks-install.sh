sudo bash -c '
# ─── KS Warrior PufferPanel Installer ────────────────
echo "=============================================="
echo "     ⚡ PufferPanel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Add the PufferPanel APT repository and its GPG key
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash

# Install PufferPanel without prompts
apt-get install -y pufferpanel

# Add admin user (interactive)
pufferpanel user add

# Start PufferPanel in background without logs
/usr/bin/pufferpanel > /dev/null 2>&1 &
'
