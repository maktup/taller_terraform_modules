
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
variable "const_valor_neutro" {
  default = 0
}
variable "const_ip_all" {
  default = "0.0.0.0/0"
}
variable "const_protocolo_tcp" {
  default = "tcp"
}
variable "const_protocolo_icmp" {
  default = "icmp"
}
variable "const_protocolo_all" {
  default = "-1"
}
variable "const_lista_puertos_comunes_ingress" {
  type    = "list"
  default = ["22", "80", "443", "8080"]
}

###################### [DINÁMICOS] ######################
variable "const_ext_vpc_id" {
}

