
#----------------------------------------------------#
#--------------- OUTPUT [INTERNO]: 'S3' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ###################### 
output "const_region" {
  value = "${aws_s3_bucket.bs3_001.region}"
}
output "const_nombre_script_sh" {
  value = "${aws_s3_bucket_object.obj_bs3_001.key}"
}
output "const_directorio_script_sh" {
  value = "${aws_s3_bucket_object.obj_bs3_001.source}"
}
output "const_content-type_bucket_s3" {
  value = "${aws_s3_bucket_object.obj_bs3_001.content_encoding}"
}
output "const_policy_fullAccess_bucket_s3" {
  value = "${aws_s3_bucket_policy.polu_bs3_001.policy}"
}

###################### [DINÁMICOS] ######################
output "const_id_bucket_s3" {
  value = "${aws_s3_bucket.bs3_001.id}"
}
output "const_id_object_s3" {
  value = "${aws_s3_bucket_object.obj_bs3_001.id}"
}

