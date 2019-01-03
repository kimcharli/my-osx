## From
- https://github.com/kimcharli/terraform-provider-aws/tree/master/examples/two-tier

```bash
git clone --depth=1 https://github.com/kimcharli/terraform-provider-aws.git /tmp/terraform-example
cp -r /tmp/terraform-example/examples/two-tier .
rm -f /tmp/terraform-example
cd two-tier/
#set key_name and public_key_path in variables.tf
terraform init
terraform plan
terraform apply

```

```bash
curl seoul.pslab.link

```

TODO: add ELB to Route53




