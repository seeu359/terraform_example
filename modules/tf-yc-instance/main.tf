resource "yandex_compute_instance" "vm-1" {
	name = "virtual-machine-by-terraform"
	zone = var.zone
	platform_id = var.platform_id

	resources {
		cores = var.cores
		memory = var.memory
	}

	boot_disk {
		initialize_params {
		image_id = var.image_id
		}
	}
	
	scheduling_policy {
		preemptible = false
	}

	network_interface {
	subnet_id = var.subnet_id
	nat = true
	nat_ip_address = var.nat_ip_address
	}

	metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }

}

