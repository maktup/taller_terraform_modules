
#--------------------------------------------------#
#--------------- CONFIGURACION: 'VPC' -------------#
#--------------------------------------------------#
## IMPORTANTE #1: Asignar bien la IP.  

###### CREANDO RECURSO: 'VPC' ######:
resource "aws_vpc" "vpc_001" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "VPC #001"
  }
}
