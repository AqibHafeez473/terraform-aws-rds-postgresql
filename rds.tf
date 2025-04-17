
# ✅ RDS PostgreSQL in Private Subnet
resource "aws_db_instance" "postgres_db" {
  allocated_storage      = 20
  engine                = "postgres"
  engine_version        = "15"
  instance_class        = "db.t3.micro"
  db_name               = var.db_name
  username             = var.db_username
  password             = var.db_password
  publicly_accessible   = false  # ✅ Private Subnet me deploy hoga
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.private_db_subnet_group.name  # ✅ Private Subnet Group Assign
}
