# from Hashicorp's getting started with AWS tutorial
# Terraform settings
terraform {
  required_providers { # find providers here: https://registry.terraform.io/browse/providers
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Provider specific settings

provider "aws" { # configures the specified provider
  profile = "default"
  region  = "us-west-2"
}

# Resource definitions
## can be physical/virtual component (ie instance) or logical resource (ie application)
resource "aws_instance" "app_server" { # resource blocks are named by combining the resource type and resource name specified here, this resource will be named aws_instance.app_server
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    # Name = "ExampleAppServerInstance"
    Name = var.instance_name # can now provide a -var "Name" to the apply command and customize the resource name
  }
}
