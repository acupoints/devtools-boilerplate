
git clone https://github.com/docker/compose.git
compose_latest=$(grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' compose/CHANGELOG.md | head -1)
rm -rf compose/

## You can also specify a comp version
# compose_latest=1.27.3
sudo curl -L "https://github.com/docker/compose/releases/download/$compose_latest/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

## You need to go over the wall when downloading, you can download from other places and copy to the current directory
# sudo cp docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

