
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
variable "const_record_IPv4_route53" {
  default = "A"
}
variable "const_dominio_route53" {
  default = "capacitacion-terraform.com"
}


###################### [DINÁMICOS] ######################
variable "const_ext_dns_name_elb" {
}
variable "const_ext_zone_id_elb" {
}

 