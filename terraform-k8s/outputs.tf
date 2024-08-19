output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "tuan-learn-k8s-terafrom"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "Tuan Host"
}
