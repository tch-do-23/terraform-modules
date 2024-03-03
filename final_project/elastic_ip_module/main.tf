# main.tf

module "elastic_ips" {
  source = "./elastic_ip"

  instance_public_ips = [
  ]
}
