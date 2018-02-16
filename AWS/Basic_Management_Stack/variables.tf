variable "credentialsfile" {
  default = "/Users/ZachO/.aws/credentials" #This should reflect your home directory
  description = "Location of AWS Credentials"
}
variable "pRegion" {
  Default = "eu-west-2"
}
variable "pCloudFormationBucket" {
  Description = "CloudFormation Encrypted Bucket Name"
  Default = "company-cloudformation-encrypted"
}
variable "pS3CloudTrailsBucket" {
  Description = "CloudTrails Encrypted Bucket Name"
  Default = "ompany-cloudtrails-encrypted"
}
variable "pS3ConfigBucket" {
  Description = "Config Encrypted Bucket Name"
  Default = "ompany-config-encrypted"
}
variable "pS3KeyPairBucket" {
  Description = "KeyPair Encrypted Bucket Name"
  Default = "ompany-keypair-encrypted"
}
variable "pManagementVPCName" {
  Description = "Management VPC Name"
  Default= "Management VPC"
}
variable "pManagementCIDR" {
  Description = "CIDR block for Management VPC"
  Default = "10.10.0.0/16"
}
variable "pManagementPublicSubnetAZ1CIDR" {
  Description = "CIDR block for Management Public Subnet AZ1"
  Default = "10.10.8.0/21"
}
variable "pManagementPublicSubnetAZ2CIDR" {
  Description = "CIDR block for Management Public Subnet AZ2"
  Default = "10.10.16.0/24"
}
variable "pManagementPrivateSubnetAZ1CIDR" {
  Description = "CIDR block for Management Private Subnet AZ1"
  Default = "10.10.24.0/24"
}
variable "pManagementPrivateSubnetAZ2CIDR" {
  Description = "CIDR block for Management Private Subnet AZ2"
  Default = "10.10.32.0/24"
}