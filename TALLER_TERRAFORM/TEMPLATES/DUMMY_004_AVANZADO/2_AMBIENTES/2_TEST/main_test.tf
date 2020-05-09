
#-------------------------------------------------------#
#---------------- CONFIGURACION [TESTING] --------------#
#-------------------------------------------------------# 
## IMPORTANTE#1: Para el caso del 'PROVIDER'.., NO se puede manejar 'MODULARMENTE' & referenciarse.
## IMPORTANTE#2: Cada 'SERVICIO' de AWS debe de ser unicado dentro del directorio: '1. MODULOS/NOMBRE_SERVICIO'. 
## IMPORTANTE#3: El contenido debe de ser 3 archivos: 'principal, constantes & output' 
## IMPORTANTE#4: En directorio: 2. 'DESARROLLO' deberá contener 2 archivos: 'main & tfvars'.
## IMPORTANTE#5: En el archivo: 'main', se referenciarán a cada uno de los 'MÓDULOS' & el contenido
## interno será solo de los campos que se desee 'SOBREESCRIBIR' la información. 
## IMPORTANTE#6: Los 'MÓDULOS' pueden ser referenciados 'LOCALMENTE' o 'REMÓTAMENTE' (GITHUB).
 

############ CREANDO: 'PROVIDER'  ############: 
provider "aws" {
  region = "us-east-1"
}


# //------------------------------------------ MÓDULO [IAM] ------------------------------------------// 
# module "modulo_iam" {
#   source = "../1. MODULOS/1_IAM"
#   //source = "git@github.com:hashicorp/example.git"

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //------------------------------------------ MÓDULO [S3] ------------------------------------------// 
# module "modulo_s3" {
#   source = "../1. MODULOS/2_S3"

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //------------------------------------------ MÓDULO [VPC] ------------------------------------------//
# module "modulo_vpc" {
#   source = "../1. MODULOS/3_VPC"

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //------------------------------------------ MÓDULO [SUBNET] ------------------------------------------//
# module "modulo_subnet" {
#   source = "../1. MODULOS/4_SUBNET" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //--------------------------------------- MÓDULO [INTERNET-GATEWAY] ---------------------------------------//
# module "modulo_internet_gateway" {
#   source = "../1. MODULOS/5_INTERNET_GATEWAY" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //---------------------------------------- MÓDULO [ROUTE-TABLE] ----------------------------------------//
# module "modulo_route_table" {
#   source = "../1. MODULOS/6_ROUTE_TABLE"

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //--------------------------------------- MÓDULO [SECURITY-GROUP] ---------------------------------------//
# module "modulo_security_group" {
#   source = "../1. MODULOS/7_SECURITY_GROUP" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //---------------------------------------- MÓDULO [KEY-PAIR] ----------------------------------------//
# module "modulo_key_pair" {
#   source = "../1. MODULOS/8_KEY_PAIR" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
#   //NO existen.
# }


# //------------------------------------------ MÓDULO [EC2] ------------------------------------------//
# module "modulo_ec2" {
#   source = "../1. MODULOS/9_EC2" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //------------------------------------------ MÓDULO [EIP] ------------------------------------------//
# module "modulo_eip" {
#   source = "../1. MODULOS/10_EIP" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# //------------------------------------------ MÓDULO [ELB] ------------------------------------------//
# module "modulo_elb" {
#   source = "../1. MODULOS/11_ELB" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }

 
# //---------------------------------------- MÓDULO [ROUTE-53] ----------------------------------------//
# module "modulo_route53" {
#   source = "../1. MODULOS/12_ROUTE_53" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }


# module "modulo_api_gateway" {
#   source = "../1. MODULOS/13_API_GATEWAY" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]: 
# }


# //---------------------------------------- MÓDULO [AUTOSCALING] ----------------------------------------//
# module "modulo_autoscaling" {
#   source = "../1. MODULOS/14_AUTOSCALING" 

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]: 
# }


# //---------------------------------------- MÓDULO [CLOUDWATCH] ----------------------------------------//
# module "modulo_cloudwatch" {
#   source = "../1. MODULOS/15_CLOUDWATCH"  

#   //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  

#   //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
# }

