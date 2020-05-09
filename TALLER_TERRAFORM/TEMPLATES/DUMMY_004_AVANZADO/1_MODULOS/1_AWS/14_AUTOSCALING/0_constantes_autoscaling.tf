
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
variable "const_tipo_imagen_redhat" {
  default = "ami-0c322300a1dd5dc79"
}
variable "const_tipo_instancia" {
  default = "t2.micro"
}
variable "const_min_size_asg" {
  default = 1
}
variable "const_desired_capacity_asg" {
  default = 2
}
variable "const_max_size_asg" {
  default = 2
}
variable "const_health_check_type_asg" {
  default = "ELB"
}
variable "const_metrics_granularity_asg" {
  default = "1Minute"
}
variable "const_cooldown_policy" {
  default = 200
}
variable "const_lista_scaling_adjustment_policy" {
  type    = "list"
  default = ["1", "-1"]
}
variable "const_lista_adjustment_type_policy" {
  type    = "list"
  default = ["ChangeInCapacity", "PercentChangeInCapacity", "ExactCapacity"]
}
variable "const_directorio_script_sh" {
  default = "SCRIPTS/Install_MicroService_nodo1.sh"
}

###################### [DINÁMICOS] ######################
variable "const_ext_lista_ids_kp" {
  //NO requiere ser de tipo LISTA nativamente. 
}
variable "const_ext_id_sg" {
}
variable "const_ext_lista_ids_subnets" {
  type = "list"
}
variable "const_ext_id_elb" {
}

