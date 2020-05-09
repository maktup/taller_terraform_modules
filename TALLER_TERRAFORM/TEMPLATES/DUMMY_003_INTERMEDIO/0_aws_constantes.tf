
#--------------------------------------------------#
#------------ CONFIGURACIÓN: 'VARIABLES' ----------#
#--------------------------------------------------# 
## IMPORTANTE #1: Aquí se 'DEFINIRÁN' los valores 'CONSTANTES' de cada 'VARIABLES', que será invocada.
## Así mismo, se manerá un 'ARCHIVO.tfvars' donde se 'PERSONALIZARÁ' & parametrizarán las 'VARIABLES'   
## en base a la necesidad & escenario. 

## IMPORTANTE #2: Desde el 'default' de las 'VARIABLES', NO se puede hacer referencia a 'INTERPOLACIONES'.


##################### [GENERIC] ######################
variable "const_valor_neutro" {
  description = "Valore 'NEUTRO' para ser reutilizado."
}
variable "const_region" {
  description = "Region a utilizar en AWS."
}
variable "const_lista_zonas_disponibilidad" {
  description = "LISTA de 'ZONAS DE DISPONIBILIDAD' - 'AZs'"
  type        = "list"
}
variable "const_nombre_script_sh" {
  description = "Nombre del SCRIPT '.sh' de INSTALACIÓN."
}
variable "const_directorio_script_sh" {
  description = "Ruta de ubicación del SCRIPT '.sh' de INSTALACIÓN."
}
variable "const_directorio_script_openapi" {
  description = "Ruta de ubicación del SCRIPT '.yml' de 'OPENAPI' para la INSTALACIÓN."
}


######################## [IAM] #######################
variable "const_grupo_administradores" {
  description = "Grupo de ADMINISTRADORES."
}
variable "const_grupo_programadores" {
  description = "Grupo de PROGRAMADORES."
}
variable "const_grupo_arquitectos" {
  description = "Grupo de ARQUITECTOS."
}
variable "const_grupo_otros" {
  description = "Grupo de OTROS."
}
variable "const_filsystem_administradores" {
  description = "Filesystem de ADMINISTRADORES."
}
variable "const_filsystem_desarrolladores" {
  description = "Filesystem de DESARROLLADORES."
}
variable "const_filsystem_arquitectos" {
  description = "Filesystem de ARQUITECTOS."
}
variable "const_filsystem_otros" {
  description = "Filesystem de OTROS."
}
variable "const_usuario_001" {
  description = "Nombre del USUARIO#1."
}
variable "const_usuario_002" {
  description = "Nombre del USUARIO#2."
}
variable "const_usuario_003" {
  description = "Nombre del USUARIO#3."
}


######################## [S3] ########################
variable "const_bucket_s3" {
  description = "Nombre del BUCKET-S3 que se creará."
}
variable "const_content-type_bucket_s3" {
  description = "Nombre del CONTENT-TYPE del archivo en S3."
}
variable "const_estado_bucket_s3" {
  description = "Nombre del ESTADO de creacion del BUCKET-S3."
}
variable "const_policy_fullAccess_bucket_s3" {
  description = "Politica de Full-Acceso en S3."
}

####################### [VPC] ########################
variable "const_ip_vpc" {
  description = "IP asignada a la 'VPC'."
}

  
###################### [SUBNET] ######################
variable "const_lista_ips_subnets" {
  description = "LISTA de 'IPs' de las 'SUBNETs'"
  type        = "list"
}


################# [INTERNET-GATEWAY] #################
//NO REQUIERE.


#################### [ROUTE-TABLE] ###################
variable "const_ip_route_table" {
  description = "IP asignada al 'ROUTE-TABLE'."
}
 

################## [SECURITY-GROUP] ##################
variable "const_ip_all" {
  description = "TODO tipo de IP es aceptado."
}
variable "const_protocolo_tcp" {
  description = "Protocolo de tipo 'TCP'"
}
variable "const_protocolo_icmp" {
  description = "Protocolo de tipo 'ICMP'"
}
variable "const_protocolo_all" {
  description = "Protocolo de tipo 'ALL'"
}
variable "const_lista_puertos_comunes_ingress" {
  description = "LISTA de 'from_port' para la creación de 'SECURITY-GROUPs'"
  type        = "list"
}


##################### [KEY-PAIR] #####################
variable "const_contenido_public_keyPair" {
  description = "Contenido 'PÚBLICO' del: 'KEY-PAIR'"
}
variable "const_archivo_public_keyPair" {
  description = "Nombre del archivo: 'KEY-PAIR'"
}

######################## [EC2] #######################
variable "const_lista_datos_instancia" {
  type = "list" 
}
variable "const_tipo_imagen_redhat" {
  description = "Nombre del tipo de 'IMAGEN'."
}
variable "const_tipo_instancia" {
  description = "Tipo de 'INSTANCIA'."
}
 

######################## [EIP] #######################
//NO REQUIERE.


######################## [ELB] #######################
variable "const_timeout_inantividad_conexion" {
  description = "Tiempo en segundos que la conexión puede estar inactiva."
}
variable "const_timeout_maximo_conexion" {
  description = "Tiempo en segundos para permitir las conexiones."
}
variable "const_lista_puertos_comunes_listener" {
  description = "LISTA de 'PUERTOS' para 'ELB'."
}
variable "const_protocolo_http" {
  description = "Protocolo de tipo 'HTTP'"
}
variable "const_target_healthCheck" {
  description = "Validacion por PING (TCP)."
}
variable "const_healthy_threshold_healthCheck" {
  description = "El # de CHECKs 'OK' (conexion) a considerar para considerarse 'HEALTHY'."
}
variable "const_unhealthy_threshold_healthCheck" {
  description = "Eel # de CHECKs 'NOK' (conexion) a considerar para considerarse 'UNHEALTHY'."
}
variable "const_timeout_healthCheck" {
  description = "'TIMEOUT' para que se complete el CHECK."
}
variable "const_interval_healthCheck" {
  description = "Intervalo de 'TIEMPO' para la publicación."
}


###################### [ROUTE53] #####################
variable "const_record_IPv4_route53" {
  description = "Tipo de registro - IPv4"
}


#################### [API-GATEWAY] ###################
variable "const_config_endpoint_ag" {
  description = "Tipo de configuracion 'ENPOINT'"
}
variable "const_path_recurso_ag" {
  description = "La URI de la 'FUNCIONALIDAD' del 'MICROSERVICIO'."
}
variable "const_http_method_integration_ag" {
  description = "Metodo HTTP del 'INTEGRATION'."
}
variable "const_type_integration_ag" {
  description = "Tipo PROTOCOL del 'INTEGRATION'."
}
variable "const_url_backend_integration_ag" {
  description = "URL del BackEnd en el 'INTEGRATION'."
}
variable "const_stage_deployment_ag" {
  description = "Nombre del 'STAGE' en 'DEPLOYMENT'."
}
variable "const_http_method_integration_response_ag" {
  description = "Metodo HTTP del 'INTEGRATION-RESPONSE'."
}
variable "const_status_code_integration_response_ag" {
  description = "Codigo de REPONSE en 'INTEGRATION-RESPONSE'."
}


##################### [AUTOSCALING] ##################
variable "const_min_size_asg" {
  description = "Número MÍNIMO de 'INSTANCIAS' ejecutandose."
}
variable "const_desired_capacity_asg" {
  description = "Número PARALELO de 'INSTANCIAS' ejecutandose."
}
variable "const_max_size_asg" {
  description = "Número MÁXIMO de 'INSTANCIAS' ejecutandose."
}
variable "const_health_check_type_asg" {
  description = "Tipo de 'HEALTH-CHECK' a aplicar."
}
variable "const_metrics_granularity_asg" {
  description = "Granularidad asociada con las métricas."
}
variable "const_cooldown_policy" {
  description = "TIEMPO en segundos entre un ESCALAMIENTO & otro."
}
variable "const_lista_scaling_adjustment_policy" {
  description = "Número de 'INSTANCIAS' para el ajuste: (AUMENTAR/DISMINUIR)."
  type        = "list"
}
variable "const_lista_adjustment_type_policy" {
  description = "LISTA de OPCIONES: PercentChangeInCapacity, ExactCapacity, ChangeInCapacity"
  type        = "list"
}


#################### [CLOUDWATCH] #################### 
variable "const_evaluation_periods_cloudwatch" {
  description = "Número de 'PERIODOS'de evaluación de la DATA."
}
variable "const_Average_cloudwatch" {
  description = "Estadística para aplicar a la 'MÉTRICA'."
}
variable "const_namespace_cloudwatch" {
  description = "'NAMESPACE' asociado con la 'MÉTRICA'."
}
variable "const_metric_name_cloudwatch" {
  description = "Nombre de la 'ALARMA' basada en 'CPU'."
}
variable "const_period_cloudwatch" {
  description = "Periodo en segundos, con relación a: 'statistic'."
}
variable "const_lista_threshold_cloudwatch" {
  description = "Lista de valores para el: 'UMBRAL': valor contra el cual se COMPARA la estadística especificada (UP/DOWN)."
  type        = "list"
}
variable "const_lista_comparison_operator_cloudwatch" {
  description = "Lista de nombre de laS operaciones MATEMÁTICAS aplicadaS (AUMENTO/DECREMENTO)"
  type        = "list"
}


