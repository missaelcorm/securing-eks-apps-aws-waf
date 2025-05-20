output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "waf_webacl_arn" {
  description = "WAF WebACL ARN"
  value = aws_wafv2_web_acl.eks.arn
}

output "ssm_waf_webacl" {
  description = "SSM Parameter of WAF WebACL ARN"
  value = module.ssm_waf_webacl_arn.ssm_parameter_name
}