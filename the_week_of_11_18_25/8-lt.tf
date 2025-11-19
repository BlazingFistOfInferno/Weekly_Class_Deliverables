resource "aws_launch_template" "fortressmaximus-lt" {
  name_prefix   = "fortressmaximus-lt"
  image_id      = "ami-0157af9aea2eef346"   #this image is from us-east-1
  instance_type = "t3.micro"

  key_name = "energoncube"

  vpc_security_group_ids = [aws_security_group.ping-sg.id,aws_security_group.fortressmaximus-sg.id]

    user_data = base64encode(file("user_data.sh"))

    tags = {
      Name    = "fortressmaximus-lt"
      Service = "vpc"
      Owner   = "Optimus Prime"
      Planet  = "Cybertron"
    }

    lifecycle {
    create_before_destroy = true
  }
}

#   user_data = base64encode(<<-EOF
#     #!/bin/bash
#     yum update -y
#     yum install -y httpd
#     systemctl start httpd
#     systemctl enable httpd

#     # Get the IMDSv2 token
#     TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

#     # Background the curl requests
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
#     curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
#     wait

#     macid=$(cat /tmp/macid)
#     local_ipv4=$(cat /tmp/local_ipv4)
#     az=$(cat /tmp/az)
#     vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

#     # Create HTML file
#     cat <<-HTML > /var/www/html/index.html
#     <!doctype html>
#     <html lang="en" class="h-100">
#     <head>
#     <title>Details for EC2 instance</title>
#     </head>
#     <body>
#     <div>
#     <h1>Malgus Clan</h1>
#     <h1>Chains Broken in Ireland</h1>
#     <p><b>Instance Name:</b> $(hostname -f) </p>
#     <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
#     <p><b>Availability Zone: </b> $az</p>
#     <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
#     </div>
#     </body>
#     </html>
#     HTML

#     # Clean up the temp files
#     rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
#   EOF
#   )

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name    = "fortressmaximus-lt"
#       Service = "vpc"
#       Owner   = "Optimus Prime"
#       Planet  = "Cybertron"
#     }
#   }




