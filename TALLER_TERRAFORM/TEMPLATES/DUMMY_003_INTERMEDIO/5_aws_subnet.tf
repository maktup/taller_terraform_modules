
#------------------------------------------------------#
#--------------- CONFIGURACION: 'SUBNETs' -------------#
#------------------------------------------------------#
## IMPORTANTE #1: La CREACION de las 'SUBNETs' están siendo 'DINÁMICAS'.
## IMPORTANTE #2: Asignar bien la IP (SUBNETING). 
## IMPORTANTE #3: Asociar bien la 'SUBNET' a la 'AZ' (1 AZ diferente por SUBNET). 
## IMPORTANTE #4: Las 'AZ' varían su nombre en base a la 'REGION' elegida. 


###### CREANDO RECURSOS: 'SUBNETs' ######:  
resource "aws_subnet" "sn_generic" {
  count                   = "${length(var.const_lista_ips_subnets)}"                          //IMPORTANTE: Obtiene el TAMAÑO de la 'LISTA' para iterar.
  vpc_id                  = "${aws_vpc.vpc_001.id}"                                           //Obtener el ID de la VPC. 
  cidr_block              = "${element(var.const_lista_ips_subnets, (count.index))}"          //Lista de IPs de 'SUBNETs' (Itera & crea).
  availability_zone       = "${element(var.const_lista_zonas_disponibilidad, (count.index))}" //Lista de 'AZs' (Itera & crea).
  map_public_ip_on_launch = true

  tags = {
    Name = "SUBNET #00${(count.index + 1)}" //Se agrega +1, para que el 'CONTADOR'arranque 1 & NO de 0.
  }
}

