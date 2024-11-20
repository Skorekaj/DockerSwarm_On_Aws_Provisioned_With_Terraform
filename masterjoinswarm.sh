#!/bin/bash

swarm=$(ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" 'cat /manager.txt' | while read i; do echo $i| grep "docker swarm join --";done)

ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f2)" "sudo hostname Master2"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f3)" "sudo hostname Master3"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f2)" "sudo $swarm"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f3)" "sudo $swarm"

ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" "sudo docker service create --name nginx -p 8081:80 nginx" 
sleep 5
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" "sudo docker service scale nginx=3"
sleep 5
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" "sudo docker node update --availability drain Master1"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" "sudo docker node update --availability drain Master2"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" "sudo docker node update --availability drain Master3"

