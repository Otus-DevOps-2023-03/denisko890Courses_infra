terraform {

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "otus-courses-storage"
    region     = "ru-central1"
    key        = "prod/terraform.tfstate"
    access_key = "access_key"
    secret_key = "secret_key"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
