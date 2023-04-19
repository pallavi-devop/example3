#Running a nginx docker container using terraform
Install Docker 
Start service 
using cmd #systemctl start docker
Running nginx container

Steps:
Create a directory named terraform-docker-container mkdir terraform-docker-container
Navigate to the created folder cd terraform-docker-container
Now, create a file main.tf


terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

Initialize the project, which downloads a plugin that allows Terraform to interact with Docker terraform init
 $ terraform init 
 
Provision the NGINX server container with apply. When Terraform asks you to confirm type yes and press ENTER. terraform apply
 $ terraform apply 
 
Verify the existence of the NGINX container by visiting http://localhost:8000 in your web browser or running docker ps to see the container.
 $ docker ps 
 
To stop the container, run terraform destroy terraform destroy
 $ terraform destroy
 
