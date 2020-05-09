
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'XXX' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] ######################


# ###################### [DINÁMICOS] ######################
output "const_ext_ids_lc_as" {
  value = "${aws_launch_configuration.launch_config_001.id}"
}
output "const_ext_ids_asg_as" {
  value = "${aws_autoscaling_group.scaling_group_001.id}"
}
output "const_ext_name_asg_as" {
  value = "${aws_autoscaling_group.scaling_group_001.name}"
}
output "const_ext_arn_policy_up_as" {
  value = "${aws_autoscaling_policy.poly_scaling_up.arn}"
}
output "const_ext_arn_policy_down_as" {
  value = "${aws_autoscaling_policy.poly_scaling_down.arn}"
}

