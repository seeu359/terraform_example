terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }
}

provider "yandex" {
  cloud_id  = "b1gnqbomaqd1rv0kkfs0"
  folder_id = "b1g6bjj2kgbqj80futhr"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_address" "addr" {
	name = "ext_addr"
	external_ipv4_address {
		zone_id = "ru-central1-a"
	}
}


resource "yandex_compute_instance" "vm-1" {
	name = "virtual-machine-by-terraform"

	resources {
		cores = 2
		memory = 2
	}

	boot_disk {
		initialize_params {
		image_id = "fd8tvc3529h2cpjvpkr5"
		}
	}

	network_interface {
	subnet_id = "e9bbs7rge5mi7b7ua41k"
	nat = true
	nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
	}

	metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }

}

output "ip_address" {
    value = yandex_vpc_address.addr.external_ipv4_address[0].address
} 
