
#---------------------------------------------------#
#------- CONFIGURACIÓN: 'VARIABLES (REMOTAS)' ------#
#---------------------------------------------------# 
## IMPORTANTE #1: Asignar los 'VALORES' para cada 'VARIABLE'. ya que será parametrizada a nivel de archivo.


##################### [GENERIC] ######################
const_valor_neutro               = 0
const_region                     = "us-east-1"
const_lista_zonas_disponibilidad = ["us-east-1a", "us-east-1b", "us-east-1c"]
const_nombre_script_sh           = "Install_MicroService_nodo1.sh"
const_directorio_script_sh       = "SCRIPTS/Install_MicroService_nodo1.sh"
const_directorio_script_openapi  = "SCRIPTS/terraform_microservice.yml"


######################## [IAM] #######################
const_grupo_administradores     = "administrators"
const_grupo_programadores       = "developers"
const_grupo_arquitectos         = "architects"
const_grupo_otros               = "others"
const_filsystem_administradores = "/users/administrators/"
const_filsystem_desarrolladores = "/users/developers/"
const_filsystem_arquitectos     = "/users/architects/"
const_filsystem_otros           = "/users/others/"
const_usuario_001               = "cguerra"
const_usuario_002               = "mgrasso"
const_usuario_003               = "pcriado"


######################## [S3] ########################
const_bucket_s3                   = "capacitacion-terraform"
const_content-type_bucket_s3      = "text/plain"
const_estado_bucket_s3            = "private"
const_policy_fullAccess_bucket_s3 = <<POLICY
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

####################### [VPC] ########################
const_ip_vpc = "10.0.0.0/16"


###################### [SUBNET] ######################
const_lista_ips_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]


################# [INTERNET-GATEWAY] #################
//NO REQUIERE.


#################### [ROUTE-TABLE] ###################
const_ip_route_table = "0.0.0.0/0"


################## [SECURITY-GROUP] ##################
const_ip_all                        = "0.0.0.0/0"
const_protocolo_tcp                 = "tcp"
const_protocolo_icmp                = "icmp"
const_protocolo_all                 = "-1"
const_lista_puertos_comunes_ingress = ["22", "80", "443", "8080"]


##################### [KEY-PAIR] #####################
const_contenido_public_keyPair = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB/AqBFCgRpE+gpFz3NibVuQOQa8T1lYIiJrNlzwALFAlwV6UXkjjiEPcIJDqeJHv0CUlnRdP6HXHljqnm05t+ZeVDWM5PA7bHrCv4Y9ZfEITB9v6E9/ln3XX0QrSY3Z4c9liiHx9rnIPZHVMoCrYdjsj8lPHCIi9Qb8c7J/FqiVsjm1BZJz6/50SqsU/kYiQEX9txVnYycQWlleF32TrGJI/p9/m9C9yYaxNU7w6Tmu/ORBQcEVLjvMhiMkAQo6Fd6px3lC9NWibYG1ChpW0pHeyGalKRqi9SvybaSMXG4i/v0x9tpX8lVTIjSLlKT4gISIeYeDuj8cjaFKNyo8o/axLigFb3WCz9yJTjpoY4bTZjUz3+vAm35lqyps19iBB4gffQdq6r3nlo5p2Yoyxbe73RODTzOe6JDmhjSr5ahdIVKluTArTKRTPFUBnuK5rdfhIYelyOCusBKTDTT4UsJDHJL4XhX/rlzREuubijj49lj9KxQkzvE0dK7I9ecaIWtRxgVHdGLn6WiZN7Qbif17AzRuEmXcsKloVYJIluw049t2NYU8Ozo2OwWMsKaoPlXkJi70bR/gqWwfj75XqnIWOYOPipbIfmePcsb3hdgY/aXYwFYAxOXPQXk9q4vYJlDf+TnY4VCdjk7r8d895SZhPzkyycXX9p2dHUalc="
const_archivo_public_keyPair   = "taller_terraform_key.pem.pub"


######################## [EC2] #######################
const_lista_datos_instancia = [
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
const_tipo_imagen_redhat = "ami-0c322300a1dd5dc79"
const_tipo_instancia     = "t2.micro"


######################## [EIP] #######################
//NO REQUIERE.


######################## [ELB] #######################
const_timeout_inantividad_conexion    = "30"
const_timeout_maximo_conexion         = "10"
const_lista_puertos_comunes_listener  = ["80", "8080"]
const_protocolo_http                  = "HTTP"
const_target_healthCheck              = "TCP:8080"
const_healthy_threshold_healthCheck   = 3
const_unhealthy_threshold_healthCheck = 4
const_timeout_healthCheck             = 5
const_interval_healthCheck            = 30


###################### [ROUTE53] #####################
const_record_IPv4_route53 = "A"


#################### [API-GATEWAY] ###################
const_config_endpoint_ag                  = "REGIONAL"
const_path_recurso_ag                     = "/get/saludar/{nombre}/{server}"
const_http_method_integration_ag          = "GET"
const_type_integration_ag                 = "HTTP"
const_url_backend_integration_ag          = "http://www.capacitacion-terraform.com:8080/terraformservice/get/saludar/{nombre}/{server}"
const_stage_deployment_ag                 = "DESA"
const_http_method_integration_response_ag = "GET"
const_status_code_integration_response_ag = "200"


##################### [AUTOSCALING] ##################
const_min_size_asg                    = 1
const_desired_capacity_asg            = 2
const_max_size_asg                    = 2
const_health_check_type_asg           = "ELB"
const_metrics_granularity_asg         = "1Minute"
const_cooldown_policy                 = 200
const_lista_scaling_adjustment_policy = ["1", "-1"]
const_lista_adjustment_type_policy    = ["ChangeInCapacity", "PercentChangeInCapacity", "ExactCapacity"]
 

#################### [CLOUDWATCH] #################### 
const_evaluation_periods_cloudwatch        = "2"
const_Average_cloudwatch                   = "Average"
const_namespace_cloudwatch                 = "AWS/EC2"
const_metric_name_cloudwatch               = "CPUUtilization"
const_period_cloudwatch                    = "120"
const_lista_threshold_cloudwatch           = ["31", "30"]
const_lista_comparison_operator_cloudwatch = ["GreaterThanOrEqualToThreshold", "LessThanOrEqualToThreshold"]

