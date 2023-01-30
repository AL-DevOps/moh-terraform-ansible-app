variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {

    eu-central-1 = "ami-029cfca952b331b52"
  }
}
