provider "aws" {
  region = "us-east-2"
}

terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version =  "~>4"
    }
  }

  required_version = "~> 1.0"
}
