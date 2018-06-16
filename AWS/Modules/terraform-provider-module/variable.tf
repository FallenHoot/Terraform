variable "shared_credentials_file" {
    description = "Name to be used on all the resources as identifier"
    default     = "%USERPROFILE%/.aws/credentials"
}

variable "aws_Profile" {
    description = "Name to be used on all the resources as identifier"
    default     = "NC_DEV_ZACH"
}

variable "region" {
    description = "Name to be used on all the resources as identifier"
    default     = "eu-central-1"
}