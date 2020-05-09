
#--------------------------------------------------#
#--------------- CONFIGURACION: 'VPC' -------------#
#--------------------------------------------------#
## IMPORTANTE #1: Asignar bien la IP.  


###### CREANDO RECURSO: 'VPC' ######:
resource "aws_vpc" "vpc_001" {
  cidr_block           = "${var.const_ip_vpc}"
  enable_dns_hostnames = true

  tags = {
    Name = "VPC #001"
  }
}
