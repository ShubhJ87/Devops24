terraform {
    required_version = ">=1.0.0"
    required_providers {
      azurerm = {
        source= "hashicorp/azurerm" 
        version = ">=1.0.0"
        
      }
    }

/*
    backend "azurerm" {
      resource_group_name = "AZ-104"
      storage_account_name = "tstorage100"
      container_name = "tfstatefiles"
      key = "tfStatecommand.tfstate"
      
    }
}
*/
}
provider "azurerm" {
  features {
    
  }
  
}
