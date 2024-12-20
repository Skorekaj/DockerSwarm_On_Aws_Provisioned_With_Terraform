terraform {
    required_providers {aws = {source  = "hashicorp/aws", version = "~> 4.16"}}
    required_version = ">= 1.2.0"
}
provider "aws" {region  = "eu-west-2"}

/* to create a new key
resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
  }
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
*/

/*
output "private_ip" {
 description = "The private IP address assigned to the instance."
 value      = [aws_instance.app_server[*].private_ip]
}
*/
/*
output "public_ip" {
 description = "The public IP address assigned to the instance."
 value      = [aws_instance.Jenkins[*].public_ip]
}
*/