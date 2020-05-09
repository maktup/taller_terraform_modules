
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'XXX' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################


####################### [DINÁMICOS] ######################
output "const_ext_id_rest_ag" {
  value = "${aws_api_gateway_rest_api.agra_001.id}"
}
 
