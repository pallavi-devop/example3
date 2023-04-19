terraform {
  backend "s3" {
    bucket                  = "terraform-state-tfbackup"
    key                     = "tf-backup-state"
    region                  = "us-east-2"
    shared_credentials_file = "C:/Users/gnsad/.aws/credentials"
  }

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
  }



  # required_providers {
  #   docker = {
  #     source  = "kreuzwerker/docker"
  #     version = ">= 2.13.0"
  #   }
  # }
}

# provider "docker" {
#   host = "npipe:////.//pipe//docker_engine"
# }

# resource "docker_image" "nginx" {
#   name         = "nginx:latest"
#   keep_locally = false
# }

# resource "docker_container" "nginx" {
#   image = docker_image.nginx.latest
#   name  = "tf-docker-nginx"
#   ports {
#     internal = 80
#     external = 8000
#   }
# }


resource "null_resource" "fake1" {
  count = 10
}
