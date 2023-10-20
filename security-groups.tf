# Security Group for SSH Connection
resource "aws_security_group" "ssh-sg" {

    vpc_id = var.aws_default_vpc_id
    name = "${var.main_project_tag}-ssh-sg"
    description = "Security group to allow SSH connection"

    tags = merge(
    { "Name" = "${var.main_project_tag}-ssh-sg" },
    { "Project" = var.main_project_tag }
  )
}

resource "aws_security_group_rule" "allow-ssh-sg-rule" {
   security_group_id = aws_security_group.ssh-sg.id
   type = "ingress"
   protocol = "tcp"
   from_port = 22
   to_port = 22
   cidr_blocks = var.allowed_cidr_blocks
   description = "Allow SSH Traffic"
}

resource "aws_security_group" "http-allow" {
  name_prefix = "${var.main_project_tag}-http-allow"
  description = "Firewall to allow http traffic only."
  vpc_id = var.aws_default_vpc_id
  tags = merge(
    { "Name" = "${var.main_project_tag}-http-allow" },
    { "Project" = var.main_project_tag }
  )
}

resource "aws_security_group_rule" "tcp_allow_outbound" {
  security_group_id = aws_security_group.http-allow.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = var.allowed_cidr_blocks
  description       = "Allow any outbound traffic."
}