# create the CosmosDB for Mangoose 

# Create a Cosmos DB account for MongoDB API on serverless free tier
# resource "azurerm_cosmosdb_account" "cosmosdb" {
#   name                = "mustafa-web-services007"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   offer_type                = "Standard"
#   kind                      = "MongoDB"
#   enable_free_tier          = true
#   enable_automatic_failover = false

#   consistency_policy {
#     consistency_level = "Session"
#   }

#   capabilities {
#     name = "EnableMongo"
#   }
#   geo_location {
#     location          = var.RG-location
#     failover_priority = 0
#   }
# }
# resource "azurerm_cosmosdb_mongo_database" "mongo-db" {
#   name                = "mymangofor007"
#   resource_group_name = azurerm_resource_group.rg.name
#   account_name        = "mustafa-web-services007"
#   throughput          = 400
# }

# resource "azurerm_private_dns_zone" "cosmosdb_zone" {
#   name                = "privatelink.cosmosdb.azure.com"
#   resource_group_name = azurerm_resource_group.rg.name
#   tags = {
#     Environment = var.env
#     Application = var.app
#   }
#   registration_virtual_network_ids = [azurerm_virtual_network.vnet.id]
# }

# resource "azurerm_private_endpoint" "cosmosdb_endpoint" {
#   name                = "cosmosdb-endpoint"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   subnet_id                     = azurerm_subnet.subnet04.id
#   private_service_connection_id = azurerm_cosmosdb_account.cosmosdb.id
#   private_dns_zone_group_id     = azurerm_private_dns_zone_group.cosmosdb_group.id

#   custom_dns_configs {
#     name = "cosmosdb-custom-dns"
#     etag = azurerm_private_dns_zone.cosmosdb_zone.etag
#     fqdn = "privatelink.cosmosdb.azure.com"
#     ip_addresses = [
#       azurerm_cosmosdb_account.cosmosdb.private_endpoint_connections[0].private_ip_address
#     ]
#   }

#   tags = {
#     Environment = var.env
#     Application = var.app
#   }
# }
# resource "azurerm_private_dns_zone_group" "cosmosdb_group" {
#   name                = "cosmosdb-zone-group"
#   resource_group_name = azurerm_resource_group.rg.name
#   tags = {
#     Environment = var.env
#     Application = var.app
#   }
#   private_dns_zone_ids = [azurerm_private_dns_zone.cosmosdb_zone.id]
# }
