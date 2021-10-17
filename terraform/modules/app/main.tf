resource "yandex_compute_instance" "app" {
  name = "reddit-app"
  zone = var.zone
  allow_stopping_for_update = true

  resources {
    cores         = 2
    core_fraction = 5
    memory        = 1
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
    ip_address = "192.168.10.11"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.connection_key_file)
  }

#  provisioner "file" {
#    source      = "../modules/app/files/puma.service"
#    destination = "/tmp/puma.service"
#  }

#  provisioner "remote-exec" {
#    script = "../modules/app/files/deploy.sh"
#  }
}
