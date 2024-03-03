# elastic_ip/main.tf

resource "aws_eip" "example" {
  count = length(var.instance_public_ips)

  vpc      = true
  instance = var.instance_public_ips[count.index]
}
variable "instance_public_ips"
  type    = list(any)
  default = ["", "", ""]    #Provide public IPs of the instances you created
