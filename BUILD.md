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

### Create Security Groups

threat composer alb security group inbound rules 

![threat-composer-alb-sg](Images/14-sg-alb-inbound.png)

threat composer ecs security group inbound rules

![threat-composer-ecs-sg](Images/15-sg-threat-composer-ecs-sg.png) 


### Create Application Load Balancer (ALB)

ALB target group

![threat-composer-tg](Images/16-target-group.png)

Application Load Balancer

I initially configured the Application Load Balancer with an HTTP listener on port 80 to test the ECS Fargate deployment. Once the application is running successfully, I will add an HTTPS listener on port 443 using an AWS Certificate Manager (ACM) certificate and configure HTTP-to-HTTPS redirection.

![threat-composer-alb](Images/17-alb.png)

### Create the ECS Fargate service

![ecs-fargate-services](Images/18-ecs-task-definition.png)

Container: threat-composer 

![Container: threat-composer](Images/19-container.png)

Port Mapping 

![Port Mapping](Images/20-port-mapping.png)

### Verify the Application Load Balancer

confirmed the ALB can successfully reach NGINX

![Verify the ALB](Images/21-target-health-check.png)


tested in my browser using the DNS Name from the ALB

![browser test](Images/22-browser-test.png)

### Route 53 record

request  SSL/TLS certificate

![ACM Cert](Images/23-acm.png)

Added HTTPS to the ALB security group 

![HTTPS Added to SG](Images/24-http-sg.png)

Added the HTTPS listener 

![HTTPS Listener](Images/25-https-listener.png)

Redirect HTTP to HTTPS

![HTTP to HTTPS](Images/26-http-to-https.png)

Route 53 and create an A alias record

![A record tm.rginfralabs.co.uk](Images/27-a-record-tm.png)

Tested in my Terminal 

![Terminal Tests](Images/28-terminal-tests.png)

Browser Check displaying https://tm.rginfralabs.co.uk/workspaces/default/dashboard

![Browser Check displaying https](Images/29-brower-check.png)