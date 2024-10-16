resource "yandex_vpc_address" "addr" {
	name = "ext_addr"
	external_ipv4_address {
		zone_id = "ru-central1-a"
	}
}

module "tf-yc-instance" {
	source = "./modules/tf-yc-instance"
	nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
	subnet_id = var.subnet_id
	image_id = var.image_id
	zone = var.zone
	# В последних четырех строчках мы передаем переменные из корневого модуля в дочерний
}

