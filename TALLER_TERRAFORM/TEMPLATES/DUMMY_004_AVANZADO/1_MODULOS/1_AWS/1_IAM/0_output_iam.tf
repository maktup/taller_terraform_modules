
#-----------------------------------------------------#
#--------------- OUTPUT [INTERNO]: 'IAM' -------------#
#-----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################  
//--------- [GRUPOS] --------// 
output "const_grp_administrators" {
  value = "${aws_iam_group.grp_administrators.name}"
}
output "const_grp_developers" {
  value = "${aws_iam_group.grp_developers.name}"
}
output "const_grp_architects" {
  value = "${aws_iam_group.grp_architects.name}"
}
output "const_grp_others" {
  value = "${aws_iam_group.grp_others.name}"
}

//--------- [USUARIOS] --------// 
output "const_usuario_001" {
  value = "${aws_iam_user.usr_cguerra.name}"
}
output "const_usuario_002" {
  value = "${aws_iam_user.usr_mgrasso.name}"
}
output "const_usuario_003" {
  value = "${aws_iam_user.usr_pcriado.name}"
}

//--------- ['ACCESS-KEY'- 'SECRET-KEY'] --------// 
output "const_info_RGUERRA" {
  value = {
    "_ACCESS_KEY" = "${aws_iam_access_key.ak_rguerra.id}"
    "_SECRET_KEY" = "${aws_iam_access_key.ak_rguerra.secret}"
  }
}
output "const_info_MGRASO" {
  value = {
    "_ACCESS_KEY" = "${aws_iam_access_key.ak_mgrasso.id}"
    "_SECRET_KEY" = "${aws_iam_access_key.ak_mgrasso.secret}"
  }
}
output "const_info_PCRIADO" {
  value = {
    "_ACCESS_KEY" = "${aws_iam_access_key.ak_pcriado.id}"
    "_SECRET_KEY" = "${aws_iam_access_key.ak_pcriado.secret}"
  }
}

###################### [DINÁMICOS] ######################
output "const_id_group_admin_iam" {
  value = "${aws_iam_group.grp_administrators.id}"
}

output "const_id_user_admin_iam" {
  value = "${aws_iam_user.usr_cguerra.id}"
}

