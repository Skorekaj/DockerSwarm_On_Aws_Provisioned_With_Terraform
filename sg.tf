data "aws_vpc" "default" {
 default = true
}

resource "aws_security_group" "swarm_server_sg_tf" {
 name        = "swarm-server-sg-tf"
 description = "Allow Rules for Swarm servers"
 vpc_id      = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "allow_2377" {
 type              = "ingress"
 description       = "2377 for communication with and between manager nodes"
 from_port         = 2377
 to_port           = 2377
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.swarm_server_sg_tf.id
}

resource "aws_security_group_rule" "allow_7946" {
 type              = "ingress"
 description       = "7946 TCP/UDP for overlay network node discovery"
 from_port         = 7946
 to_port           = 7946
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.swarm_server_sg_tf.id
}

resource "aws_security_group_rule" "allow_4789" {
 type              = "ingress"
 description       = "4789 UDP for overlay network traffic"
 from_port         = 4789
 to_port           = 4789
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.swarm_server_sg_tf.id
}
resource "aws_security_group_rule" "allow_8080" {
 type              = "ingress"
 description       = "8080 network traffic"
 from_port         = 8080
 to_port           = 8080
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.swarm_server_sg_tf.id
}

resource "aws_security_group_rule" "allow_all" {
 type              = "egress"
 description       = "allow all"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.swarm_server_sg_tf.id
}

