output "subnets" {
        value = data.yandex_vpc_subnet.default
}

output "network" {
        value = data.yandex_vpc_network.default
}

output "ip_address" {
	value = yandex_vpc_address.addr.external_ipv4_address[0].address
}
