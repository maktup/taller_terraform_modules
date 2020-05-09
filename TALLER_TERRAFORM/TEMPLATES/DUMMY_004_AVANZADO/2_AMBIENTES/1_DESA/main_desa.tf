
#--------------------------------------------------------#
#--------------- CONFIGURACION [DESARROLLO] -------------#
#--------------------------------------------------------# 
## IMPORTANTE#1: Para el caso del 'PROVIDER'.., NO se puede manejar 'MODULARMENTE' & referenciarse.
## IMPORTANTE#2: Cada 'SERVICIO' de AWS debe de ser unicado dentro del directorio: '1. MODULOS/NOMBRE_SERVICIO'. 
## IMPORTANTE#3: El manejo de los 'MÓDULOS' puede manejarse: 'LOCAL', 'REMOTO' (GITHUB). 
## IMPORTANTE#4: El contenido debe de ser 3 archivos: 'principal, constantes & output' 
## IMPORTANTE#5: En directorio: 2. 'DESARROLLO' deberá contener 2 archivos: 'main & tfvars'.
## IMPORTANTE#6: En el archivo: 'main', se referenciarán a cada uno de los 'MÓDULOS' & el contenido
## interno será solo de los campos que se desee 'SOBREESCRIBIR' la información. 
## IMPORTANTE#7: Los 'MÓDULOS' pueden ser referenciados 'LOCALMENTE' o 'REMÓTAMENTE' (GITHUB). 


############ CREANDO: 'PROVIDER'  ############: 
provider "aws" {
  ## access_key = "AKIAWFKLYP2URHLS5UOP"
  ## secret_key = "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"
  region = "${var.const_region}"
}

//------------------------------------------ MÓDULO [IAM] ------------------------------------------// 
module "modulo_iam" {
  source = "../../1_MODULOS/1_AWS/1_IAM"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/1_IAM"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 
  const_grupo_administradores = "${var.const_grupo_administradores}"
  const_grupo_programadores   = "${var.const_grupo_programadores}"
  const_grupo_arquitectos     = "${var.const_grupo_arquitectos}"
  const_grupo_otros           = "${var.const_grupo_otros}"

  const_filsystem_administradores = "${var.const_filsystem_administradores}"
  const_filsystem_desarrolladores = "${var.const_filsystem_desarrolladores}"
  const_filsystem_arquitectos     = "${var.const_filsystem_arquitectos}"
  const_filsystem_otros           = "${var.const_filsystem_otros}"

  const_usuario_001 = "${var.const_usuario_001}"
  const_usuario_002 = "${var.const_usuario_002}"
  const_usuario_003 = "${var.const_usuario_003}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  //NO existen.
}


//------------------------------------------ MÓDULO [S3] ------------------------------------------// 
module "modulo_s3" {
  source = "../../1_MODULOS/1_AWS/2_S3"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/2_S3" 

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 
  const_bucket_s3                   = "${var.const_bucket_s3}"
  const_content-type_bucket_s3      = "${var.const_content-type_bucket_s3}"
  const_estado_bucket_s3            = "${var.const_estado_bucket_s3}"
  const_region                      = "${var.const_region}"
  const_nombre_script_sh            = "${var.const_nombre_script_sh}"
  const_directorio_script_sh        = "${var.const_directorio_script_sh}"
  const_policy_fullAccess_bucket_s3 = "${var.const_policy_fullAccess_bucket_s3}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  //NO existen.
}


//------------------------------------------ MÓDULO [VPC] ------------------------------------------//
module "modulo_vpc" {
  source = "../../1_MODULOS/1_AWS/3_VPC"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/3_VPC" 

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 
  const_cidrblok_vpc = "${var.const_cidrblok_vpc}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  //NO existen.
}
 

//------------------------------------------ MÓDULO [SUBNET] ------------------------------------------//
module "modulo_subnet" {
  source = "../../1_MODULOS/1_AWS/4_SUBNET"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/4_SUBNET" 

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]: 
  const_lista_ips_subnets          = "${var.const_lista_ips_subnets}"
  const_lista_zonas_disponibilidad = "${var.const_lista_zonas_disponibilidad}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_vpc_id = "${module.modulo_vpc.const_id_vpc}" //Cargando 'VARIABLE' local.
}


//-------------------------------------- MÓDULO [INTERNET-GATEWAY] --------------------------------------//
module "modulo_internet_gateway" {
  source = "../../1_MODULOS/1_AWS/5_INTERNET_GATEWAY"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/5_INTERNET_GATEWAY" 

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  //NO existen.

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_vpc_id = "${module.modulo_vpc.const_id_vpc}" //Cargando 'VARIABLE' local.
}


//---------------------------------------- MÓDULO [ROUTE-TABLE] ----------------------------------------//
module "modulo_route_table" {
  source = "../../1_MODULOS/1_AWS/6_ROUTE_TABLE"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/6_ROUTE_TABLE" 

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  //NO existen.

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_vpc_id            = "${module.modulo_vpc.const_id_vpc}"                   //Cargando 'VARIABLE' local.
  const_ext_ig_id             = "${module.modulo_internet_gateway.const_id_ig}"       //Cargando 'VARIABLE' local.
  const_ext_lista_ids_subnets = "${module.modulo_subnet.const_ext_lista_ids_subnets}" //Cargando 'LISTA' local.
}


//--------------------------------------- MÓDULO [SECURITY-GROUP] ---------------------------------------//
module "modulo_security_group" {
  source = "../../1_MODULOS/1_AWS/7_SECURITY_GROUP"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/7_SECURITY_GROUP"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_valor_neutro                  = "${var.const_valor_neutro}"
  const_ip_all                        = "${var.const_ip_all}"
  const_protocolo_tcp                 = "${var.const_protocolo_tcp}"
  const_protocolo_icmp                = "${var.const_protocolo_icmp}"
  const_protocolo_all                 = "${var.const_protocolo_all}"
  const_lista_puertos_comunes_ingress = "${var.const_lista_puertos_comunes_ingress}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_vpc_id = "${module.modulo_vpc.const_id_vpc}" //Cargando 'VARIABLE' local.
}


//---------------------------------------- MÓDULO [KEY-PAIR] ----------------------------------------//
module "modulo_key_pair" {
  source = "../../1_MODULOS/1_AWS/8_KEY_PAIR"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/8_KEY_PAIR"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_contenido_public_keyPair = "${var.const_contenido_public_keyPair}"
  const_archivo_public_keyPair   = "${var.const_archivo_public_keyPair}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  //NO existen.
}


//------------------------------------------ MÓDULO [EC2] ------------------------------------------//
module "modulo_ec2" {
  source = "../../1_MODULOS/1_AWS/9_EC2"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/9_EC2"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_tipo_imagen_redhat    = "${var.const_tipo_imagen_redhat}"
  const_tipo_instancia        = "${var.const_tipo_instancia}"
  const_directorio_script_sh  = "${var.const_directorio_script_sh}"
  const_lista_datos_instancia = "${var.const_lista_datos_instancia}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_lista_ids_subnets = "${module.modulo_subnet.const_ext_lista_ids_subnets}" //Cargando 'LISTA' local.
  const_ext_id_sg             = "${module.modulo_security_group.const_id_sg}"         //Cargando 'VARIABLE' local.
  const_ext_lista_ids_kp      = "${module.modulo_key_pair.const_ext_lista_ids_kp}"    //Cargando 'LISTA' local.
}


//------------------------------------------ MÓDULO [EIP] ------------------------------------------//
module "modulo_eip" {
  source = "../../1_MODULOS/1_AWS/10_EIP"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/10_EIP"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  //NO existen.

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_lista_ec2_id = "${module.modulo_ec2.const_ext_lista_ids_ec2}" //Cargando 'LISTA' local.
}


//------------------------------------------ MÓDULO [ELB] ------------------------------------------//
module "modulo_elb" {
  source = "../../1_MODULOS/1_AWS/11_ELB"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/11_ELB"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_timeout_inantividad_conexion    = "${var.const_timeout_inantividad_conexion}"
  const_timeout_maximo_conexion         = "${var.const_timeout_maximo_conexion}"
  const_lista_puertos_comunes_listener  = "${var.const_lista_puertos_comunes_listener}"
  const_protocolo_http                  = "${var.const_protocolo_http}"
  const_target_healthCheck              = "${var.const_target_healthCheck}"
  const_healthy_threshold_healthCheck   = "${var.const_healthy_threshold_healthCheck}"
  const_unhealthy_threshold_healthCheck = "${var.const_unhealthy_threshold_healthCheck}"
  const_timeout_healthCheck             = "${var.const_timeout_healthCheck}"
  const_interval_healthCheck            = "${var.const_interval_healthCheck}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_id_sg             = "${module.modulo_security_group.const_id_sg}"         //Cargando 'VARIABLE' local.
  const_ext_lista_ids_subnets = "${module.modulo_subnet.const_ext_lista_ids_subnets}" //Cargando 'LISTA' local.
  const_ext_lista_ids_ec2     = "${module.modulo_ec2.const_ext_lista_ids_ec2}"        //Cargando 'LISTA' local.
}


//---------------------------------------- MÓDULO [ROUTE-53] ----------------------------------------//
module "modulo_route53" {
  source = "../../1_MODULOS/1_AWS/12_ROUTE_53"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/12_ROUTE_53"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_dominio_route53     = "${var.const_dominio_route53}"
  const_record_IPv4_route53 = "${var.const_record_IPv4_route53}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_dns_name_elb = "${module.modulo_elb.const_ext_dns_name_elb}" //Cargando 'VARIABLE' local.
  const_ext_zone_id_elb  = "${module.modulo_elb.const_ext_zone_id_elb}"  //Cargando 'VARIABLE' local.
}


module "modulo_api_gateway" {
  source = "../../1_MODULOS/1_AWS/13_API_GATEWAY"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/13_API_GATEWAY"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_directorio_script_openapi           = "${var.const_directorio_script_openapi}"
  const_config_endpoint_ag                  = "${var.const_config_endpoint_ag}"
  const_path_recurso_ag                     = "${var.const_path_recurso_ag}"
  const_http_method_integration_ag          = "${var.const_http_method_integration_ag}"
  const_url_backend_integration_ag          = "${var.const_url_backend_integration_ag}"
  const_stage_deployment_ag                 = "${var.const_stage_deployment_ag}"
  const_http_method_integration_response_ag = "${var.const_http_method_integration_response_ag}"
  const_status_code_integration_response_ag = "${var.const_status_code_integration_response_ag}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]: 
  //NO existen.
}


//---------------------------------------- MÓDULO [AUTOSCALING] ----------------------------------------//
module "modulo_autoscaling" {
  source = "../../1_MODULOS/1_AWS/14_AUTOSCALING"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/14_AUTOSCALING"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_tipo_imagen_redhat              = "${var.const_tipo_imagen_redhat}"
  const_tipo_instancia                  = "${var.const_tipo_instancia}"
  const_directorio_script_sh            = "${var.const_directorio_script_sh}"
  const_min_size_asg                    = "${var.const_min_size_asg}"
  const_desired_capacity_asg            = "${var.const_desired_capacity_asg}"
  const_max_size_asg                    = "${var.const_max_size_asg}"
  const_health_check_type_asg           = "${var.const_health_check_type_asg}"
  const_metrics_granularity_asg         = "${var.const_metrics_granularity_asg}"
  const_lista_scaling_adjustment_policy = "${var.const_lista_scaling_adjustment_policy}"
  const_lista_adjustment_type_policy    = "${var.const_lista_adjustment_type_policy}"
  const_cooldown_policy                 = "${var.const_cooldown_policy}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]: 
  const_ext_lista_ids_kp      = "${module.modulo_key_pair.const_ext_lista_ids_kp}"    //Cargando 'LISTA' local.
  const_ext_id_sg             = "${module.modulo_security_group.const_id_sg}"         //Cargando 'VARIABLE' local.
  const_ext_lista_ids_subnets = "${module.modulo_subnet.const_ext_lista_ids_subnets}" //Cargando 'LISTA' local.
  const_ext_id_elb            = "${module.modulo_elb.const_ext_id_elb}"               //Cargando 'VARIABLE' local.
}


//---------------------------------------- MÓDULO [CLOUDWATCH] ----------------------------------------//
module "modulo_cloudwatch" {
  source = "../../1_MODULOS/1_AWS/15_CLOUDWATCH"
  //source = "github.com/maktup/taller_terraform_modules.git//TALLER_TERRAFORM/TEMPLATES/DUMMY_004_AVANZADO/1_MODULOS/1_AWS/15_CLOUDWATCH"

  //CAMPOS PARA 'SOBREESCRIBIR' [ESTÁTICOS]:  
  const_lista_comparison_operator_cloudwatch = "${var.const_lista_comparison_operator_cloudwatch}"
  const_evaluation_periods_cloudwatch        = "${var.const_evaluation_periods_cloudwatch}"
  const_metric_name_cloudwatch               = "${var.const_metric_name_cloudwatch}"
  const_namespace_cloudwatch                 = "${var.const_namespace_cloudwatch}"
  const_period_cloudwatch                    = "${var.const_period_cloudwatch}"
  const_Average_cloudwatch                   = "${var.const_Average_cloudwatch}"
  const_lista_threshold_cloudwatch           = "${var.const_lista_threshold_cloudwatch}"

  //CAMPOS PARA 'SOBREESCRIBIR' [DINÁMICOS]:
  const_ext_arn_policy_up_as   = "${module.modulo_autoscaling.const_ext_arn_policy_up_as}"   //Cargando 'VARIABLE' local.  
  const_ext_arn_policy_down_as = "${module.modulo_autoscaling.const_ext_arn_policy_down_as}" //Cargando 'VARIABLE' local.
  const_ext_name_asg_as        = "${module.modulo_autoscaling.const_ext_name_asg_as}"        //Cargando 'VARIABLE' local.
}

