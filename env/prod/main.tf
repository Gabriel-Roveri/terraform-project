module "aws-prod" {
  source = "../../infra"
  instance = "t2.micro"
  region_aws = "us-west-2"
  key = "prod-key"
}

output "IP" {
  value = module.aws-prod.public_ip
}