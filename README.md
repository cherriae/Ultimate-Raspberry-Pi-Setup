# Raspberry Pi build

| App               | Ports Used       | Space Required     |
| ----------------- | ---------------- | ------------------ |
| Docmost           | 3000             | 200 MB             |
| Filebrowser       | 8000, 80, 443    | 100 MB + Files     |
| Glance            | 8080             | 50 MB              |
| InfluxDB          | 8086             | 500 MB + Data      |
| Karakeep          | 3001             | 100 MB             |
| MCP               | 3500             | ? MB               |
| Pi-hole           | 5555, 80         | 100 MB             |
| PiVPN             | 51820            | 50 MB              |
| Homarr            | 7575             | 100 MB             |
| Portainer         | 9000, 9443, 8001 | 150 MB             |
| Cockpit           | 9090             | 100 MB             |
| NginxProxyManager | 8090, 81, 8443   | 300 MB             |
| Grafana           | 3100             | 250 MB + Data      |
| qBittorent        | 8050, 6881       | 100 MB + Downloads |
| Home Assistant    | 8123             | 500 MB + Data      |
| NextCloud         | 8081             | 500 MB + Files     |

> Estimate total: 15 GB not including other files

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

## NginxProxyManager
- Install using docker: `docker compose up -d`

## Grafana
- Run: `chmod +x ./install.sh`
- Install Grafana via `install.sh`

## qBittorent 
- Install using docker: `docker compose up -d`

## NextCloud
- Install using docker: `docker compose up -d`

## Home Assistant
- Install using docker: `docker compose up -d`
