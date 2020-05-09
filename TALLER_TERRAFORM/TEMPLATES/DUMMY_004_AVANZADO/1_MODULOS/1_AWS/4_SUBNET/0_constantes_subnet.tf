
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
variable "const_lista_ips_subnets" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "const_lista_zonas_disponibilidad" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

###################### [DINÁMICOS] ######################
variable "const_ext_vpc_id" {
}

