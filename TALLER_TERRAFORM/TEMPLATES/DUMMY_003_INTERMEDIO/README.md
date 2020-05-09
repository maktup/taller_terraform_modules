
# PROVIDER 'AWS'
 
- Estos SCRIPTs de 'TERRAFORM' permitirán la 'AUTOMATIZACIÓN' aplicando el concepto de: 'INFRAESTRUCTURA COMO CÓDIGO' de manera agnóstica.  

# IMPORTANTE

Este 'TERCER BLOQUE' de Scripts mostrará el manejo 'INTERMEDIO' (NIVEL#2) de un 'APROVISIONAMIENTO de INFRAESTRUCTURA', enfocado en este caso al 'CLOUD PROVIDER' de AWS.

Aquí lo NUEVO que se verá, es el manejo de:

* 'EXTERNALIZACIÓN' (configuracion parametrizada en archivo).


Tambien, aqui la 'EJECUCIÓN' debera ser realizada en base a un ARCHIVO, de la siguiente manera:

$ terraform plan -var-file="0_aws_constantes.tfvars"
$ terraform apply -var-file="0_aws_constantes.tfvars" -auto-approve
$ terraform destroy -var-file="0_aws_constantes.tfvars" -auto-approve
 

Así mismo, los 'RECURSOS' manejados serán los siguientes:

- REGIONS.
- AVAILABILITY ZONE (AZ).
- IAM.
- S3.
- VPC.
- SUBNETs.
- INTERNET-GATEWAY.
- ROUTE-TABLE.
- SECURITY-GROUPs.
- KEY-PAIR.
- INSTANCE (EC2).
- ELASTIC-IP (EIP).
- ELASTIC-LOAD-BALANCE (ELB).
- ROUTE-53.
- API-GATEWAY.
- AUTOSCALING: ('LAUNCH-CONFIGURATION' & 'AUTO-SCALING-GROUP').
- CLOUDWATCH.
