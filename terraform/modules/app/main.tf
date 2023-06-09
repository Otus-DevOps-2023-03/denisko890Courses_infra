#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "0.92.0"
#    }
#  }
#}
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key)
  }
  provisioner "file" {
    #content = templatefile("../modules/app/files/puma.service", {
    #  "database_url" = var.db_address
    #})
    source      = "puma.service"
    destination = "/home/ubuntu/puma.service"
  }
  provisioner "remote-exec" {
    script = "../modules/app/files/deploy.sh"
  }
}
