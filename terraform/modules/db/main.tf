resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  zone = var.zone
  allow_stopping_for_update = true

  resources {
    cores         = 2
    core_fraction = 5
    memory        = 1
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
    ip_address = "192.168.10.12"
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
