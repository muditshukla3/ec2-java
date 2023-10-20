# Introduction

This repo contains terraform script for provisioning ec2 instance in default VPC with java 17 installation.

### Prerequisites
Before running the script please make sure:

* Terraform is installed on the machine.
* AWS_ACESS_KEY and AWS_SECRET_ACCESS_KEY variables are set as environment variables.

### Running the script

Initialize terraform 

```
terraform init
```
Once above command runs without any error, run following command to make sure there are no errors with the script.
```
terraform plan
```
Once the above command works without any error, run the following command to provision the ec2 instance.

```
terraform apply --auto-approve
```
Issue the following command to destroy the ec2 instance.

```
terraform destroy
```

### Overrides

variables.tf file contains the script overrides. Make sure to change the following as per your need

* aws_ec2-ami - AMI id for respective image.
* aws_ec2_connection_key_name - AWS ec2 instance ssh key pair name.
* aws_ec2_instance_type - EC2 instance type

### Java 17 Installation

***server.sh*** file under scripts folder contains the instructions for java 17 installation in EC2 instance. The installation instructions are as per red had linux. Instructions may change depending upon the linux variation.