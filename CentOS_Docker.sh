
git clone https://github.com/docker/compose.git
compose_latest=$(grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' compose/CHANGELOG.md | head -1)
rm -rf compose/
sudo curl -L "https://github.com/docker/compose/releases/download/$compose_latest/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

