variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {

    eu-west-1 = "ami-029cfca952b331b52"
    us-east-1 = "ami-0aa2b7722dc1b5612"
  }
}
