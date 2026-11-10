# Trust policy restricts authentication to GitHub Actions
data "aws_iam_policy_document" "github_ecr_trust" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:Wutang-Dev@256145436/ecs-threat-composer@1445455249:ref:refs/heads/main"]
    }
  }
}
resource "aws_iam_role" "github_ecr" {
  name               = "github-actions-ecr-push"
  assume_role_policy = data.aws_iam_policy_document.github_ecr_trust.json
  tags = {
    project    = "ecs-threat-composer"
    managed_by = "terraform"
    purpose    = "GitHub-Actions-OIDC"
  }
}

data "aws_iam_policy_document" "github_ecr_permissions" {
  statement {
    sid       = "ECRAuthentication"
    effect    = "Allow"
    actions   = ["ecr:GetAuthorizationToken"]
    resources = ["*"]
  }
  statement {
    sid    = "ECRPermissions"
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:InitiateLayerUpload",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
      "ecr:BatchGetImage",
    ]
    resources = ["arn:aws:ecr:eu-north-1:345471468677:repository/threat-composer"]
  }
}
resource "aws_iam_role_policy" "github_ecr_push" {
  name = "github-actions-ecr-push-policy"

  role   = aws_iam_role.github_ecr.id
  policy = data.aws_iam_policy_document.github_ecr_permissions.json
}