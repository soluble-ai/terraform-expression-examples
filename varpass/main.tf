data "aws_security_group" "sg" {
    name = "test-sg"
}

variable "ssh_ingress" {
    default = "192.168.1.0/24"
}

resource "aws_security_group_rule" "ssh" {
    security_group_id = data.aws_security_group.sg.id
    description = "SSH ingress"
    type = "ingress"
    from_port =22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ var.ssh_ingress ]
}
