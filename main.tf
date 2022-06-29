module "rgroup" {
  source   = "./modules/rgroup"
  location = "Australia East"
  rg_name  = "9579-assigment1-RG"
}

module "network" {
  source                = "./modules/network"
  resource_group        = module.rgroup.rg.name
  location              = module.rgroup.rg.location
  network-vnet          = "9579-assigment1-vnet"
  network-vnet_space    = ["10.0.0.0/16"]
  network-subnet1       = "9579-assigment1-subnet"
  network-subnet1_space = ["10.0.1.0/24"]
  network-nsg1          = "9579-assigment1-nsg"
}

module "common" {
  source               = "./modules/common"
  resource_group       = module.rgroup.rg.name
  location             = module.rgroup.rg.location
  workspace_name       = "9579-assigment1-workspace"
  recovery_name        = "a1-9579-recovery-vault"
  storage_account_name = "9579a1sa"
}

module "vmlinux" {
  source            = "./modules/vmlinux"
  resource_group    = module.rgroup.rg.name
  location          = module.rgroup.rg.location
  nb_count          = 2
  subnet1_id        = module.network.subnet1_id
  linux_name        = "a1-9579-linux-vm"
  avs_name          = "linux-avs"
  blob_endpoint     = module.common.primary_blob_endpoint
  vm_extension_name = "network-watcher"
  depends_on = [
    module.network
  ]
}

module "vmwindows" {
  source           = "./modules/vmwindows"
  resource_group   = module.rgroup.rg.name
  location         = module.rgroup.rg.location
  subnet1_id       = module.network.subnet1_id
  windows_avs_name = "windows_avs"
  windows_name = {
    a1-win-vm = "Standard_B1s"
  }
  blob_endpoint = module.common.primary_blob_endpoint
  depends_on = [
    module.network
  ]
}

module "datadisk" {
  source         = "./modules/datadisk"
  resource_group = module.rgroup.rg.name
  location       = module.rgroup.rg.location
  vm_id = {
    "linux1"   = module.vmlinux.linux_id[0][0]
    "linux2"   = module.vmlinux.linux_id[0][1]
    "windows1" = module.vmwindows.windows_id[0][0]
  }
}

module "loadbalancer" {
  source         = "./modules/loadbalancer"
  resource_group = module.rgroup.rg.name
  location       = module.rgroup.rg.location
  subnet1_id     = module.network.subnet1_id
  lb_name        = "9579-a1-lb"
  nic_id1 = module.vmlinux.linux_nic_id[0][0]
  nic_id2 = module.vmlinux.linux_nic_id[0][1]
}

module "database" {
  source         = "./modules/database"
  resource_group = module.rgroup.rg.name
  location       = module.rgroup.rg.location
  sqlserver_name = "9579-a1-sqlserver"
  sqldb_name = "sqldb"
}
