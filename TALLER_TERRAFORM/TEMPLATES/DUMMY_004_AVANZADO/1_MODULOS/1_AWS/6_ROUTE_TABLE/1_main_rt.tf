
#-------------------------------------------------#
#---------- CONFIGURACION: 'ROUTE-TABLE' ---------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.

 
###### CREANDO RECURSOS: 'ROUTE-TABLE' ######:  
resource "aws_route_table" "rt_001" {
  vpc_id = "${var.const_ext_vpc_id}" //Este valor es 'DINÁMICO'. 
  route {
    gateway_id = "${var.const_ext_ig_id}" //Este valor es 'DINÁMICO'. 
    cidr_block = "${var.const_ip_route_table}"
  }

  tags = {
    Name = "ROUTE-TABLE #001"
  }
}

###### CREANDO RECURSO: 'ROUTE-TABLE-ASSOCIATION' ######:
resource "aws_route_table_association" "assign_sn_to_rt_001" {
  subnet_id      = "${var.const_ext_lista_ids_subnets[0]}" //Este valor es 'DINÁMICO'.
  route_table_id = "${aws_route_table.rt_001.id}"    
}

resource "aws_route_table_association" "assign_sn_to_rt_002" {
  subnet_id      = "${var.const_ext_lista_ids_subnets[1]}" //Este valor es 'DINÁMICO'.  
  route_table_id = "${aws_route_table.rt_001.id}"    
}

resource "aws_route_table_association" "assign_sn_to_rt_003" {
  subnet_id      = "${var.const_ext_lista_ids_subnets[2]}" //Este valor es 'DINÁMICO'.  
  route_table_id = "${aws_route_table.rt_001.id}"   
}

