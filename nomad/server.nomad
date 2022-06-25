job "webserver" {
  datacenters = ["dc1"]
  type = "service"

  group "webs" {
    count = 3

    network {
      port "http" {
      	to = 5000
      }
    }

    service {
      port = "http"
      tags = ["urlprefix-/"]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "frontend" {
      driver = "docker"

      config {
        image = "rohitkarthik/docker_flask:${var.IMAGE_TAG}"
        ports = ["http"]
        force_pull = true
      }

      resources {
        cpu    = 300 # MHz
        memory = 64 # MB
      }
    }
  }
}





