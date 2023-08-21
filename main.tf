resource "google_compute_instance" "whizlabs" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.instance_zone
  tags         = ["http-server"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = var.disk_size
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata_startup_script = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
echo 'Hello from Whizlabs' | sudo tee /var/www/html/index.html
sudo service apache2 start
EOF
}

resource "google_compute_firewall" "http-server" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
