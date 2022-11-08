data "aws_iam_policy_document" "lambda" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "lambda_role" {
  count              = var.enabled ? 1 : 0
  name               = "lambda-${var.prefix}-hello-world"
  assume_role_policy = data.aws_iam_policy_document.lambda.json
}
