module "azure_dns_zones" {
  source    = "github.com/queone/tfaz//modules/dns-zones"
  #version   = "0.1.0"
  # Or this instead, if you want to develop against the local copy
  #source    = "../../dns-zones"
  dns_zones = var.dns_zones
}
