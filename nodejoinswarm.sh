#!/bin/bash

swarm=$(ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f1)" 'cat /init.txt' | while read i; do echo $i| grep "docker swarm join --";done)

ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f4)" "sudo hostname Node1"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f5)" "sudo hostname Node2"


ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f4)" "sudo $swarm"
ssh -i "aws.pem" -o StrictHostKeyChecking=no ec2-user@"$(python readip.py | cut -d" " -f5)" "sudo $swarm"

source /home/pi/TerraForm/AwsDockerSwarm/masterjoinswarm.sh
