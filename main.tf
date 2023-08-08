provider "aws" {
  region = "eu-west-2"  
}

# EC2 instance
resource "aws_instance" "web_instance" {
  ami           = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "my-key-pair" # add SSH key here
  # Add any additional configuration for the web tier instance

  tags = {
    Name = "Web Instance"
  }
}

#Application tier
resource "aws_instance" "app_instance" {
  ami           = "ami-12345678"  # Replace with the desired AMI ID
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  # Add any additional configuration for the application tier instance

  tags = {
    Name = "App Instance"
  }
}


# Database using RDS. This code creates an RDS instance with MySQL engine, a micro instance class, and a storage of 20 GB.

resource "aws_db_instance" "database_instance" {
  engine             = "mysql"
  instance_class     = "db.t2.micro"
  allocated_storage  = 20
  username           = "dbuser"
  password           = "dbpassword"
  db_name            = "mydatabase"
  publicly_accessible = false
  # Add any additional configuration for the RDS instance

  tags = {
    Name = "Database Instance"
  }
}



