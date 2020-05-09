
#-------------------------------------------------#
#-------------- CONFIGURACION: 'ELB' -------------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.
  

###### CREANDO RECURSOS: 'ELB' ######:  
resource "aws_elb" "elb_001" {

  name                        = "elb-001"
  security_groups             = ["${var.const_ext_id_sg}"]           //Este valor es 'DINÁMICO'
  subnets                     = "${var.const_ext_lista_ids_subnets}" //Este valor es 'DINÁMICO'
  instances                   = "${var.const_ext_lista_ids_ec2}"     //Este valor es 'DINÁMICO'
  idle_timeout                = "${var.const_timeout_inantividad_conexion}"
  connection_draining_timeout = "${var.const_timeout_maximo_conexion}"
  cross_zone_load_balancing   = true
  connection_draining         = true

  //LISTENERs: 
  dynamic "listener" {
    for_each = "${var.const_lista_puertos_comunes_listener}" //ITERACIÓN solo de los 'PUERTOS'. 
    content {
      instance_port     = "${listener.value}"
      instance_protocol = "${var.const_protocolo_http}"
      lb_port           = "${listener.value}"
      lb_protocol       = "${var.const_protocolo_http}"
    }
  }

  //HEALTH-CHECKs: 
  health_check {
    target              = "${var.const_target_healthCheck}"             
    healthy_threshold   = "${var.const_healthy_threshold_healthCheck}"  
    unhealthy_threshold = "${var.const_unhealthy_threshold_healthCheck}" 
    timeout             = "${var.const_timeout_healthCheck}"            
    interval            = "${var.const_interval_healthCheck}"            
  }

  tags = {
    Name = "elb-001"
  }

}

