# ECS Threat Composer

## Objective

Build, containerise and deploy an application using Docker, Terraform, and ECS, with HTTPS and a custom domain.Demonstarting a production workflow

## Project Overview

This project involves containerising Threat Composer, a React-based threat modelling application, and deploying it to AWS ECS Fargate.

I used a multi-stage Dockerfile to build the application and NGINX to serve the static files, handle React routing and provide a `/health` endpoint.

The container image was pushed to Amazon ECR and deployed using ECS Fargate, an Application Load Balancer, Route 53 and ACM for HTTPS.

I first built the infrastructure manually using the AWS Console before recreating it with Terraform and automating deployments using GitHub Actions.

**Application:** https://tm.rginfralabs.co.uk

**Build documentation:** [BUILD.md](BUILD.md)

