variable "cloud_id" {
	type = string
	description = "Yandex cloud id"
	nullable = false
	sensitive = true
}

variable "folder_id" {
	type = string
	description = "Yandex folder id"
	nullable = false
	sensitive = true
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

