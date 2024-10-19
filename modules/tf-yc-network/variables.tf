variable "network_zones" {
	type = set(string)
	default = ["ru-central1-b", "ru-central1-a", "ru-central1-d"]
}

variable "zone" {
	default = "ru-central1-a"
	type = string
	description = "Yandex zone name or id"
	nullable = false
	sensitive = false
}

