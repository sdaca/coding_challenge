data "aws_iam_policy_document" "lambda_exec_role_policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}

resource "aws_iam_role_policy" "lambda_exec_role" {
  count = var.enabled ? 1 : 0

  role   = aws_iam_role.lambda_role[0].id
  policy = data.aws_iam_policy_document.lambda_exec_role_policy.json
}

resource "aws_cloudwatch_log_group" "loggroup" {
  count = var.enabled ? 1 : 0

  name              = "/aws/lambda/${aws_lambda_function.function[0].function_name}"
  retention_in_days = 14
}
