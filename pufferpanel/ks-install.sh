sudo bash -c '
# ─── KS Warrior PufferPanel Installer ────────────────
echo "=============================================="
echo "     ⚡ PufferPanel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Add the PufferPanel APT repository and its GPG key
echo "Puffer Panel Download ..."
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash  > ks-puffer.log

# Install PufferPanel without prompts
echo "Puffer Panel installing ..."
apt-get install -y pufferpanel > ks-puffer.log

# Add admin user (interactive)
echo "Create User for Puffer Panel"
pufferpanel user add
mkdir -p email && echo "{}" > email/emails.json

# Start PufferPanel
pufferpanel run
'
