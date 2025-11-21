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
  source_address_prefix       = "*"
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
  source_address_prefix       = "*"
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
  source_address_prefix       = "*"
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
