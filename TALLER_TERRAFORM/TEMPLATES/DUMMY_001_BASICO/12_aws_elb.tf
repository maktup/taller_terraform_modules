
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
  security_groups             = ["${aws_security_group.sg_001.id}"]                                                        //Referencia a 'SECURITY-GROUP'.
  subnets                     = ["${aws_subnet.sn_001.id}", "${aws_subnet.sn_002.id}", "${aws_subnet.sn_003.id}"]          //Referencia a 'SUBNET'.
  instances                   = ["${aws_instance.ec2_001.id}", "${aws_instance.ec2_002.id}", "${aws_instance.ec2_003.id}"] //Referencia a 'INSTANCIAS (EC2)'.
  idle_timeout                = 30                                                                                         //'TIMEOUT' de conexion.
  connection_draining_timeout = 10                                                                                         //'TIMEOUT' de 'drenado' entre conexion.
  cross_zone_load_balancing   = true                                                                                       //Permitir INVOCACIONES entre AZs. 
  connection_draining         = true

  //LISTENERs: 
  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  listener {
    instance_port     = 8080
    instance_protocol = "HTTP"
    lb_port           = 8080
    lb_protocol       = "HTTP"
  }

  //HEALTH-CHECKs: 
  health_check {
    target              = "TCP:8080" //Validacion por PING (TCP).
    healthy_threshold   = 3          //Es el # de CHECKs 'OK' (conexion) a considerar para considerarse 'HEALTHY'.
    unhealthy_threshold = 2          //Es el # de CHECKs 'NOK' (conexion) a considerar para considerarse 'UNHEALTHY'.
    timeout             = 5          //'TIMEOUT' para que se complete el CHECK.
    interval            = 30         //Intervalo de 'TIEMPO' para la publicación. 
  }

  tags = {
    Name = "elb-001"
  }

}

