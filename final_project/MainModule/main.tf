# ec2_module/main.tf

resource "aws_instance" "ec2_instance" {
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  count = length(var.instance_name)
  ami           = "i-0a6ed7e0c66f224b4"     # Replace with appropriate ami-ID
  instance_type = lookup(var.instance_type, var.instance_name[count.index])
  key_name      = aws_key_pair.pub_key.key_name

# User data script for instance initialization
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y               # Update the system
              git clone        # Clone the project repository. I'll update the url once I create private repo with terraform
  
  tags = merge(
    {
      Name        = var.instance_name[count.index]
      Team        = "TuranCyberHub"
      CreatedTime = "02.28.2024"
    },
    var.tags
  )
}
resource "aws_key_pair" "pub_key" {
  key_name   = "ssh-key"
  public_key = var.ssh_pub_key
}



