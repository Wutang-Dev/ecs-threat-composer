# ECS Threat Composer

## Objective

Build, containerise and deploy an application using Docker, Terraform, and ECS, with HTTPS and a custom domain.Demonstarting a production workflow

## Project Overview

This project involves containerising Threat Composer, a React-based threat modelling application, and deploying it to AWS ECS Fargate.

I used a multi-stage Dockerfile to build the application and NGINX to serve the static files, handle React routing and provide a `/health` endpoint.

The container image was pushed to Amazon ECR and deployed using ECS Fargate, an Application Load Balancer, Route 53 and ACM for HTTPS.

I first built the infrastructure manually using the AWS Console before recreating it with Terraform and automating deployments using GitHub Actions.

### Terraform Networking

I used Terraform to recreate the AWS networking infrastructure I initially built manually using the AWS Console.

I created a custom VPC (`10.0.0.0/16`) with three public and three private subnets across three Availability Zones.

I configured an Internet Gateway, public route tables, a NAT Gateway with an Elastic IP, and private routing to provide outbound internet access.

I organised the configuration into a reusable VPC module using variables and outputs, allowing me to manage and deploy the networking infrastructure consistently through Infrastructure as Code (IaC).

**Application:** https://tm.rginfralabs.co.uk

**Build documentation showing how I built the project:** [BUILD.md](BUILD.md) - in order of how I tackled the project from deploying locally to building in the AWS Console 

