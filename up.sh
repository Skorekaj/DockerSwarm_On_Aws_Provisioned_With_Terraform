#!/bin/bash

terraform apply -auto-approve | tee output.txt

# Next is to run the NodeJoinSwarm.sh to setup all the swarm members. 
# wait untill all the EC2's have initialized and are showing OK in AWS
 



