#### Helpful commands
- terraform init
- terraform apply

#### updating context
- aws eks update-kubeconfig --name my-eks --region us-east-2

##### create a local profile for user1
- aws configure --profile user
- vim ~/.aws/config

`~/.aws/config`
[profile eks-admin]
role_arn = arn:aws:iam::424432388155:role/eks-admin ##### replace with your arn
source_profile = user1

##### test if we can assume eks-admin IAM role
- aws sts get-caller-identity --profile eks-admin

##### update Kubernetes config to use the eks-admin IAM role.
- aws eks update-kubeconfig \
  --name my-eks \
  --region us-east-2 \
  --profile eks-admin

##### you'll get an error saying You must be logged in to the server (Unauthorized).
- kubectl auth can-i "*" "*"

##### To add the eks-admin IAM role to the EKS cluster, we need to update the aws-auth configmap.

##### After deploying autoscaler and confirm it is running
- kubectl get pods -n kube-system
##### In separate terminal you can watch autoscaler logs to make sure you dont have any errors
- kubectl logs -f \
  -n kube-system \
  -l app=cluster-autoscaler

###### Now let's apply nginx Kubernetes deployment.
- kubectl apply -f k8s/nginx.yaml

###### In a few seconds, you should get a few more nodes.
watch -n 1 -t kubectl get nodes

##### Final testing
- terraform init
- terraform apply
- kubectl get pods -n kube-system
- kubectl logs -f -n kube-system \
  -l app.kubernetes.io/name=aws-load-balancer-controller
- kubectl apply -f k8s/echoserver.yaml
- kubectl get ingress
- curl http://echo.devopsbyexample.io


Access Key = AKIAZBZSXCNWCSCMMYN6
Secret Key = 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
  



