variable "cores" {
	default = 2
	type = number
}

variable "memory" {
	default = 2
	type = number
}

variable "platform_id" {
	default = "standard-v1"
	type = string
}

variable "nat_ip_address" {
  type        = string
  description = "External IP address for the instance"
}

variable "zone" {
	default = "ru-central1-a"
	type = string
	description = "Yandex zone name or id"
	nullable = false
	sensitive = false
}

variable "image_id" {
	type = string
	description = "Yandex OS image id"
	nullable = false
	sensitive = true
}

variable "subnet_id" {
	type = string
	description = "Yandex subnet id"
	nullable = false
	sensitive = true
}

