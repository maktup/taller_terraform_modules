
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
  image_id                    = "${var.const_tipo_imagen_redhat}"              //'IMAGEN' de REDHAT.
  instance_type               = "${var.const_tipo_instancia}"                  //'IMAGEN' pequeña. 
  key_name                    = "${aws_key_pair.kp_001.id}"                    //Referencia al 'KEY-PAIR' asignado.
  security_groups             = ["${aws_security_group.sg_generic.id}"]        //Referencia al 'SECURITY-GROUP'.
  user_data                   = "${file("${var.const_directorio_script_sh}")}" //Referencia al archivo: '.sh'.
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

###### CREANDO RECURSOS: 'AUTO-SCALING-GROUP' ######: 
resource "aws_autoscaling_group" "scaling_group_001" {
  name                 = "scaling_group_001"
  min_size             = "${var.const_min_size_asg}"         //Número MÍNIMO de 'INSTANCIAS' ejecutandose.
  desired_capacity     = "${var.const_desired_capacity_asg}" //Número PARALELO de 'INSTANCIAS' ejecutandose.
  max_size             = "${var.const_max_size_asg}"         //Número MÁXIMO de 'INSTANCIAS' ejecutandose.
  health_check_type    = "${var.const_health_check_type_asg}"
  launch_configuration = "${aws_launch_configuration.launch_config_001.name}"                                                   //Referencia al 'LAUNCH-CONFIGURATION'. 
  vpc_zone_identifier  = ["${aws_subnet.sn_generic[0].id}", "${aws_subnet.sn_generic[1].id}", "${aws_subnet.sn_generic[2].id}"] //Referencia a las 'SUBNETs'. 
  load_balancers       = ["${aws_elb.elb_001.id}"]                                                                              //Referencia a las 'ELB' manejado. 
  metrics_granularity  = "${var.const_metrics_granularity_asg}"                                                                 //Valor asociado con mas 'MÉTRICAS'.

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
  scaling_adjustment     = "${var.const_lista_scaling_adjustment_policy[0]}" //Número de 'INSTANCIAS' para el ajuste: (AUMENTAR).
  adjustment_type        = "${var.const_lista_adjustment_type_policy[0]}"    //OPCIONES: PercentChangeInCapacity, ExactCapacity, ChangeInCapacity
  cooldown               = "${var.const_cooldown_policy}"                    //TIEMPO en segundos entre un ESCALAMIENTO & otro.
  autoscaling_group_name = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia al 'AUTO-SCALING-GROUP'. 
}

resource "aws_autoscaling_policy" "poly_scaling_down" {
  name                   = "policy_as_down"
  scaling_adjustment     = "${var.const_lista_scaling_adjustment_policy[1]}" //Número de 'INSTANCIAS' para el ajuste: (DISMINUIR).
  adjustment_type        = "${var.const_lista_adjustment_type_policy[0]}"    //OPCIONES: PercentChangeInCapacity, ExactCapacity, ChangeInCapacity
  cooldown               = "${var.const_cooldown_policy}"                    //TIEMPO en segundos entre un ESCALAMIENTO & otro.
  autoscaling_group_name = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia al 'AUTO-SCALING-GROUP'. 
}

