data "aws_vpc" "default" {
  default = true
  tags = {
    Name = "main"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "region-name"
    values = [var.aws_region]
  }
}

resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.available.names
  result_count = 1
}

data "aws_subnet" "tier" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = random_shuffle.az.result[0]
  tags = {
    Tier = var.network_tier
  }
}
