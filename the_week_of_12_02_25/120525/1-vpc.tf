resource "aws_vpc" "fortressmaximus-vpc" {
  cidr_block       = "10.207.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "fortressmaximus-vpc"
    Service = "vpc"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }
}


resource "aws_vpc" "ultramagnus-vpc" {
  provider = aws.usw2
  cidr_block       = "10.205.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "ultramagnus-vpc"
    Service = "vpc"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }
}

########### Goal of this lab  ###########
#the goal of this lab is to launch two distinct ec2's in two different regions
#I did get it to work but there was a lot more work involved than I originally thought there would be