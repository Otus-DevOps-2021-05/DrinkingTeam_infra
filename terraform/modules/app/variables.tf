variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnet id"
}
