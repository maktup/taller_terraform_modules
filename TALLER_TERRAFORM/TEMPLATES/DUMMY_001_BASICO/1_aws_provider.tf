
#-------------------------------------------------------------#
#--------------- CONFIGURACION: 'PROVIDER' [AWS] -------------#
#-------------------------------------------------------------# 
## IMPORTANTE #1: El 'access_key' & 'secret_key', pueden ser manepados 
## directamente (HARDCODE) o referenciados en el archivo: '.aws/credentials'

###### CREANDO RECURSO: 'PROVIDER' ######: 
provider "aws" {
  ### access_key = "AKIAWFKLYP2UT6MTZJNG"
  ### secret_key = "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"
  region = "us-east-1"
}
