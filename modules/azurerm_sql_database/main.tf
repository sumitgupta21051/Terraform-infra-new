resource "azurerm_mssql_database" "example" {
  name         = var.sql_database_name
  server_id    = var.sql_server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = var.maxsize
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = var.tags
  }