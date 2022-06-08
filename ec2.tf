resource "aws_instance" "tomcat" {
    ami = var.my-ami["RHEL"]
    instance_type = var.my-instance-type[0]
    key_name = var.my-key-pem

    user_data = file("${path.module}/install-tomcat.sh")
    vpc_security_group_ids = [aws_security_group.allow-tomcat-fw.id]

    tags = {
      "Name" = "Tomcat Sandbox"
      "source" = "Terraform"
    }
}