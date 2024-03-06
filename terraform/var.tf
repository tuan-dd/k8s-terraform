

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "disk_size_gb" {
  type = number
}
variable "locations" {
  type = list(string)
}
variable "region" {}
variable "project_id" {}
variable "machine_type" {}
variable "num_nodes" {
  type = number
}
variable "disk_type" {}
