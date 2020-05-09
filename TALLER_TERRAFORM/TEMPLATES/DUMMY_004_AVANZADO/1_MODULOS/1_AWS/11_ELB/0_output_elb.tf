
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'XXX' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################


####################### [DINÁMICOS] ######################
output "const_ext_id_elb" {
  value = "${aws_elb.elb_001.id}"
}

output "const_ext_dns_name_elb" {
  value = "${aws_elb.elb_001.dns_name}"
}

output "const_ext_zone_id_elb" {
  value = "${aws_elb.elb_001.zone_id}"
}

 