data "yandex_vpc_network" "default" {
	name = "default"
}

data "yandex_vpc_subnet" "default" {
	for_each = var.network_zones
	name = "${data.yandex_vpc_network.default.name}-${each.key}"
}

resource "yandex_vpc_address" "addr" {
        name = "ext_addr"
        external_ipv4_address {
                zone_id = var.zone
        }
}

