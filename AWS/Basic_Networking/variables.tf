variable "Region" {
  default = "us-east-2"
}
/*
variable "aws_access_key" {
  default = "xxxxx"
  description = "the user aws access key"
}
variable "aws_secret_key" {
  default = "xxxx"
  description = "the user aws secret key"
}
*/
variable "credentialsfile" {
  default = "/Users/ZachO/.aws/credentials" #This should reflect your home directory
  description = "Location of AWS Credentials"
}

variable "VPC-CDIR" {
    default = "10.10.0.0/16"
  description = "VPC CDIR"
}
variable "Public-Subnet-AZ1" {
  default = "10.10.8.0/21"
  description = "Public Subnet CDIR AZ1"
}
variable "Private-Subnet-AZ1" {
  default = "10.10.24.0/24"
  description = "Private Subnet CDIR AZ1"
}