
module "azure_res_groups" {
  source = "github.com/queone/tfaz//modules/res-groups"
  # source = "../../modules/res-groups"  # Or this, to develop against the local copy
  res_groups = var.res_groups
}
