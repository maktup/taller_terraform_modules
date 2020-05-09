
#-------------------------------------------------#
#---------- CONFIGURACION: 'AUTOSCALING' ---------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'LAUNCH-CONFIGURATION' ######: 
resource "aws_launch_configuration" "launch_config_001" {
  name_prefix                 = "launch_config_001-"
  image_id                    = "${var.const_tipo_imagen_redhat}"
  instance_type               = "${var.const_tipo_instancia}"
  key_name                    = "${var.const_ext_lista_ids_kp[0]}" //Este valor es 'DINÁMICO'
  security_groups             = ["${var.const_ext_id_sg}"]         //Este valor es 'DINÁMICO'
  user_data                   = "${file(var.const_directorio_script_sh)}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}
 
###### CREANDO RECURSOS: 'AUTO-SCALING-GROUP' ######: 
resource "aws_autoscaling_group" "scaling_group_001" {
  name                 = "scaling_group_001"
  min_size             = "${var.const_min_size_asg}"
  desired_capacity     = "${var.const_desired_capacity_asg}"
  max_size             = "${var.const_max_size_asg}"
  health_check_type    = "${var.const_health_check_type_asg}"
  launch_configuration = "${aws_launch_configuration.launch_config_001.name}"
  vpc_zone_identifier  = "${var.const_ext_lista_ids_subnets}" //Este valor es 'DINÁMICO'
  load_balancers       = ["${var.const_ext_id_elb}"]          //Este valor es 'DINÁMICO'
  metrics_granularity  = "${var.const_metrics_granularity_asg}"
 
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "INST. (EC2) Temp"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "poly_scaling_up" {
  name                   = "poly_as_up"
  scaling_adjustment     = "${var.const_lista_scaling_adjustment_policy[0]}"
  adjustment_type        = "${var.const_lista_adjustment_type_policy[0]}"
  cooldown               = "${var.const_cooldown_policy}"
  autoscaling_group_name = "${aws_autoscaling_group.scaling_group_001.name}"
}

resource "aws_autoscaling_policy" "poly_scaling_down" {
  name                   = "policy_as_down"
  scaling_adjustment     = "${var.const_lista_scaling_adjustment_policy[1]}"
  adjustment_type        = "${var.const_lista_adjustment_type_policy[0]}"
  cooldown               = "${var.const_cooldown_policy}"
  autoscaling_group_name = "${aws_autoscaling_group.scaling_group_001.name}"
}


