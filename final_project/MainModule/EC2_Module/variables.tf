
variable "number_of_instances" {
  description = "The number of EC2 instances to launch"
}
variable "tags" {
  type = map(any)
  default = {
    Owner     = "Nigora"
    CreatedBy = "Nigora"
    Project   = "final_project"
    Purpose   = "development"
  }
}

variable "instance_type" {
  type = map(any)
  default = {
    ansible    = "t2.micro"
    jenkins = "t2.small"
    kubernetes  = "t3a.medium"
  }
}

variable "instance_name" {
  type    = list(any)
  default = ["ansible", "jenkins", "kubernetes"]
}

variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      description = "allow ssh traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "allow TCP"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
      ]
}
variable "ssh_pub_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPLQaupjQH8kWPBDtdmbtMYJiLNRh/aGCFpjnyaUF6jOvgst9AV6q6+ZEy9Tu0ERIQKR3pSdB7Ak1x1tb/zd83l8fB/PTpGaRWzTIqJbYjvVNzUFPCW/6hh5siuk5lt5GpKQ70ZItVsbt5qd/idZ7UXx7CWM2kGe978GFJcTU66J8NEttJbUXkW/wCyHDZfYHKynPO0A0xzO3la6WBR4U0/YTz6/Q0SGVmse63TyvOEqG8N3Sc9yRsnj8KoSu6iYLiPuCvQTtSbNNwjU5Akzpoor6i48Lo7jwQp0deSDmKSsutj1q8ORlL7JUMHyZdEhX1y4ntbbozHkDr9KWYtfn9"
}
