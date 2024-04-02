output "azurerg_name" {
  description = "name of resource group"
  value = azurerm_resource_group.rg_name.name
}

output "app_service_name" {
  description = "name of app service"
  value = azurerm_service_plan.appservice.name
}

output "app_service_url" {
    description = "url of app service"
    //value = "${azurerm_service_plan}.azurewebsites.net"
    value = "${azurerm_windows_web_app.webapp.name}.azurewebsites.net"
}