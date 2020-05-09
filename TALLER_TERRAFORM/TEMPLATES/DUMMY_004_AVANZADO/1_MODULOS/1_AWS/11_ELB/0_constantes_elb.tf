
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
variable "const_timeout_inantividad_conexion" {
  default = "30"
}
variable "const_timeout_maximo_conexion" {
  default = "10"
}
variable "const_lista_puertos_comunes_listener" {
  type    = "list"
  default = ["80", "8080"]
}
variable "const_protocolo_http" {
  default = "HTTP"
}
variable "const_target_healthCheck" {
  default = "TCP:8080"
}
variable "const_healthy_threshold_healthCheck" {
  default = 3
}
variable "const_unhealthy_threshold_healthCheck" {
  default = 4
}
variable "const_timeout_healthCheck" {
  default = 5
}
variable "const_interval_healthCheck" {
  default = 30
}


###################### [DINÁMICOS] ######################
variable "const_ext_id_sg" {
}
variable "const_ext_lista_ids_subnets" {
  type = "list"
}
variable "const_ext_lista_ids_ec2" {
  //NO requiere ser de tipo LISTA nativamente. 
  type = "list"
}

