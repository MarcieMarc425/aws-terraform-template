# Variable for AWS access key
variable "aws_access_key" {
  description = "AWS access key"
  sensitive   = true
}

# Variable for AWS secret key
variable "aws_secret_access_key" {
  description = "AWS secret key"
  sensitive   = true
}

#Variable for AWS region
variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-1"
  type        = string
}

# Variable for VPS CIDR block
variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CDIR Block"
  type        = string
}

# Variable for availability zone
variable "availability-zone" {
  default     = "ap-southeast-1"
  description = "Availability Zone"
  type        = string
}

# Variable for public subnet 1 CIDR block
variable "public-subnet-1-cidr" {
  default     = "10.0.0.0/24"
  description = "Public Subnet 1 CIDR Block"
  type        = string
}

# Variable for private subnet 1 CIDR block
variable "private-subnet-1-cidr" {
  default     = "10.0.1.0/24"
  description = "Private Subnet 1 CIDR Block"
  type        = string
}

# Variable for private subnet 2 CIDR block
variable "private-subnet-2-cidr" {
  default     = "10.0.2.0/24"
  description = "Private Subnet 2 CIDR Block"
  type        = string
}
