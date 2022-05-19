data "aws_security_group" "sg" {
    name = "test-sg"
}

locals {
  ports = [ 21, 3388 ]
  # for loops are unsupported
  ports_plus_one = [for p in local.ports : p + 1]
}

resource "aws_security_group_rule" "dangerous-rules" {
  count = length(local.ports_plus_one)
  security_group_id = data.aws_security_group.sg.id
  description = "Port ${local.ports_plus_one[count.index]} ingress"
  type = "ingress"
  from_port = local.ports_plus_one[count.index]
  to_port = local.ports_plus_one[count.index]
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
}
