data "google_container_engine_versions" "gke_version" {
  location       = var.region
  version_prefix = "1.27."
}

resource "google_container_cluster" "primary" {
  name           = "teraform-gke-gcp"
  location       = var.region
  node_locations = var.locations


  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 2

  network             = google_compute_network.vpc.name
  subnetwork          = google_compute_subnetwork.subnet.name
  deletion_protection = false
}


resource "google_container_node_pool" "primary_nodes" {
  name     = "tuan-learn-all"
  location = var.region
  cluster  = google_container_cluster.primary.name

  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]

  node_count     = var.num_nodes
  node_locations = var.locations

  node_config {
    # preemptible  = true
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    labels = {
      env = var.project_id
    }

    # type info machine
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb
    machine_type = var.machine_type
    spot         = true


    tags = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
      enviroment               = "dev"
    }
  }
}

