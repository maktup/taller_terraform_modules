
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
variable "const_lista_datos_instancia" {
  type = "list"
  default = [
    {
      posicion = "0",
      ip       = "10.0.1.10"
    },
    {
      posicion = "1",
      ip       = "10.0.2.10"
    },
    {
      posicion = "2",
      ip       = "10.0.3.10"
    }
  ]
}
variable "const_tipo_imagen_redhat" {
  default = "ami-0c322300a1dd5dc79"
}
variable "const_tipo_instancia" {
  default = "t2.micro"
}
variable "const_directorio_script_sh" {
  default = "SCRIPTS/Install_MicroService_nodo1.sh"
}

###################### [DINÁMICOS] ######################
variable "const_ext_lista_ids_subnets" {
  type = "list"
}
variable "const_ext_id_sg" {
}
//NO requiere ser de tipo LISTA nativamente. 
variable "const_ext_lista_ids_kp" {
}

