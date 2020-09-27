
git clone https://github.com/acupoints/astrology-tools.git

# sudo cp astrology-tools/docker-compose-1.27.3/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
sudo cp astrology-tools/docker-compose-1.27.4/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

sudo cp astrology-tools/docker-machine-v0.16.2/docker-machine-Linux-x86_64 /usr/local/bin/docker-machine
sudo chmod +x /usr/local/bin/docker-machine
docker-machine version

rm -rf astrology-tools/

