resource "azurerm_resource_group" "rg_name" {
  name = "${var.rg_name}-${terraform.workspace}"
  location = var.rg_location
}


///create azure web apps
//First create app service 
//Then we have to web app


resource "azurerm_service_plan" "appservice" {
  name = var.app_service_name
  resource_group_name = azurerm_resource_group.rg_name.name
  location = azurerm_resource_group.rg_name.location
  os_type = "Windows"
  sku_name = "S1"
  depends_on = [ azurerm_resource_group.rg_name ]
}

resource "azurerm_windows_web_app" "webapp" {
    name = var.web_app_name
    service_plan_id = azurerm_service_plan.appservice.id
    resource_group_name = azurerm_resource_group.rg_name.name
    location = azurerm_resource_group.rg_name.location
    site_config {
      application_stack {
        current_stack = "dotnet"
        dotnet_version = "v6.0"
      }
    }
}

resource "azurerm_app_service_source_control" "azurerm_source" {
  app_id = azurerm_windows_web_app.webapp.id
  repo_url = "https://github.com/ShubhJ87/Terraformnet.git"
  branch = "master"
  use_manual_integration = true
  
}