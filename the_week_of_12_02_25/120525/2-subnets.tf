############# public subnets

resource "aws_subnet" "public-subnet-us-east-1a" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id         # which vpc to create
  # step 1: create VPC
  # step 2: get VPC ID
  # step 3: add VPC ID into vpc_id argument in this subnet
  # which VPC to creste subnet in
  cidr_block = "10.207.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-us-east-1a"
  }
}


resource "aws_subnet" "public-subnet-us-west-2a" {
  provider = aws.usw2
  vpc_id = aws_vpc.ultramagnus-vpc.id        # which vpc to create
  cidr_block = "10.205.2.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-us-west-2a"
  }
}


# resource "aws_subnet" "public-subnet-us-east-1b" {
#   vpc_id = aws_vpc.fortressmaximus-vpc.id        # which vpc to create
#   cidr_block = "10.207.2.0/24"
#   availability_zone = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet-us-east-1b"
#   }
# }

# # resource "aws_subnet" "public-subnet-us-east-1c" {
#   vpc_id = aws_vpc.fortressmaximus-vpc.id         # which vpc to create
#   cidr_block = "10.207.3.0/24"
#   availability_zone = "us-east-1c"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet-us-east-1c"
#   }
# }

# # ############### private subnets

# resource "aws_subnet" "private-subnet-us-east-1a" {
#   vpc_id = aws_vpc.fortressmaximus-vpc.id       # which vpc to create
#   cidr_block = "10.207.11.0/24"
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "private-subnet-us-east-1a"
#   }
# }

# resource "aws_subnet" "private-subnet-us-east-1b" {
#   vpc_id = aws_vpc.fortressmaximus-vpc.id        # which vpc to create
#   cidr_block = "10.207.12.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "private-subnet-us-east-1b"
#   }
# }

# resource "aws_subnet" "private-subnet-us-east-1c" {
#   vpc_id = aws_vpc.fortressmaximus-vpc.id        # which vpc to create
#   cidr_block = "10.207.13.0/24"
#   availability_zone = "us-east-1c"

#   tags = {
#     Name = "private-subnet-us-east-1c"
#   }
# }