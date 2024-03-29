module "aws-dev" {
  source = "../../infra"
  instance = "t2.micro"
  region_aws = "us-west-2"
  key = "dev-key"
}

output "IP" {
  value = module.aws-dev.public_ip
}