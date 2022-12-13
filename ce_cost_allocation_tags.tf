# resource "aws_ce_cost_allocation_tag" "this" {
#   count = length(var.list_ce_cost_allocation_tags)

#   tag_key = var.list_ce_cost_allocation_tags[count.index]
#   status = "Active"
# }

resource "aws_ce_cost_allocation_tag" "this" {
  for_each = toset(var.list_ce_cost_allocation_tags)

  tag_key = each.value
  status = "Active"
}