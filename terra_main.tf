provider "docker" {}

resource "local_file" "abcd" {
  filename = "/root/terraform_folder/file1"
  content  = "this is a terraform file"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_ctr" {
  name  = "ngx-container"
  image = docker_image.nginx.id

  ports {
    internal = 80
    external = 80
  }
}


