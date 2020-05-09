
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
variable "const_grupo_administradores" {
  default = "administrators"
}
variable "const_grupo_programadores" {
  default = "developers"
}
variable "const_grupo_arquitectos" {
  default = "architects"
}
variable "const_grupo_otros" {
  default = "others"
}
variable "const_filsystem_administradores" {
  default = "/users/administrators/"
}
variable "const_filsystem_desarrolladores" {
  default = "/users/developers/"
}
variable "const_filsystem_arquitectos" {
  default = "/users/architects/"
}
variable "const_filsystem_otros" {
  default = "/users/others/"
}
variable "const_usuario_001" {
  default = "cguerra"
}
variable "const_usuario_002" {
  default = "mgrasso"
}
variable "const_usuario_003" {
  default = "pcriado"
}

###################### [DINÁMICOS] ######################
//NO posee. 

