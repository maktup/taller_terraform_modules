
#---------------------------------------------------#
#------------ OUTPUT [INTERNO]: 'SUBNET' -----------#
#---------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################


# ###################### [DINÁMICOS] ######################
output "const_ext_lista_ids_subnets" {
  //Imprimiento 'LISTA' completa:   
  value = "${split(",", join(",", aws_subnet.sn_generic.*.id))}"
}

