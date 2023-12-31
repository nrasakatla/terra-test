provider "aws" {
    region = "us-east-1"
}
 resource "aws_instance" "web-1" {
 #    count = 2
 #    count = var.environment == "dev" || var.environment == "DEV" ? 2 : 1
 #    ami = lookup(var.imagename, var.aws_region)
      ami = "ami-05548f9cecf47b442"
     #ami = "${data.aws_ami.my_ami.id}"
     availability_zone = "us-east-1c"
     instance_type = "t2.micro"
     key_name = "test"
     subnet_id = "subnet-0efff4566b0db3baa"
     security_groups = ["sg-048191993af284de6"]
     associate_public_ip_address = true
     tags = {
         environment = "dev"
         Name = "Server-1"
         Env = "Prod"
         Owner = "Sree"
       CostCenter = "ABCD-EFG"
     }
      user_data     = <<-EOF
                    #!/bin/bash
                    echo "Hello, World!" > hello.txt
                  EOF
 } 
