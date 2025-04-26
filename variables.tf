#-----variables.tf-----
#=======================
variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ssh_key_public" {
  type    = string
  #Replace this with the location of you public key .pub
  default = "ec2-key.pub"
}

variable "ssh_key_private" {
  type    = string
  #Replace this with the location of you private key
  default = "ec2-key.pem"
}