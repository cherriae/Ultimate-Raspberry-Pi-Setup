docker volume create grafana-storage

# start grafana
docker run -d -p 3100:3000 --name=grafana \
  --volume grafana-storage:/var/lib/grafana \
  --restart=always \
  grafana/grafana-enterprise