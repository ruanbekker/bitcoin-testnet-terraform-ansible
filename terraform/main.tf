module "bitcoin" {
  source = "modules/bitcoin/"
  
  profile       = "terraform"
  region        = "af-south-1"
  team          = "devops"
  environment   = "dev"

  coin          = "bitcoin"
  coin_version  = "0.21.1"
  ami_prefix    = "packer-bitcoin"
  instance_type = "t3.medium"
  network_tier  = "public"
  key_name      = "default"
}

output "instance_id" {
  value = module.bitcoin.instance_id
}

output "ip" {
  value = module.bitcoin.ip
}