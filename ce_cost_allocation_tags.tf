resource "aws_ce_cost_allocation_tag" "this" {
  for_each = toset(var.list_ce_cost_allocation_tags)

  tag_key = each.value
  status = "Active"
}