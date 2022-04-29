locals {
  my_cidrs = {
    "prod" : "192.168.1.0/24",
    "dev" : "0.0.0.0/0"
  }
}

variable "env" {
  default = "dev"
}

resource "aws_security_group" "ssh" {
  #checkov:skip=CKV2_AWS_5:This is an example
  name              = "allow_tcp"
  description       = "Allow inbound TCP traffic"

  ingress {
    description = "TCP from anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    # checkov does not perform variable evaluation when there are
    # repeated structures within a resource, such as this case
    # where "ingress" and "egress" strucutres can be repeated.
    #
    # This should fail CKV_AWS_24 but does not.
    cidr_blocks = [ local.my_cidrs["${var.env}"] ]
  }

  egress {
    description      = "Open anywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
