provider "aws" {
    region = "us-west-2"
  }

data "aws_security_group" "sg" {
    name = "test-sg"
}

locals {
  # env_base = split("-", env)[0]
  # env_base = regex("^[^-]+", var.env)
  # env_base = substr(var.env, 0, 3)
  # env_base = regex("(...)", var.env)
  # env_base = replace(var.env, "-1000", "")
  env_base = substr(var.env, 0, 3)
  ssh_ingress = {
      "prod": "192.168.1.0/24",
      "dev": "0.0.0.0/0"
  }
}

variable "env" {
    default = "dev-1000"
}

resource "aws_security_group_rule" "ssh" {
    security_group_id = data.aws_security_group.sg.id
    description = "SSH ingress"
    type = "ingress"
    from_port =22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ local.ssh_ingress[local.env_base] ]
}
