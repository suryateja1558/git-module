provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "instance" {
  ami           = "ami-053b0d53c279acc90" # us-east-1
  instance_type = "t2.micro"
  tags = {
      Name = "Test-server"
  }
}
