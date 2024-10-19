resource "yandex_mdb_postgresql_cluster" "pg_cluster" {
  name        = "db_cluster"
  environment = "PRESTABLE"
  network_id  = var.network_id

  config {
    version = 15
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 16
    }
  }

  host {
    zone      = var.zone 
    subnet_id = var.subnet_id
  }
}

resource "yandex_mdb_postgresql_user" "pg_user" {
  cluster_id = yandex_mdb_postgresql_cluster.pg_cluster.id
  name       = var.pg_name
  password   = var.pg_password
}

resource "yandex_mdb_postgresql_database" "pg_database" {
  cluster_id = yandex_mdb_postgresql_cluster.pg_cluster.id
  name       = "testdb"
  owner      = var.pg_name
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"
  extension {
    name = "uuid-ossp"
  }
  extension {
    name = "xml2"
  }
}


