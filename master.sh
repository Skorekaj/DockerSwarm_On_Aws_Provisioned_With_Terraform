#!/bin/bash

sudo hostname Master1
sudo yum install docker -y
sudo systemctl start docker
sudo docker swarm init | tee init.txt
sudo docker swarm join-token manager | tee manager.txt
sudo docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer