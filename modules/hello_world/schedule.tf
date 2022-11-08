resource "aws_cloudwatch_event_rule" "lambda_cron" {
  count = var.enabled ? 1 : 0

  name                = "${var.prefix}_hello_world"
  schedule_expression = "rate(${var.trigger_rate} minutes)"
}

resource "aws_cloudwatch_event_target" "cron" {
  count = var.enabled ? 1 : 0

  rule      = aws_cloudwatch_event_rule.lambda_cron[0].name
  target_id = "${var.prefix}_hello_world"
  arn       = aws_lambda_function.function[0].arn
}

resource "aws_lambda_permission" "allow_execution_from_cloudwatch" {
  count = var.enabled ? 1 : 0

  statement_id  = "AllowExecutionFromCloudWatch_${var.prefix}_${aws_lambda_function.function[0].function_name}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function[0].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_cron[0].arn
}
