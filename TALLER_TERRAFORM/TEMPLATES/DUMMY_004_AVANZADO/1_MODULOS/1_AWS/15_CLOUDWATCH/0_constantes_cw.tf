
#--------------------------------------------------#
#------------ CONFIGURACIÓN: 'VARIABLES' ----------#
#--------------------------------------------------# 
## IMPORTANTE #1: Los valores que se queden aquí en 'default', serán justamente los valores
## por 'DEFECTO' que se manejarán. Ya que los demás serán 'SOBREESCRITOS' externamente.

## IMPORTANTE #2: No es necsario 'DOCUMENTAR', ya que esta se manejará en el 'constantes_*' (EXTERNO). 

## IMPORTANTE #3: Los valores ingresados podrán ser:
## - ESTÁTICOS: SI se especificarán: 'default' como valor base.
## - DINÁMICOS: NO se especificarán valor alguno como base (REFERENCIAN IDs).
##   Estos para identificarlos tendrán como identificador: 'const_ext_*'. 


###################### [ESTÁTICOS] ######################
variable "const_evaluation_periods_cloudwatch" {
  default = "2"
}
variable "const_Average_cloudwatch" {
  default = "Average"
}
variable "const_namespace_cloudwatch" {
  default = "AWS/EC2"
}
variable "const_metric_name_cloudwatch" {
  default = "CPUUtilization"
}
variable "const_period_cloudwatch" {
  default = "120"
}
variable "const_lista_threshold_cloudwatch" {
  type    = "list"
  default = ["31", "30"]
}
variable "const_lista_comparison_operator_cloudwatch" {
  type    = "list"
  default = ["GreaterThanOrEqualToThreshold", "LessThanOrEqualToThreshold"]
}

###################### [DINÁMICOS] ######################
variable "const_ext_arn_policy_up_as" {
}
variable "const_ext_arn_policy_down_as" {
}
variable "const_ext_name_asg_as" {
}

