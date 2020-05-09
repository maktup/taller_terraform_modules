
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'XXX' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################


# ###################### [DINÁMICOS] ######################
output "const_id_sg" { 
  value = "${aws_security_group.sg_generic.id}"
}
 
