resource "cargoship_cluster" "prod" {
  name          = "prod-cluster"
  load_balancer = "10.0.0.10"
  package       = "/srv/staging/k3s-v1.33.4.tar.zst"

  profiles = {
    control = {
      node_labels = { "purpose-control" = "true" }
      ports       = [{ port = "6443" }]
      concurrency = "1"
    }
    worker = {
      node_labels = { "purpose-worker" = "true" }
    }
  }

  values = yamlencode({
    addons = {
      disabled = ["traefik"]
    }
  })

  hosts = {
    controller1 = {
      address  = "10.0.0.11"
      role     = "controller"
      key_path = "~/.ssh/id_ed25519"
      profile  = "control"
    }

    worker1 = {
      address  = "10.0.0.21"
      role     = "worker"
      key_path = "~/.ssh/id_ed25519"
      profile  = "worker"
    }
  }
}
