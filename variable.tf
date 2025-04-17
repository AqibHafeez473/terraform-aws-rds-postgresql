variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}


variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}
variable "rivate_subnet_2_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.3.0/24"
}
variable "aws_az" {
  description = "Availability zone for subnets"
  type        = string
  default     = "us-east-1a"
}
variable "s_az_2" {
  description = "Availability zone for subnets"
  type        = string
  default     = "us-east-1b"
}





variable "db_name" {
  description = "Database name"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "aqib"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "allowed_ip" {
  description = "List of allowed CIDR blocks for database access"
  type        = list(string)
  default     = ["10.0.2.0/24"]  # ✅ Sirf private subnet ke IPs allow honge
}
