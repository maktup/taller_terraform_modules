
#-------------------------------------------------#
#----------- CONFIGURACION: 'CLOUDWATCH' ---------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'CLOUDWATCH' ######: 
resource "aws_cloudwatch_metric_alarm" "cw_alarm_up" {
  alarm_name          = "cw_alarm_up"
  comparison_operator = "${var.const_lista_comparison_operator_cloudwatch[0]}"
  evaluation_periods  = "${var.const_evaluation_periods_cloudwatch}"
  metric_name         = "${var.const_metric_name_cloudwatch}"
  namespace           = "${var.const_namespace_cloudwatch}"
  period              = "${var.const_period_cloudwatch}"
  statistic           = "${var.const_Average_cloudwatch}"
  threshold           = "${var.const_lista_threshold_cloudwatch[0]}"
  alarm_actions       = ["${var.const_ext_arn_policy_up_as}"] //Este valor es 'DINÁMICO' 
  alarm_description   = "ESTA 'MÉTRICA' MONITOREA LAS 'INSTANCIAS EC2' A NIVEL DE 'CPU': (SOBREPASO DE 'UMBRAL')"

  dimensions = {
    AutoScalingGroupName = "${var.const_ext_name_asg_as}" //Este valor es 'DINÁMICO'
  }
}

resource "aws_cloudwatch_metric_alarm" "cw_alarm_down" {
  alarm_name          = "cw_alarm_down"
  comparison_operator = "${var.const_lista_comparison_operator_cloudwatch[1]}"
  evaluation_periods  = "${var.const_evaluation_periods_cloudwatch}"
  metric_name         = "${var.const_metric_name_cloudwatch}"
  namespace           = "${var.const_namespace_cloudwatch}"
  period              = "${var.const_period_cloudwatch}"
  statistic           = "${var.const_Average_cloudwatch}"
  threshold           = "${var.const_lista_threshold_cloudwatch[1]}"
  alarm_actions       = ["${var.const_ext_arn_policy_down_as}"] //Este valor es 'DINÁMICO'
  alarm_description   = "ESTA 'MÉTRICA' MONITOREA LAS 'INSTANCIAS EC2' A NIVEL DE 'CPU': (NORMALIDAD DE 'UMBRAL')"

  dimensions = {
    AutoScalingGroupName = "${var.const_ext_name_asg_as}" //Este valor es 'DINÁMICO'
  }
}

