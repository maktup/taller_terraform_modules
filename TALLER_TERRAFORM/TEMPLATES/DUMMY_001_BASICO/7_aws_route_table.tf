
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
    cidr_block = "0.0.0.0/0" 
  }

  tags = {
    Name = "ROUTE-TABLE #001"
  }
}

###### CREANDO RECURSO: 'ROUTE-TABLE-ASSOCIATION' ######:
resource "aws_route_table_association" "assign_sn_to_rt_001" {
  subnet_id      = "${aws_subnet.sn_001.id}"
  route_table_id = "${aws_route_table.rt_001.id}"  
}

resource "aws_route_table_association" "assign_sn_to_rt_002" {
  subnet_id      = "${aws_subnet.sn_002.id}"
  route_table_id = "${aws_route_table.rt_001.id}"
}

resource "aws_route_table_association" "assign_sn_to_rt_003" {
  subnet_id      = "${aws_subnet.sn_003.id}"
  route_table_id = "${aws_route_table.rt_001.id}"
}

