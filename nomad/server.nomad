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
        image = "rohitkarthik/docker_flask"
        ports = ["http"]
      }

      resources {
        cpu    = 300 # MHz
        memory = 64 # MB
      }
    }
  }
}




