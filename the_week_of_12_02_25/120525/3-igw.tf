resource "aws_internet_gateway" "fortressmaximus-igw" {
  vpc_id = aws_vpc.fortressmaximus-vpc.id

  tags = {
    Name    = "fortressmaximus-igw"
    Service = "application1"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }
}


resource "aws_internet_gateway" "ultramagnus-igw" {
  provider = aws.usw2
  vpc_id = aws_vpc.ultramagnus-vpc.id

  tags = {
    Name    = "ultramagnus-igw"
    Service = "application1"
    Owner = "Optimus Prime"
    Planet = "Cybertron"
  }
}
