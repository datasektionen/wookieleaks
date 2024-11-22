job "wookieleaks" {
  type = "service"

  group "wookieleaks" {
    network {
      port "http" {
        to = 3000
      }
    }

    service {
      name     = "wookieleaks"
      port     = "http"
      provider = "nomad"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.wookieleaks.rule=Host(`wookieleaks.org`)||Host(`www.wookieleaks.org`)",
        "traefik.http.routers.wookieleaks.tls.certresolver=default",
      ]
    }

    task "wookieleaks" {
      driver = "docker"

      config {
        image = var.image_tag
        ports = ["http"]
      }

      resources {
        memory = 50
      }
    }
  }
}

variable "image_tag" {
  type = string
  default = "ghcr.io/datasektionen/wookieleaks:latest"
}
