resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlname
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  tags = var.tags
}

