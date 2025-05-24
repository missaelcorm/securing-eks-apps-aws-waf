# securing-eks-apps-aws-waf

```shell
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-west-2
```

```shell
cd infrastructure/terraform
terraform apply
```

```shell
aws eks update-kubeconfig --name $(terraform output -json cluster_name | jq -r '.')
export waf_webacl_arn=$(terraform output -json waf_webacl_arn | jq -r '.')
```

```shell
cd apps/base
kustomize build . | envsubst | kubectl apply -f -
```

```shell
# Target webgoat ALB ingress
export TARGET=$(kubectl -n webgoat get ingress webgoat-ingress-waf -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
# In container
export WORKFLOW=/templates/workflow.yaml
# From WebACL Rule for bypassing if header is present
export HEADER_WAF_BYPASS="waf-bypass: 746869735f6865616465725f6279706173735f776166" # Set if wanna bypass it, otherwise just omit
docker compose up nuclei-scan
```

## Resources
- https://github.com/WebGoat/WebGoat
- https://github.com/0leksei/k8s-owasp-juice-shop
- https://github.com/projectdiscovery/nuclei
- https://docs.cycubix.com/application-security-series/web-application-security-essentials/solutions