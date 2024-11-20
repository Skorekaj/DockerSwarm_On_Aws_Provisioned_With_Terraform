This project demonstartes how to provision a Docker Swarm on AWS using EC2 compute actioned by Terrraform.
Please see wiki for more detrails: https://github.com/Skorekaj/DockerSwarm_On_Aws_Provisioned_With_Terraform/wiki

- Setup run 5 ec2 instances.
- Configure sec groups to allow all traffic so nodes can join and communicate.
Ports:
Port 2377 TCP for communication with and between manager nodes
Port 7946 TCP/UDP for overlay network node discovery
Port 4789 UDP (configurable) for overlay network traffic

- Install docker :
- Start docker :
- Run swarm init on master1:
- Run visualiser on master1 (Browser representation of the swarm):
- Join node1 and node2 to the swarm :
- Create a manager token on master1:
- Join master2 and master3 to the swarm:
- Create a service on master1: 
- Scale the service to 3 : 
- Drain master1, master2 and master3 of containers: 

Now we have 3 services containers running on 2 nodes in a 5 node cluster with 3 managers.

Note: 
If one node goes down, the remaining containers fail over to the other node and if a manager fails one of the others take over.
When a node comes back online or you add a new node you can rebalance the cluster by running: 
sudo docker service update --force nginx


