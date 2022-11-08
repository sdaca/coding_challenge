terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    archive = "~> 2.0"
  }
}

locals {
  zip_package = "${path.module}/share/build/hello-world.zip"
  source_dir  = "${path.module}/share/src/"
}

data "archive_file" "archive" {
  type             = "zip"
  output_file_mode = "0777" # necessary to get same checksum on Windows and Linux
  output_path      = local.zip_package
  source_dir       = local.source_dir
}


resource "aws_lambda_function" "function" {
  count = var.enabled ? 1 : 0

  filename         = local.zip_package
  source_code_hash = data.archive_file.archive.output_base64sha256

  function_name = "${var.prefix}_hello_world"

  runtime = "python3.9"
  handler = "lambda_function.lambda_handler"
  role    = aws_iam_role.lambda_role.arn
}
