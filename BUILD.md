## Building the Project

I first setup the app locally on my machine and containerised the app using Docker.


![Docker Container Running](images/1-docker-container-running.png)


![Docker Health](images/2-docker-health.png)


![Local Build](images/3-local-build.png)

I then pushed the built image to both AWS and Docker.


![Authenticate Docker with AWS ECR](images/5-authenticate-docker-with-aws-ecr.png)


![Pushed to AWS ECR](images/6-pushed-to-aws-ecr.png)


![ECR Verify AWS](images/7-ecr-verify-aws.png)


![Pushed To Docker Hub](./images/images/7-puhed-to-docker-hub.png)


![Verify Docker Hub](images/8-verify-docker-hub.png)


I then built the AWS infrastructure. Before moving onto Terraform, I built in the AWS Console to understand what I am building.

### Create an ECR repository
![ECR Repository](images/4-ECR-Create.png)

### Create an ECS Cluster

![ECS Cluster Create](images/9-ecs-cluster-create.png)

### Create a Task Definition for My Container

![AWS Task Definition](images/10-aws-task-definition.png)

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

![AWS VPC](images/11-vpc.png)


![AWS Public Routing](images/12-public%20routing.png)


![AWS Private Routing](images/13-private-routing.png)

### Create Security Groups

threat composer alb security group inbound rules 

![threat-composer-alb-sg](images/14-sg-alb-inbound.png)

threat composer ecs security group inbound rules

![threat-composer-ecs-sg](images/15-sg-threat-composer-ecs-sg.png) 


### Create Application Load Balancer (ALB)

ALB target group

![threat-composer-tg](images/16-target-group.png)

Application Load Balancer

I initially configured the Application Load Balancer with an HTTP listener on port 80 to test the ECS Fargate deployment. Once the application is running successfully, I will add an HTTPS listener on port 443 using an AWS Certificate Manager (ACM) certificate and configure HTTP-to-HTTPS redirection.

![threat-composer-alb](images/17-alb.png)

### Create the ECS Fargate service

![ecs-fargate-services](images/18-ecs-task-definition.png)

Container: threat-composer 

![Container: threat-composer](images/19-container.png)

Port Mapping 

![Port Mapping](images/20-port-mapping.png)

### Verify the Application Load Balancer

confirmed the ALB can successfully reach NGINX

![Verify the ALB](images/21-target-health-check.png)


tested in my browser using the DNS Name from the ALB

![browser test](images/22-browser-test.png)

### Route 53 record

request  SSL/TLS certificate

![ACM Cert](images/23-acm.png)

Added HTTPS to the ALB security group 

![HTTPS Added to SG](images/24-http-sg.png)

Added the HTTPS listener 

![HTTPS Listener](images/25-https-listener.png)

Redirect HTTP to HTTPS

![HTTP to HTTPS](images/26-http-to-https.png)

Route 53 and create an A alias record

![A record tm.rginfralabs.co.uk](images/27-a-record-tm.png)

Tested in my Terminal 

![Terminal Tests](images/28-terminal-tests.png)

Browser Check displaying https://tm.rginfralabs.co.uk/workspaces/default/dashboard

![Browser Check displaying https](images/29-brower-check.png)

## Terraform 

I then rebuiilt the infrastructure in Terraform . I first built the provider.tf and created a variable for the region 

### Provider

![Terraform provider](images/30-provider.png)

![Region Vars](images/31-region-var.png)

I then Initialise Terraform , Ran Terraform Format and Validate


![Terraform fmt and validate](images/33-terra-fmt-validate.png)

### VPC 
I then built the VPC module 

![VPC main.tf](images/34-vpc-main.png)


![VPC variabless.tf](images/35-vpc-var.png)


![VPC Outputs](images/36-vpc-ouputs.png)


I then connected the VPC module to my root main.tf 