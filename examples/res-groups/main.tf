
module "azure_res_groups" {
  # source     = "github.com/queone/tfaz//modules/res-groups"
  source     = "../../modules/res-groups"  # For local dev
  res_groups = var.res_groups
}
