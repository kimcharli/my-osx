
// https://www.terraform.io/docs/providers/docker/index.html
provider "docker" {
//  host = "tcp://docker:2345/"
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}

resource "docker_container" "nginx-server" {
  count = 2
  name = "nginx-server-${count.index+1}"
  image = docker_image.nginx.latest
  ports {
    internal = 80
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    // should be absolute path
    host_path = "/Users/ckim/PycharmProjects/my-osx/terraform/nginx-test/www"
    read_only = true
  }
}
