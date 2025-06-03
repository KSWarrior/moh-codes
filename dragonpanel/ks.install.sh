#!/bin/bash

echo "=========================="
echo " DragonPanel Installer"
echo " By KS Warrior"
echo "=========================="
echo "1) Install Panel"
echo "2) Install Wings"
echo "3) Exit"
echo "=========================="
read -p "Enter your choice [1-3]: " choice

case $choice in
  1)
    echo "Installing Panel..."
    bash <(curl -sSL https://raw.githubusercontent.com/KSWarrior/moh-codes/refs/heads/main/dragonpanel/panel.sh)
    ;;
  2)
    echo "Installing Wings..."
    bash <(curl -sSL https://raw.githubusercontent.com/KSWarrior/moh-codes/refs/heads/main/dragonpanel/wings.sh)
    ;;
  3)
    echo "Exiting installer."
    exit 0
    ;;
  *)
    echo "Invalid choice. Please run the script again and choose 1, 2, or 3."
    exit 1
    ;;
esac
