# bitcoin-testnet-terraform-ansible
Terraform and Ansible to provision a Bitcoin Testnet on AWS

## Walkthrough

Build the image with Packer:

```bash
cd packer
packer validate packer.json
packer build packer.json
cd ..
```

Now our AMI should be visible in our AWS account. Use Terraform to provision our EC2 instance from that AMI:

```bash
terraform -chdir=./terraform init
terraform -chdir=./terraform plan
terraform -chdir=./terraform apply
```