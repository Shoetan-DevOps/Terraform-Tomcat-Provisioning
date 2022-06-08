resource "aws_instance" "tomcat" {
    ami = var.my-ami["RHEL"]
    instance_type = var.my-instance-type[0]
    key_name = var.my-key-pem

    #user_data = 
    security_groups = [aws_security_group.allow-tomcat.id]

    tags = {
      "name" = "Tomcat Sandbox"
      "source" = "Terraform"
    }
}