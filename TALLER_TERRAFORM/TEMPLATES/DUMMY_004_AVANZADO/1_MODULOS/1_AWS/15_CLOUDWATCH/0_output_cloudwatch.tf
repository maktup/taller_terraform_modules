
#----------------------------------------------------#
#-------------- OUTPUT [INTERNO]: 'XXX' -------------#
#----------------------------------------------------# 
## IMPORTANTE #1: Se debe de 'IMPRIMIR' todo lo 'REFERENCIADO' en el archivo: 'main_*.tf' (LOCAL).
## IMPORTANTE #2: SI se puede 'IMPRIMIR' los 'IDs' de los 'RECURSOS'.
## IMPORTANTE #3: Para su IMPRESIÓN este archivo será 'REFERENCIADO' desde el archivo: 'main_*.tf' (EXTERNO).


###################### [ESTÁTICOS] #######################


####################### [DINÁMICOS] ######################
output "const_ext_id_alarm_up_cw" {
  value = "${aws_cloudwatch_metric_alarm.cw_alarm_up}"
}
output "const_ext_id_alarm_down_cw" {
  value = "${aws_cloudwatch_metric_alarm.cw_alarm_up}"
}

