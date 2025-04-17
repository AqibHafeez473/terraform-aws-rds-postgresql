# ✅ Security Group for RDS (Allow only Private Subnet Access)
resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip  # ✅ Yahan sirf private subnet ke IPs allow hon
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}