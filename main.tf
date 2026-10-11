resource "google_scc_v2_project_scc_big_query_export" "scc_v2_project_scc_big_query_exports" {
  for_each = var.scc_v2_project_scc_big_query_exports

  big_query_export_id = each.value.big_query_export_id
  dataset             = each.value.dataset
  deletion_policy     = each.value.deletion_policy
  description         = each.value.description
  filter              = each.value.filter
  location            = each.value.location
  project             = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

