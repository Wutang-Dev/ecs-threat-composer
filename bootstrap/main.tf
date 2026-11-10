# aws iam openid connect provider
resource "aws_iam_openid_connect_provider" "this" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  tags = {
    project    = "ecs-threat-composer"
    managed_by = "terraform"
    purpose    = "GitHub-Actions-OIDC"
  }
}