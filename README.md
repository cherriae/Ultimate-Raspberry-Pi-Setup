# Raspberry Pi build

## Docker
- Run: `chmod +x ./install.sh`
- Install docker via `install.sh`

## Docmost
- Replace `APP_SECRET` (32 string key) and `STRONG_DB_PASSWORD` 
- Install using docker: `docker compose up -d`

## Filebrowser
- Run: `chmod +x ./install.sh`
- Install filebrowser via `install.sh`

## Glances
- Change `MY_SECRET_TOKEN` in .env
- Install using docker: `docker compose up -d`

## InfluxDB
- Run: `chmod +x ./install.sh`
- Install via `install.sh`

## Karakeep
- Uncomment `OPENAI_KEY` and paste key
- Change `SECRET_KEYS` in .env

## MCP
- Run: `chmod +x ./install.sh`
- Install MCP-Server via `install.sh`

## Pi-hole
- Run: `chmod +x ./install.sh`
- Install Pi-hole via `install.sh`

## PiVPN
- Run: `chmod +x ./install.sh`
- Install PiVPN via `install.sh`

## Homarr
- Change `SECRET_ENCRYPTION_KEY` using `openssl rand -hex 32`
- Install via docker: `docker compose up -d`

## Portainer
- Run: `chmod +x ./install.sh`
- Install Portainer via `install.sh`

## Cockpit
- Run: `chmod +x ./install.sh`
- Install Cockpit via `install.sh`

# NginxProxyManager
- Install using docker: `docker compose up -d`

# Grafana
- Run: `chmod +x ./install.sh`
- Install Grafana via `install.sh`