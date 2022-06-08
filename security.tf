resource "aws_security_group" "allow-tomcat" {
    name = "allow-tomcat"
    description = "allow tomcat connection"

    ingress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow ssh"
      from_port = 22
      #ipv6_cidr_blocks = [ "value" ]
      #prefix_list_ids = [ "value" ]
      protocol = "tcp"
      #security_groups = [ "value" ]
      #self = false
      to_port = 22
    }, 
        {
            cidr_blocks = ["0.0.0.0/0"]
            description = "allow tomcat"
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
    }]

    egress = [ {
        cidr_blocks = [ "0.0.0.0/0" ]
        description = "outbound"
        from_port = 0
        protocol = "-1"
        to_port = 0
    } ]
  
}