module "vnet_module_terraform" {
  source = "./modules/vnet"
  # requeridos
  location           = var.location
  vnet_address_space = var.vnet_address_space
  prefix_name        = var.prefix_name
  # opcionales
  project_name = "tf-project"
  environment  = var.environment
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.prefix_name}-${var.environment}-subnet1"
  resource_group_name  = module.vnet_module_terraform.resource_group_name
  virtual_network_name = module.vnet_module_terraform.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "terraform_nsg" {
  name                = "${var.prefix_name}-${var.environment}-nsg"
  location            = var.location
  resource_group_name = module.vnet_module_terraform.resource_group_name
  # tags = {
  #   environment = "Production"
  # }
}

resource "azurerm_network_security_rule" "terraform_nsg_rule_ssh_inbound" {
  name                        = "allow-ssh-inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.allowed_cidr
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}

resource "azurerm_network_security_rule" "terraform_nsg_rule_http_inbound" {
  name                        = "allow-http-inbound"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = var.allowed_cidr
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}

resource "azurerm_network_security_rule" "terraform_nsg_rule_https_inbound" {
  name                        = "allow-https-inbound"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.allowed_cidr
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}

resource "azurerm_public_ip" "terraform_public_ip" {
  name                = "${var.prefix_name}-${var.environment}-public-ip"
  resource_group_name = module.vnet_module_terraform.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.sku

  # tags = {
  #   environment = "Production"
  # }
}

resource "azurerm_network_interface" "terraform_nic" {
  name                = "${var.prefix_name}-${var.environment}-nic"
  location            = var.location
  resource_group_name = module.vnet_module_terraform.resource_group_name

  ip_configuration {
    name                          = "${var.prefix_name}-${var.environment}-nci-ip"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "terraform_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.terraform_nic.id
  network_security_group_id = azurerm_network_security_group.terraform_nsg.id
}

resource "azurerm_virtual_machine" "terraform_vm" {
  name                  = "${var.prefix_name}-${var.environment}-vm"
  location              = var.location
  resource_group_name   = module.vnet_module_terraform.resource_group_name
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix_name}-${var.environment}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "dsalinas"
    admin_password = "Dsalinas@dss!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  # tags = {
  #   environment = "staging"
  # }
}
