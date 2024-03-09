
module "azure_dns_zones" {
  source = "github.com/queone/tfaz//modules/dns-zones"
  # source = "../../modules/dns-zones"  # Or this, to develop against the local copy
  dns_zones = var.dns_zones
}
