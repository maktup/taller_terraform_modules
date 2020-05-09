
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
variable "const_bucket_s3" {
  default = "capacitacion-terraform"
}
variable "const_content-type_bucket_s3" {
  default = "text/plain"
}
variable "const_estado_bucket_s3" {
  default = "private"
}
variable "const_policy_fullAccess_bucket_s3" {
  default = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MY_BUCKET_POLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::capacitacion-terraform/*"
    }
  ]
}
POLICY
}

variable "const_region" {
  default = "us-east-1"
}
variable "const_nombre_script_sh" {
  default = "Install_MicroService_nodo1.sh"
}
variable "const_directorio_script_sh" {
  default = "../1. MODULOS/SCRIPTS/Install_MicroService_nodo1.sh"
}

###################### [DINÁMICOS] ######################
//NO posee. 

