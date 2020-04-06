#!/bin/bash
set -e
# update repo
apt-get update
apt-get -y upgrade
# Install git
apt-get install -y git curl wget apache2
#Install Java and Setup JAVA_HOME
sudo apt-get install -y openjdk-8-jre
JAVA_HOME=`readlink -e $(which java)`
export PATH=$PATH:$JAVA_HOME
echo "Java home : ${JAVA_HOME}"
# script is meant for quick & easy install via:
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo chmod 777 /var/run/docker.sock
# Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# set max_map_count value (Linux)
sudo sysctl -w vm.max_map_count=262144
#copy docker-Compose file
SONAR_HOME=/opt/sonar
mkdir -p ${SONAR_HOME}
sudo cp -r /tmp/docker-compose.yaml ${SONAR_HOME}/docker-compose.yaml
cd ${SONAR_HOME}
# start sonarqube
docker-compose up -d
## Clean cache
apt-get clean
