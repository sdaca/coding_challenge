# SDA SE - Coding Challenge

This repository contains the solution for task 2 of SDA's coding challenge.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.38.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hello_world"></a> [hello\_world](#module\_hello\_world) | ./modules/hello_world | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | current AWS region |
<!-- END_TF_DOCS -->

## Contributing (*example*)

Please open a new issue for each bug and feature request. Search for existing issues first and try to explain your
issues as best as you can.

Don't use the issue tracker for support questions.

The following rules must be followed if you wish to contribute:

- the pull request should contain a full explanation of the feature
- before implementing a feature, raise an issue and ask for feedback
- your PR must survive all test as defined in `pre-commit`
- ...

## Releasing (*example*)
- use feature / bugfix branches for development
- merge to `main`-branch
  - needs at least one approvement
- latest tag on `main` is current stable
  - configuration on latest tag must be deployed
  - use CI pipeline to deploy terraform changes to production
 
