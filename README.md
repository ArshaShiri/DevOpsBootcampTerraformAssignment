# DevOps Bootcamp Terraform Assignment

Your K8s cluster on AWS is successfully running and used as a production environment. Your team wants to have additional K8s environments for development, test and staging with the same exact configuration and setup, so they can properly test and try out new features before releasing to production. So you must create 3 more EKS clusters.

But you don't want to do that manually 3 times, so you decide it would be much more efficient to script creating the EKS cluster and execute that same script 3 times to create 3 more identical environments.



## EXERCISE 1: Create Terraform project to spin up EKS cluster
Create a Terraform project that spins up an EKS cluster with the exact same setup that you created in the previous exercise, for the same Java Gradle application:

* Create EKS cluster with 3 Nodes and 1 Fargate profile only for your java application
* Deploy Mysql with 3 replicas with volumes for data persistence using helm

**Solution:**

All the necessary files are added.