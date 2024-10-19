module "tf-yc-network" {
	source = "./modules/tf-yc-network"
	zone = var.zone
}

module "tf-yc-database" {
	source = "./modules/tf-yc-database"
	subnet_id = module.tf-yc-network.subnets[var.zone].subnet_id
	network_id = module.tf-yc-network.network.network_id
}


module "tf-yc-instance" {
	source = "./modules/tf-yc-instance"
	nat_ip_address = module.tf-yc-network.ip_address
	subnet_id = module.tf-yc-network.subnets[var.zone].subnet_id
	image_id = var.image_id
	zone = var.zone
	# В последних четырех строчках мы передаем переменные из корневого модуля в дочерний
}

output "data" {
	value = module.tf-yc-network.network
}

