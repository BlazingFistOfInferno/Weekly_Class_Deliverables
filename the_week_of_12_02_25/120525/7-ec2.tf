resource "aws_instance" "fortressmaximus-ec2" {
  #ami           = "ami-09968b16214ef62ce"   #this image is from eu-west-3
  ami           = "ami-0157af9aea2eef346"   #this image is from us-east-1
  instance_type = "t3.micro"
  #key_name =""
  subnet_id = aws_subnet.public-subnet-us-east-1a.id
  vpc_security_group_ids = [aws_security_group.ping-sg.id,aws_security_group.fortressmaximus-sg.id]
  associate_public_ip_address = true

  #user_data = file("user_data.sh")

  tags = {
    Name = "fortressmaximus-ec2"
  }
}



resource "aws_instance" "ultramagnus-ec2" {
  provider = aws.usw2
  ami           = "ami-02b297871a94f4b42"   #this image is from us-west-2
  instance_type = "t3.micro"
  #key_name =""
  subnet_id = aws_subnet.public-subnet-us-west-2a.id
  vpc_security_group_ids = [aws_security_group.ultramagnus-sg.id]
  associate_public_ip_address = true

  #user_data = file("user_data.sh")

  tags = {
    Name = "ultramagnus-ec2"
  }
}