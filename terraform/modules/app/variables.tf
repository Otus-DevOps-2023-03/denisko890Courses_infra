variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
variable "private_key" {
  description = "Private key for connect to VM"
}
variable "db_address" {
  description = "Database IP address"
}
