variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
  default    = "/Users/ckim/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default    = "ckim-mbp-tt"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  #default     = "us-west-2"
  default      = "ap-northeast-2"
}

# Ubuntu Precise 12.04 LTS (x64)
# Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
    ap-northeast-2 = "ami-06e7b9c5e0c4dd014"
  }
}
