#define region
variable "aws-region" {
    type = string
    #default = "us-east-2"
    #test if input works
}

variable "my-ami" {
    type = map
    default = {
        "AMZ" = "ami-0fa49cc9dc8d62c84"
        "RHEL" = "ami-005074b2b824595f4"
        "UBUNTU" = "ami-0aeb7c931a5a61206"
    }
}

variable "my-instance-type" {
    type = list(string)
    default = ["t2.micro", "t2.medium"]
}

# set key for environment
variable "my-key-pem" {
    type = string
    default = "terraform"
}

#output ec2 publis ip
#output ec2 privat ip