output "aws_region" {
  description = "current AWS region"
  value       = data.aws_region.current.name
}
