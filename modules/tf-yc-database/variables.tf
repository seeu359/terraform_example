variable "zone" {
	default = "ru-central1-a"
	type = string
	description = "Yandex zone name or id"
	nullable = false
	sensitive = false
}


variable "subnet_id" {
	type = string
	description = "Yandex subnet id"
	nullable = false
	sensitive = true
}

variable "network_id" {
	type = string
	description = "Yandex network id"
	nullable = false
	sensitive = true
}

variable "pg_name" {
	type = string
	default = "seeu359"
	nullable = false
	sensitive = true
}


variable "pg_password" {
	type = string
	default = "fa2372cd"
	nullable = false
	sensitive = true
}
