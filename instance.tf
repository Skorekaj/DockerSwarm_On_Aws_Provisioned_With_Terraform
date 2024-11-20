
resource "aws_instance" "Master1" {
    ami = "ami-0b2ed2e3df8cf9080" // Aws Linux AMI
    instance_type = "t2.micro"
    tags = {Name = "Master1"}
    key_name = "aws" // use an excisting key from AWS
    vpc_security_group_ids = [aws_security_group.swarm_server_sg_tf.id]
    user_data = file("${path.module}/master.sh") // script.sh bash file
}
resource "aws_instance" "Master2" {
    ami = "ami-0b2ed2e3df8cf9080"
    instance_type = "t2.micro"
    tags = {Name = "Master2"}
    key_name = "aws" // use an excisting key from AWS
    vpc_security_group_ids = [aws_security_group.swarm_server_sg_tf.id]
    user_data = file("${path.module}/node.sh") // script.sh bash file
}
resource "aws_instance" "Master3" {
    ami = "ami-0b2ed2e3df8cf9080"
    instance_type = "t2.micro"
    tags = {Name = "Master3"}
    key_name = "aws" // use an excisting key from AWS
    vpc_security_group_ids = [aws_security_group.swarm_server_sg_tf.id]
    user_data = file("${path.module}/node.sh") // script.sh bash file
}
resource "aws_instance" "Node1" {
    ami = "ami-0b2ed2e3df8cf9080"
    instance_type = "t2.micro"
    tags = {Name = "Node1"}
    key_name = "aws" // use an excisting key from AWS
    vpc_security_group_ids = [aws_security_group.swarm_server_sg_tf.id]
    user_data = file("${path.module}/node.sh") // script.sh bash file
}
resource "aws_instance" "Node2" {
    ami = "ami-0b2ed2e3df8cf9080"
    instance_type = "t2.micro"
    tags = {Name = "Node2"}
    key_name = "aws" // use an excisting key from AWS
    vpc_security_group_ids = [aws_security_group.swarm_server_sg_tf.id]
    user_data = file("${path.module}/node.sh") // script.sh bash file
}

output "public_ip_Master1" {
 description = "The public IP address assigned to the instance."
 value      = [aws_instance.Master1.public_ip]
}

output "public_ip_Master2" {
 description = "The public IP address assigned to the instance."
 value      = [aws_instance.Master2.public_ip]
}

output "public_ip_Master3" {
 description = "The public IP address assigned to the instance."
 value      = [aws_instance.Master3.public_ip]
}

output "public_ip_Node1" {
 description = "The public IP address assigned to the instance."
 value      = [aws_instance.Node1.public_ip]
}

output "public_ip_Node2" {
 description = "The public IP address assigned to the instance."
 value      = [aws_instance.Node2.public_ip]
}