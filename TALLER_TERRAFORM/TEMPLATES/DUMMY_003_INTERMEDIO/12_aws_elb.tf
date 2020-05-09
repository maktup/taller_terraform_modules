
#-------------------------------------------------------------#
#----------- CONFIGURACION: 'ELASTIC LOAD BALANCE' -----------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Se debe aperturar el acceso de 'TRÁFICO' para:
## 80   => Protoloco 'TCP' para soporte a: 'HTTP'.
## 8080 => Protoloco 'TCP' para soporte a: 'TOMCAT-JBOSS'.

## IMPORTANTE #2: El 'name' del 'ELB' debe tener un 'FORMATO' especial.
## IMPORTANTE #3: Se está aplicando 'ALTA DISPONIBILIDAD' a nivel de las 'INSTANCIAS (EC2)'. 


###### CREANDO RECURSO: 'ELASTIC LOAD BALANCE' ######:
resource "aws_elb" "elb_001" {
 
  name                        = "elb-001"
  security_groups             = ["${aws_security_group.sg_generic.id}"]                                                                         //Referencia a 'SECURITY-GROUP'.
  subnets                     = ["${aws_subnet.sn_generic[0].id}", "${aws_subnet.sn_generic[1].id}", "${aws_subnet.sn_generic[2].id}"]          //Referencia a 'SUBNET'.
  instances                   = ["${aws_instance.ec2_generic[0].id}", "${aws_instance.ec2_generic[1].id}", "${aws_instance.ec2_generic[2].id}"] //Referencia a 'INSTANCIAS (EC2)'.
  idle_timeout                = "${var.const_timeout_inantividad_conexion}"                                                                     //'TIMEOUT' de inactividad de conexion.
  connection_draining_timeout = "${var.const_timeout_maximo_conexion}"                                                                          //'TIMEOUT' de 'conexion.
  cross_zone_load_balancing   = true                                                                                                            //Permitir INVOCACIONES entre AZs. 
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
    target              = "${var.const_target_healthCheck}"              //Validacion por PING (TCP).
    healthy_threshold   = "${var.const_healthy_threshold_healthCheck}"   //Es el # de CHECKs 'OK' (conexion) a considerar para considerarse 'HEALTHY'.
    unhealthy_threshold = "${var.const_unhealthy_threshold_healthCheck}" //Es el # de CHECKs 'NOK' (conexion) a considerar para considerarse 'UNHEALTHY'.
    timeout             = "${var.const_timeout_healthCheck}"             //'TIMEOUT' para que se complete el CHECK.
    interval            = "${var.const_interval_healthCheck}"            //Intervalo de 'TIEMPO' para la publicación. 
  }

  tags = {
    Name = "elb-001"
  }

}

