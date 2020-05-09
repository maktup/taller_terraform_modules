
#----------------------------------------------------------#
#--------------- CONFIGURACION: 'ROUTE-TABLE' -------------#
#----------------------------------------------------------#
## IMPORTANTE #1: Asignar bien la referencia a la 'VPC'. 
## IMPORTANTE #2: Asignar bien la referencia al 'INTERNET-GATEWAY'.
## IMPORTANTE #3: En el 'route_table_association', amarrar bien los IDs   
## de las 'SUBNETs' con el ID de 'ROUTE-TABLE' (el unico creado). 


###### CREANDO RECURSO: 'ROUTE-TABLE' ######:
resource "aws_route_table" "rt_001" {
  vpc_id = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC.
  route {
    gateway_id = "${aws_internet_gateway.igw_001.id}" //Obtener el ID del 'INTERNET-GATEWAY'.
    cidr_block = "${var.const_ip_route_table}"
  }

  tags = {
    Name = "ROUTE-TABLE #001"
  }
}

###### CREANDO RECURSO: 'ROUTE-TABLE-ASSOCIATION' ######:
resource "aws_route_table_association" "assign_sn_to_rt_001" {
  subnet_id      = "${aws_subnet.sn_generic[0].id}" //Referencia el 'SUBNET#1' de la LISTA. 
  route_table_id = "${aws_route_table.rt_001.id}"   //Referencia al 'ROUTE-TABLE'. 
}

resource "aws_route_table_association" "assign_sn_to_rt_002" {
  subnet_id      = "${aws_subnet.sn_generic[1].id}" //Referencia el 'SUBNET#2' de la LISTA. 
  route_table_id = "${aws_route_table.rt_001.id}"   //Referencia al 'ROUTE-TABLE'. 
}

resource "aws_route_table_association" "assign_sn_to_rt_003" {
  subnet_id      = "${aws_subnet.sn_generic[2].id}" //Referencia el 'SUBNET#3' de la LISTA. 
  route_table_id = "${aws_route_table.rt_001.id}"   //Referencia al 'ROUTE-TABLE'. 
}

