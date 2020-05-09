
#---------------------------------------------------------------#
#--------------- CONFIGURACION: 'INTERNET-GATEWAY' -------------#
#---------------------------------------------------------------#
## IMPORTANTE #1: Asignar bien referencia a la 'VPC' asociada. 
## IMPORTANTE #2: La DIFERENCIA entre las 'IPs-PUBLICAS' & 'IPs-PRIVADAS', es que 
## solo las 'IPs-PUBLICAS' están asociadas al 'INTERNET-GATEWAY' en el: 'ROUTE-TABLE',
## las 'IPs-PRIVADAS' no!. 


###### CREANDO RECURSO: 'INTERNET-GATEWAY' ######:
resource "aws_internet_gateway" "igw_001" {
  vpc_id = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC.

  tags = {
    Name = "INTERNET-GATEWAY #001"
  }  
}

