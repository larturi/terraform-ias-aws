# Deploy de una Api Node en ECS con Terraform

1. Primero crear la infraestructura necesaria:

   - aws_ecr_repository
   - aws_ecs_cluster
   - aws_default_vpc
   - aws_default_subnet
   - aws_ecs_task_definition
   - aws_alb, aws_security_group
   - aws_lb_target_group
   - aws_lb_listener
   - aws_ecs_service

   ```bash
   terraform init

   terraform plan

   terraform apply -auto-approve
   ```

2. Generar la imagen con Docker y subirla a ECR

    - Entrar a ECR y entrar al repositorio demo-app-ecr-repo
    - Click en View push commands y ejecutarlos por consola

    ```bash
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 699880382197.dkr.ecr.us-east-1.amazonaws.com

    cd App

    docker build -t demo-app-ecr-repo . --platform=linux/amd64

    docker tag demo-app-ecr-repo:latest 699880382197.dkr.ecr.us-east-1.amazonaws.com/demo-app-ecr-repo:latest

    docker push 699880382197.dkr.ecr.us-east-1.amazonaws.com/demo-app-ecr-repo:latest
    ```

3. Si entras a ECS vas a ver el servicio corriendo

4. Si entras a Load Balancers, copiar el DNS Name y abrir en el browser
   - Ej: http://lna-demo-app-alb-1955319809.us-east-1.elb.amazonaws.com/contacts

## Destroy Infra

```bash
terraform destroy
```
