
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'VPC' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).
 

###################### [ESTÁTICOS] ######################
output "const_cidrblok_vpc" {
  value = "${aws_vpc.vpc_001.cidr_block}"
}

###################### [DINÁMICOS] ######################
output "const_id_vpc" {
  value = "${aws_vpc.vpc_001.id}"
}

