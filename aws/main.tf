terraform {
required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
}
}
        required_version = ">= 1.2.0"
}

provider "aws" {
region = "ap-south-1"
}

locals {
  #     instances = toset(["test1","test2"])
        instances = {"test1":"ami-01b6d88af12965bb6","test2":"ami-02d26659fd82cf299"}
}

resource "aws_instance" "aws_ec2_test"{
     #  count = 2
        for_each = local.instances
     #  ami = "ami-02d26659fd82cf299"
        ami = each.value
        instance_type = "t2.micro"
        tags = {
   #  Name = "terraformtest- ${count.index}"
      Name = each.key
   
 }
     
}
