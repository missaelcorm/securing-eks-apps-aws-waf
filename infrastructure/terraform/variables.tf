variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "eks-waf"
}

variable "eks_webacl_name" {
  description = "WebACL Name for EKS"
  type = string
  default = "managed-webacl-eks"
}