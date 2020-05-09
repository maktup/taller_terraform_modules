
#-------------------------------------------------------------#
#--------------- CONFIGURACION: 'PROVIDER' [AWS] -------------#
#-------------------------------------------------------------# 
## IMPORTANTE #1: El 'access_key' & 'secret_key', pueden ser manepados 
## directamente (HARDCODE) o referenciados en el archivo: '.aws/credentials'

###### CREANDO RECURSO: 'PROVIDER' ######: 
provider "aws" {
  ## access_key = "AKIAWFKLYP2URHLS5UOP"
  ## secret_key = "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"
  region = "${var.const_region}"
}
