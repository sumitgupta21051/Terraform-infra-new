locals {
  common_tags = {
    project     = "todo-app"
    managedby   = "terraform"
    environment = "dev"
  }
}
module "rg" {
  source              = "../../modules/azurerm_resource-group"
  resource_group_name = "todo-app"
  location            = "East US"
  tags                = local.common_tags
}

module "acr" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_registry_container"
  acr_name   = "acrdevtodoapp"
  rg_name    = "todo-app"
  location   = "East US"
  tags       = local.common_tags
}

module "sqlsever" {
  depends_on     = [module.rg]
  source         = "../../modules/azurerm_sql_srver"
  sqlname        = "sqlserverdevtodoapp"
  rg_name        = "todo-app"
  location       = "East US"
  admin_username = "sqladminuser"
  admin_password = "P@ssword1234"
  tags           = local.common_tags

}

module "sqlDB" {
  depends_on        = [module.sqlsever]
  source            = "../../modules/azurerm_sql_database"
  sql_database_name = "sqldbdevtodoapp"
  sql_server_id     = module.sqlsever.id
  maxsize           = "2"
  tags              = local.common_tags

}

module "aks" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_kubernetes_cluster"
  k8s_name   = "aks-dev-todoapp"
  location   = "East US"
  tags       = local.common_tags
  rg_name    = "todo-app"
  dns_prefix = "aks-dev-todoapp"

}

