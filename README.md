# vagrant-docker-sonarqube

prerequisites:

Install Virtual Box before running vagrant:

``vagrant up``

Run the docker-compose start the sonarqube process:

```
docker-compose up -d

Command to Scale up Containers:

docker-compose up -d --scale sonarqube=3

```
