# ECS Threat Composer

## Objective

Build, containerise and deploy an application using Docker, Terraform, and ECS, with HTTPS and a custom domain – exactly like a real production workload.

## Building the Project

I first setup the app locally on my machine and containerised the app using Docker.


![Docker Container Running](Images/1-docker-container-running.png)


![Docker Health](Images/2-docker-health.png)


![Local Build](Images/3-local-build.png)

I then pushed the built image to both AWS and Docker.


![Authenticate Docker with AWS ECR](Images/5-authenticate-docker-with-aws-ecr.png)


![Pushed to AWS ECR](Images/6-pushed-to-aws-ecr.png)


![ECR Verify AWS](Images/7-ecr-verify-aws.png)


![Pushed To Docker Hub](Images/7-puhed-to-docker-hub.png)


![Verify Docker Hub](Images/8-verify-docker-hub.png)


I then built the AWS infrastructure. Before moving onto Terraform, I built in the AWS Console to understand what I am building.

### Create an ECR repository
![ECR Repository](Images/4-ECR-Create.png)

### Create an ECS Cluster

![ECS Cluster Create](Images/9-ecs-cluster-create.png)

### Create a Task Definition for My Container

![AWS Task Definition](Images/10-aws-task-definition.png)

### Create VPC

| Setting | Value |
|---|---|
| Name tag auto-generation | threat-composer |
| IPv4 CIDR block | 10.0.0.0/16 |
| IPv6 CIDR block | No IPv6 |
| Tenancy | Default |
| Number of Availability Zones | 2 |
| Number of public subnets | 2 |
| Number of private subnets | 2 |
| NAT gateways | 1 in 1 AZ |
| VPC endpoints | None for now |
| DNS hostnames | Enabled |
| DNS resolution | Enabled |

![AWS VPC](Images/11-vpc.png)


![AWS Public Routing](Images/12-public%20routing.png)


![AWS Private Routing](Images/13-private-routing.png)