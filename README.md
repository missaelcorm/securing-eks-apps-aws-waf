# securing-eks-apps-aws-waf

```shell
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-west-2
```

```shell
aws eks update-kubeconfig --name $(terraform output cluster_name)
```

## Resources
- https://github.com/0leksei/k8s-owasp-juice-shop