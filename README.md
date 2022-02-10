# How to configure VPC and EKS from scratch
    
There are a lot of solutions to do your task, but I decided to run a vpc with all the configuration of the subnets, routing tables. In this scenario, we have two availability zones in our vpc .
Each available zone has its own public and private area with its own nat gateway. 
I used an internet gateway at the edge of my infrastructure and managed a routing table to add a default route to the public areas.

There are `EKS` and `EKS node-group`.
When you run the AWS codes then, you have to add the Kube config to your OS then, you can go to the K8s folder, and run terraform apply once again.
It will start a Kubernetes service and deployment with one replica, and also, you can check your AWS. Kubernetes will create a load balancer in your AWS and connect the Kubernetes with your EKS. 

in this project to have HTTPS, we have to add codes below to Kubernetes service annotations
and also it needs certificates.
    
```
  service.beta.kubernetes.io/aws-load-balancer-ssl-cert: arn:aws:... ,
  service.beta.kubernetes.io/aws-load-balancer-ssl-ports: https
``` 


    to add dns name to route53 we can use `external DNS`

### tip 

security groups are created and I've connected Kubernetes to the specified security groups with annotations. it goes and create a LoadBalancer on AWS and connect it to the Kubernetes.

### other solution

    there are other solutions too. we can go for ALB with ingress controller . we need extra deployment for ingress controller 

## create kub config 
check your kube config first 

`cat ~/.kube/config`

create your aws context 

`aws eks --region eu-west-1 update-kubeconfig --name eks --profile default`

