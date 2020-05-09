
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


#################### [API-GATEWAY] ###################
variable "const_directorio_script_openapi" {
  default = "SCRIPTS/terraform_microservice.yml"
}
variable "const_config_endpoint_ag" {
  default = "REGIONAL"
}
variable "const_path_recurso_ag" {
  default = "/get/saludar/{nombre}/{server}"
}
variable "const_http_method_integration_ag" {
  default = "GET"
}
variable "const_type_integration_ag" {
  default = "HTTP"
}
variable "const_url_backend_integration_ag" {
  default = "http://www.capacitacion-terraform.com:8080/terraformservice/get/saludar/{nombre}/{server}"
}
variable "const_stage_deployment_ag" {
  default = "DESA"
}
variable "const_http_method_integration_response_ag" {
  default = "GET"
}
variable "const_status_code_integration_response_ag" {
  default = "200"
}

