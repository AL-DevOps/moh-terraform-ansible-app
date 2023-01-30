variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {

    eu-central-1 = "ami-04e2e94de097d39868"
  }
}
