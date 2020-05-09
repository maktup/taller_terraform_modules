
#--------------------------------------------------#
#------------ CONFIGURACIÓN: 'VARIABLES' ----------#
#--------------------------------------------------# 
## IMPORTANTE #1: Aquí se registrarán los valores 'CONSTANTES' de cada 'VARIABLES', que será invocada 
## desde cada archivo '.tf' por medio de 'INTERPOLACIÓN'.
## IMPORTANTE #2: Desde el 'default' de las 'VARIABLES', NO se puede hacer referencia a 'INTERPOLACIONES'.

 
##################### [GENERIC] ######################
variable "const_valor_neutro" {
  description = "Valore 'NEUTRO' para ser reutilizado."
  default     = 0
}
variable "const_region" {
  description = "Region a utilizar en AWS."
  default     = "us-east-1"
}
variable "const_lista_zonas_disponibilidad" {
  description = "LISTA de 'ZONAS DE DISPONIBILIDAD' - 'AZs'"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "const_nombre_script_sh" {
  description = "Nombre del SCRIPT '.sh' de INSTALACIÓN."
  default     = "Install_MicroService_nodo1.sh"
}
variable "const_directorio_script_sh" {
  description = "Ruta de ubicación del SCRIPT '.sh' de INSTALACIÓN."
  default     = "SCRIPTS/Install_MicroService_nodo1.sh"
}
variable "const_directorio_script_openapi" {
  description = "Ruta de ubicación del SCRIPT '.yml' de 'OPENAPI' para la INSTALACIÓN."
  default     = "SCRIPTS/terraform_microservice.yml"
}


######################## [IAM] #######################
variable "const_grupo_administradores" {
  description = "Grupo de ADMINISTRADORES."
  default     = "administrators"
}
variable "const_grupo_programadores" {
  description = "Grupo de PROGRAMADORES."
  default     = "developers"
}
variable "const_grupo_arquitectos" {
  description = "Grupo de ARQUITECTOS."
  default     = "architects"
}
variable "const_grupo_otros" {
  description = "Grupo de OTROS."
  default     = "others"
}
variable "const_filsystem_administradores" {
  description = "Filesystem de ADMINISTRADORES."
  default     = "/users/administrators/"
}
variable "const_filsystem_desarrolladores" {
  description = "Filesystem de DESARROLLADORES."
  default     = "/users/developers/"
}
variable "const_filsystem_arquitectos" {
  description = "Filesystem de ARQUITECTOS."
  default     = "/users/architects/"
}
variable "const_filsystem_otros" {
  description = "Filesystem de OTROS."
  default     = "/users/others/"
}
variable "const_usuario_001" {
  description = "Nombre del USUARIO#1."
  default     = "cguerra"
}
variable "const_usuario_002" {
  description = "Nombre del USUARIO#2."
  default     = "mgrasso"
}
variable "const_usuario_003" {
  description = "Nombre del USUARIO#3."
  default     = "pcriado"
}


######################## [S3] ########################
variable "const_bucket_s3" {
  description = "Nombre del BUCKET-S3 que se creará."
  default     = "capacitacion-terraform"
}
variable "const_content-type_bucket_s3" {
  description = "Nombre del CONTENT-TYPE del archivo en S3."
  default     = "text/plain"
}
variable "const_estado_bucket_s3" {
  description = "Nombre del ESTADO de creacion del BUCKET-S3."
  default     = "private"
}
variable "const_policy_fullAccess_bucket_s3" {
  description = "Politica de Full-Acceso en S3."
  default     = <<POLICY
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


####################### [VPC] ########################
variable "const_ip_vpc" {
  description = "IP asignada a la 'VPC'."
  default     = "10.0.0.0/16"
} 
 

###################### [SUBNET] ######################
variable "const_lista_ips_subnets" {
  description = "LISTA de 'IPs' de las 'SUBNETs'"
  type        = "list"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


################# [INTERNET-GATEWAY] #################
//NO REQUIERE.


#################### [ROUTE-TABLE] ###################
variable "const_ip_route_table" {
  description = "IP asignada al 'ROUTE-TABLE'."
  default     = "0.0.0.0/0"
} 


################## [SECURITY-GROUP] ##################
variable "const_ip_all" {
  description = "TODO tipo de IP es aceptado."
  default     = "0.0.0.0/0"
} 
variable "const_protocolo_tcp" {
  description = "Protocolo de tipo 'TCP'"
  default     = "tcp"
} 
variable "const_protocolo_icmp" {
  description = "Protocolo de tipo 'ICMP'"
  default     = "icmp"
} 
variable "const_protocolo_all" {
  description = "Protocolo de tipo 'ALL'"
  default     = "-1"
} 
variable "const_lista_puertos_comunes_ingress" {
  description = "LISTA de 'from_port' para la creación de 'SECURITY-GROUPs'"
  type        = "list"
  default     = ["22", "80", "443", "8080"]
}


##################### [KEY-PAIR] #####################
variable "const_contenido_public_keyPair" {
  description = "Contenido 'PÚBLICO' del: 'KEY-PAIR'"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/AqBFCgRpE+gpFz3NibVuQOQa8T1lYIiJrNlzwALFAlwV6UXkjjiEPcIJDqeJHv0CUlnRdP6HXHljqnm05t+ZeVDWM5PA7bHrCv4Y9ZfEITB9v6E9/ln3XX0QrSY3Z4c9liiHx9rnIPZHVMoCrYdjsj8lPHCIi9Qb8c7J/FqiVsjm1BZJz6/50SqsU/kYiQEX9txVnYycQWlleF32TrGJI/p9/m9C9yYaxNU7w6Tmu/ORBQcEVLjvMhiMkAQo6Fd6px3lC9NWibYG1ChpW0pHeyGalKRqi9SvybaSMXG4i/v0x9tpX8lVTIjSLlKT4gISIeYeDuj8cjaFKNyo8o/axLigFb3WCz9yJTjpoY4bTZjUz3+vAm35lqyps19iBB4gffQdq6r3nlo5p2Yoyxbe73RODTzOe6JDmhjSr5ahdIVKluTArTKRTPFUBnuK5rdfhIYelyOCusBKTDTT4UsJDHJL4XhX/rlzREuubijj49lj9KxQkzvE0dK7I9ecaIWtRxgVHdGLn6WiZN7Qbif17AzRuEmXcsKloVYJIluw049t2NYU8Ozo2OwWMsKaoPlXkJi70bR/gqWwfj75XqnIWOYOPipbIfmePcsb3hdgY/aXYwFYAxOXPQXk9q4vYJlDf+TnY4VCdjk7r8d895SZhPzkyycXX9p2dHUalc=" 
}
variable "const_archivo_public_keyPair" {
  description = "Nombre del archivo: 'KEY-PAIR'"
  default     = "taller_terraform_key.pem.pub" 
}


######################## [EC3] #######################
locals {
  const_lista_datos_instancia = [
  {
    posicion = "0",
    ip = "10.0.1.10"
  },
  {
    posicion = "1",
    ip = "10.0.2.10"
  },
  {
    posicion = "2",
    ip = "10.0.3.10"
  }
  ]
}
variable "const_tipo_imagen_redhat" {
  description = "Nombre del tipo de 'IMAGEN'."
  default     = "ami-0c322300a1dd5dc79" 
}
variable "const_tipo_instancia" {
  description = "Tipo de 'INSTANCIA'."
  default     = "t2.micro" 
}


######################## [EIP] #######################
//NO REQUIERE.


######################## [ELB] #######################
variable "const_timeout_inantividad_conexion" {
  description = "Tiempo en segundos que la conexión puede estar inactiva."
  default     = "30" 
}
variable "const_timeout_maximo_conexion" {
  description = "Tiempo en segundos para permitir las conexiones."
  default     = "10" 
}
variable "const_lista_puertos_comunes_listener" {
  description = "LISTA de 'PUERTOS' para 'ELB'."
  type        = "list"
  default     = ["80", "8080"]
}
variable "const_protocolo_http" {
  description = "Protocolo de tipo 'HTTP'"
  default     = "HTTP"
} 
variable "const_target_healthCheck" {
  description = "Validacion por PING (TCP)."
  default     = "TCP:8080"
} 
variable "const_healthy_threshold_healthCheck" {
  description = "El # de CHECKs 'OK' (conexion) a considerar para considerarse 'HEALTHY'."
  default     = 3
} 
variable "const_unhealthy_threshold_healthCheck" {
  description = "Eel # de CHECKs 'NOK' (conexion) a considerar para considerarse 'UNHEALTHY'."
  default     = 4
} 
variable "const_timeout_healthCheck" {
  description = "'TIMEOUT' para que se complete el CHECK."
  default     = 5
} 
variable "const_interval_healthCheck" {
  description = "Intervalo de 'TIEMPO' para la publicación."
  default     = 30
} 


###################### [ROUTE53] #####################
variable "const_record_IPv4_route53" {
  description = "Tipo de registro - IPv4"
  default     = "A"
} 
variable "const_dominio_route53" {
  description = "DOMINIO adquirido para 'ROUTE-53'"
  default     = "capacitacion-terraform.com"
} 

#################### [API-GATEWAY] ###################
variable "const_config_endpoint_ag" {
  description = "Tipo de configuracion 'ENPOINT'"
  default     = "REGIONAL"
} 
variable "const_path_recurso_ag" {
  description = "La URI de la 'FUNCIONALIDAD' del 'MICROSERVICIO'."
  default     = "/get/saludar/{nombre}/{server}"
} 
variable "const_http_method_integration_ag" {
  description = "Metodo HTTP del 'INTEGRATION'."
  default     = "GET"
}  
variable "const_type_integration_ag" {
  description = "Tipo PROTOCOL del 'INTEGRATION'."
  default     = "HTTP"
} 
variable "const_url_backend_integration_ag" {
  description = "URL del BackEnd en el 'INTEGRATION'."
  default     = "http://www.capacitacion-terraform.com:8080/terraformservice/get/saludar/{nombre}/{server}"
} 
variable "const_stage_deployment_ag" {
  description = "Nombre del 'STAGE' en 'DEPLOYMENT'."
  default     = "DESA"
} 
variable "const_http_method_integration_response_ag" {
  description = "Metodo HTTP del 'INTEGRATION-RESPONSE'."
  default     = "GET"
} 
variable "const_status_code_integration_response_ag" {
  description = "Codigo de REPONSE en 'INTEGRATION-RESPONSE'."
  default     = "200"
} 


##################### [AUTOSCALING] ##################
variable "const_min_size_asg" {
  description = "Número MÍNIMO de 'INSTANCIAS' ejecutandose."
  default     = 1
}
variable "const_desired_capacity_asg" {
  description = "Número PARALELO de 'INSTANCIAS' ejecutandose."
  default     = 2
}
variable "const_max_size_asg" {
  description = "Número MÁXIMO de 'INSTANCIAS' ejecutandose."
  default     = 2
}
variable "const_health_check_type_asg" {
  description = "Tipo de 'HEALTH-CHECK' a aplicar."
  default     = "ELB"
}
variable "const_metrics_granularity_asg" {
  description = "Granularidad asociada con las métricas."
  default     = "1Minute"
}
variable "const_cooldown_policy" {
  description = "TIEMPO en segundos entre un ESCALAMIENTO & otro."
  default     = 200
}
variable "const_lista_scaling_adjustment_policy" {
  description = "Número de 'INSTANCIAS' para el ajuste: (AUMENTAR/DISMINUIR)."
  type        = "list"
  default     = ["1", "-1"] 
}
variable "const_lista_adjustment_type_policy" {
  description = "LISTA de OPCIONES: PercentChangeInCapacity, ExactCapacity, ChangeInCapacity"
  type        = "list"
  default     = ["ChangeInCapacity", "PercentChangeInCapacity", "ExactCapacity"]
}


#################### [CLOUDWATCH] #################### 
variable "const_evaluation_periods_cloudwatch" {
  description = "Número de 'PERIODOS'de evaluación de la DATA."
  default     = "2"
}
variable "const_Average_cloudwatch" {
  description = "Estadística para aplicar a la 'MÉTRICA'."
  default     = "Average"
}
variable "const_namespace_cloudwatch" {
  description = "'NAMESPACE' asociado con la 'MÉTRICA'."
  default     = "AWS/EC2"
}
variable "const_metric_name_cloudwatch" {
  description = "Nombre de la 'ALARMA' basada en 'CPU'."
  default     = "CPUUtilization"
}
variable "const_period_cloudwatch" {
  description = "Periodo en segundos, con relación a: 'statistic'."
  default     = "120"
}
variable "const_lista_threshold_cloudwatch" {
  description = "Lista de valores para el: 'UMBRAL': valor contra el cual se COMPARA la estadística especificada (UP/DOWN)."
  type        = "list"
  default     = ["31", "30"]
}
variable "const_lista_comparison_operator_cloudwatch" {
  description = "Lista de nombre de laS operaciones MATEMÁTICAS aplicadaS (AUMENTO/DECREMENTO)"
  type        = "list"
  default     = ["GreaterThanOrEqualToThreshold", "LessThanOrEqualToThreshold"]
}

 