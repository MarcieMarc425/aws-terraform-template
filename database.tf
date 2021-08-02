# Create database subnet group
resource "aws_db_subnet_group" "database-subnet-group" {
  name        = "database subnets"
  subnet_ids  = [aws_subnet.private-subnet-2.id]
  description = "Subnet for Database Instance"

  tags = {
    Name = "Database Subnets"
  }
}

# Create database instance
resource "aws_db_instance" "database" {
  allocated_storage       = 5
  engine                  = "postgres"
  engine_version          = "13.3"
  instance_class          = "db.t3.micro"
  name                    = var.master_db_name
  password                = var.master_db_password
  username                = var.master_db_password
  backup_retention_period = 1
  db_subnet_group_name    = aws_db_subnet_group.database-subnet-group.name
  multi_az                = false
  publicly_accessible     = false
  storage_type            = "gp2"
}
