terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01529579RG"
    storage_account_name = "tfstaten01529579sa"
    container_name       = "tfstatefiles"
    //key = "tfstate"
    key = "zgl5vqIZh2RbvUpWtjG0caJ917XnMcdbcujKF+hrDiSU4f7vy0OH1KdopAQWjN/3szKKPz0r8UZm+AStF8XSfQ=="
  }
}