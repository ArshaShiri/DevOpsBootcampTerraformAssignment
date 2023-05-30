# DevOps Bootcamp Terraform Assignment

Your K8s cluster on AWS is successfully running and used as a production environment. Your team wants to have additional K8s environments for development, test and staging with the same exact configuration and setup, so they can properly test and try out new features before releasing to production. So you must create 3 more EKS clusters.

But you don't want to do that manually 3 times, so you decide it would be much more efficient to script creating the EKS cluster and execute that same script 3 times to create 3 more identical environments.



## EXERCISE 1: Create Terraform project to spin up EKS cluster
Create a Terraform project that spins up an EKS cluster with the exact same setup that you created in the previous exercise, for the same Java Gradle application:

* Create EKS cluster with 3 Nodes and 1 Fargate profile only for your java application
* Deploy Mysql with 3 replicas with volumes for data persistence using helm

**Solution:**

All the necessary files are added.

## EXERCISE 2: Configure remote state
By default, TF stores state locally. You know that this is not practical when working in a team, because each user must make sure they always have the latest state data before running Terraform. To fix that, you

* Configure remote state with a remote data store for your terraform project
You can use e.g. S3 bucket for storage.

**Solution:**
The terraform block under `vpc.tf` is responsible for this.

# EXERCISE 3: CI/CD pipeline for Terraform project
Create a separate Jenkins pipeline for Terraform provisioning the EKS cluster
Similar setup is explained in [DevOpsBootcampTerraformCICD](https://github.com/ArshaShiri/DevOpsBootcampTerraformCICD).
