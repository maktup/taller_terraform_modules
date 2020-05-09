
#-------------------------------------------------------------#
#---------------- CONFIGURACION: 'AUTOSCALING'----------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: El 'AUTOSCALING' se basa en la creacion & ejecución de 2 recursos:
## 'LAUNCH-CONFIGURATION' & 'AUTO-SCALING-GROUP'.
## IMPORTANTE #2: El 'AUTOSCALING' aplicado se enfoca a: 'INSTANCIAS EC2'. 
## IMPORTANTE #3: El 'AUTOSCALING' dependerá tambien de la evaluación & 'ALERTAS' enviadas por medio de 'CLOUDWATCH'.


###### CREANDO RECURSOS: 'LAUNCH-CONFIGURATION' ######: 
resource "aws_launch_configuration" "launch_config_001" {
  name_prefix                 = "launch_config_001-"
  image_id                    = "ami-0c322300a1dd5dc79"                            //'IMAGEN' de REDHAT.
  instance_type               = "t2.micro"                                         //'IMAGEN' pequeña. 
  key_name                    = "${aws_key_pair.kp_001.id}"                        //Referencia al 'KEY-PAIR' asignado.
  security_groups             = ["${aws_security_group.sg_001.id}"]                //Referencia al 'SECURITY-GROUP'.
  user_data                   = "${file("SCRIPTS/Install_MicroService_nodo1.sh")}" //Referencia al archivo: '.sh'.
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

###### CREANDO RECURSOS: 'AUTO-SCALING-GROUP' ######: 
resource "aws_autoscaling_group" "scaling_group_001" {
  name                 = "scaling_group_001"
  min_size             = 1 //Número MÍNIMO de 'INSTANCIAS' ejecutandose.
  desired_capacity     = 2 //Número PARALELO de 'INSTANCIAS' ejecutandose.
  max_size             = 4 //Número MÁXIMO de 'INSTANCIAS' ejecutandose.
  health_check_type    = "ELB"
  launch_configuration = "${aws_launch_configuration.launch_config_001.name}"                              //Referencia al 'LAUNCH-CONFIGURATION'. 
  vpc_zone_identifier  = ["${aws_subnet.sn_001.id}", "${aws_subnet.sn_002.id}", "${aws_subnet.sn_003.id}"] //Referencia a las 'SUBNETs'. 
  load_balancers       = ["${aws_elb.elb_001.id}"]                                                         //Referencia a las 'ELB' manejado. 
  metrics_granularity  = "1Minute"                                                                         //Valor asociado con mas 'MÉTRICAS'.

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  lifecycle {
    create_before_destroy = true //Requerido para volver a 'DESPLEGAR' sin interrupción.
  }

  tag {
    key                 = "Name"
    value               = "INST. (EC2) Temp"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "poly_scaling_up" {
  name                   = "poly_as_up"
  scaling_adjustment     = 1                                                 //Número de 'INSTANCIAS' para el ajuste: (AUMENTAR).
  adjustment_type        = "ChangeInCapacity"                                //OPCIONES: PercentChangeInCapacity, ExactCapacity, ChangeInCapacity
  cooldown               = 200                                               //TIEMPO en segundos entre un ESCALAMIENTO & otro.
  autoscaling_group_name = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia al 'AUTO-SCALING-GROUP'. 
}

resource "aws_autoscaling_policy" "poly_scaling_down" {
  name                   = "policy_as_down"
  scaling_adjustment     = -1                                                //Número de 'INSTANCIAS' para el ajuste: (DISMINUIR).
  adjustment_type        = "ChangeInCapacity"                                //OPCIONES: PercentChangeInCapacity, ExactCapacity, ChangeInCapacity
  cooldown               = 200                                               //TIEMPO en segundos entre un ESCALAMIENTO & otro.
  autoscaling_group_name = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia al 'AUTO-SCALING-GROUP'. 
}

