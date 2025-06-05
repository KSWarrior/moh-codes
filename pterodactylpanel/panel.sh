#!/bin/bash

# ─── KS Warrior Pterodactyl Panel Installer ────────
echo "=============================================="
echo "     ⚡ Pterodactyl Panel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Step 1: Create directory structure
echo "Create directory"
mkdir -p pterodactyl/panel
cd pterodactyl/panel

# Step 2: Create docker-compose.yml file
echo "Create docker-compose.yml file ... "
cat <<EOF > docker-compose.yml
version: '3.8'

x-common:
  database:
    &db-environment
    MYSQL_PASSWORD: &db-password "S3cur3P@ssw0rd!"
    MYSQL_ROOT_PASSWORD: "R00tS3cur3!"
  panel:
    &panel-environment
    APP_URL: "https://panel.example.com"
    APP_TIMEZONE: "UTC"
    APP_SERVICE_AUTHOR: "admin@example.com"
    TRUSTED_PROXIES: "*"
  mail:
    &mail-environment
    MAIL_FROM: "noreply@example.com"
    MAIL_DRIVER: "smtp"
    MAIL_HOST: "mail"
    MAIL_PORT: "1025"
    MAIL_USERNAME: ""
    MAIL_PASSWORD: ""
    MAIL_ENCRYPTION: "true"

services:
  database:
    image: mariadb:10.5
    restart: always
    command: --default-authentication-plugin=mysql_native_password
    volumes:
      - "/srv/pterodactyl/database:/var/lib/mysql"
    environment:
      <<: *db-environment
      MYSQL_DATABASE: "panel"
      MYSQL_USER: "pterodactyl"
    networks:
      - pterodactyl

  cache:
    image: redis:alpine
    restart: always
    networks:
      - pterodactyl

  panel:
    image: ghcr.io/pterodactyl/panel:latest
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - "/srv/pterodactyl/var/:/app/var/"
      - "/srv/pterodactyl/nginx/:/etc/nginx/http.d/"
      - "/srv/pterodactyl/certs/:/etc/letsencrypt/"
      - "/srv/pterodactyl/logs/:/app/storage/logs"
    environment:
      <<: [*panel-environment, *mail-environment]
      DB_PASSWORD: *db-password
      APP_ENV: "production"
      APP_ENVIRONMENT_ONLY: "false"
      CACHE_DRIVER: "redis"
      SESSION_DRIVER: "redis"
      QUEUE_DRIVER: "redis"
      REDIS_HOST: "cache"
      DB_HOST: "database"
      DB_PORT: "3306"
    depends_on:
      - database
      - cache
    networks:
      - pterodactyl

networks:
  pterodactyl:
    ipam:
      config:
        - subnet: 172.20.0.0/16
EOF

# Step 3: Start Docker containers
echo "⚙️  Pterodactyl Panel Installing..."

# Start docker-compose in background and log output
docker-compose up -d > docker-ks-pterodactyl.log 2>&1 &

# Fake progress bar while docker-compose runs
for i in 5 10 20 30 40 50 60 70 80 90 100; do
    echo "📦 Installing... $i%"
    sleep 1
done

echo "✅ Pterodactyl Panel installation completed!"
echo "📄 Logs saved to docker-ks-pterodactyl.log"

# Step 4: Create an admin user for the Panel
echo "📧 Create user for Pterodactyl Panel"

read -p "Email: " EMAIL
read -p "Username: " USERNAME
read -p "First Name: " FIRSTNAME
read -p "Last Name: " LASTNAME
read -sp "Password: " PASSWORD
echo
read -p "Make this user an admin? (y/N): " ADMIN

if [[ "$ADMIN" == "y" || "$ADMIN" == "Y" ]]; then
  IS_ADMIN="--admin=1"
else
  IS_ADMIN=""
fi

docker-compose run --rm panel php artisan p:user:make \
  --email="$EMAIL" \
  --username="$USERNAME" \
  --name-first="$FIRSTNAME" \
  --name-last="$LASTNAME" \
  --password="$PASSWORD" \
  $IS_ADMIN
