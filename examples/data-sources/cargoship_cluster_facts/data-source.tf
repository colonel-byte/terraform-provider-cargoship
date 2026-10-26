data "cargoship_cluster_facts" "fleet" {
  name          = "fleet-facts"
  load_balancer = "10.0.0.10"
  distro        = "k3s"

  host {
    address  = "10.0.0.11"
    role     = "controller"
    key_path = "~/.ssh/id_ed25519"
  }
}

output "installed_versions" {
  value = { for n in data.cargoship_cluster_facts.fleet.nodes : n.hostname => n.engine_version }
}
