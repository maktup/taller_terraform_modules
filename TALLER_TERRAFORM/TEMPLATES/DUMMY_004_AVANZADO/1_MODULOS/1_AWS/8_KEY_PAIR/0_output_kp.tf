
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'XXX' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################
output "const_contenido_public_keyPair" {
  value = "${aws_key_pair.kp_001.key_name}"
}

output "const_archivo_public_keyPair" {
  value = "${aws_key_pair.kp_002.key_name}"
}

###################### [DINÁMICOS] ######################
output "const_kp_01_id" {
  value = "${aws_key_pair.kp_001.id}"
}
output "const_kp_02_id" {
  value = "${aws_key_pair.kp_002.id}"
}
output "const_kp_03_id" {
  value = "${aws_key_pair.kp_003.id}"
}
output "const_ext_lista_ids_kp" {
  //Dándole FORMA e imprimiendo 'LISTA' de STRINGs completa (en este caso: 'id' & 'key_name' son lo mismo).   
  value = "${ [ tostring( aws_key_pair.kp_001.id ), tostring( aws_key_pair.kp_002.key_name ), tostring( aws_key_pair.kp_003.id )  ] }" 
}

