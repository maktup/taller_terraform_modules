
#-------------------------------------------------------------#
#---------------- CONFIGURACION: 'CLOUDWATCH'----------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Este recurso 'CLOUDWATCH' trabajará de la mano con el 'AUTO-SCALING-GROUP', Validando  
## que NO se sobrepare el 'UMBRAL' (CPU) definido, de los contrario aplicará la 'ELASTICIDAD': (UP/DOWN) 
## a nivel de 'INSTANCIAS (EC2)'.


###### CREANDO RECURSOS: 'CLOUDWATCH' ######: 
resource "aws_cloudwatch_metric_alarm" "cw_alarm_up" {
  alarm_name          = "cw_alarm_up"
  comparison_operator = "${var.const_lista_comparison_operator_cloudwatch[0]}" //IMPORTANTE: nombre de la operacion MATEMÁTICA aplicada (AUMENTO). 
  evaluation_periods  = "${var.const_evaluation_periods_cloudwatch}"           //Número de 'PERIODOS'de evaluación de la DATA.
  metric_name         = "${var.const_metric_name_cloudwatch}"                  //Nombre de la 'ALARMA' basada en 'CPU'.
  namespace           = "${var.const_namespace_cloudwatch}"                    //'NAMESPACE' asociado con la 'MÉTRICA'.
  period              = "${var.const_period_cloudwatch}"                       //Periodo en segundos, con relación a: 'statistic'. 
  statistic           = "${var.const_Average_cloudwatch}"                      //Estadística para aplicar a la 'MÉTRICA'.
  threshold           = "${var.const_lista_threshold_cloudwatch[0]}"           //'UMBRAL': valor contra el cual se COMPARA la estadística especificada: (30% de CPU). 
  alarm_actions       = ["${aws_autoscaling_policy.poly_scaling_up.arn}"]      //Referencia al: 'aws_autoscaling_policy' (AUMENTO).  
  alarm_description   = "ESTA 'MÉTRICA' MONITOREA LAS 'INSTANCIAS EC2' A NIVEL DE 'CPU': (SOBREPASO DE 'UMBRAL')"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia a las 'AUTO-SCALING-GROUP'. 
  }
}

resource "aws_cloudwatch_metric_alarm" "cw_alarm_down" {
  alarm_name          = "cw_alarm_down"
  comparison_operator = "${var.const_lista_comparison_operator_cloudwatch[1]}" //IMPORTANTE: nombre de la operacion MATEMÁTICA aplicada (DECREMENTO). 
  evaluation_periods  = "${var.const_evaluation_periods_cloudwatch}"           //Número de 'PERIODOS' de evaluación de la DATA.
  metric_name         = "${var.const_metric_name_cloudwatch}"                  //Nombre de la 'ALARMA' basada en 'CPU'.
  namespace           = "${var.const_namespace_cloudwatch}"                    //'NAMESPACE' asociado con la 'MÉTRICA'.
  period              = "${var.const_period_cloudwatch}"                       //Periodo en segundos, con relación a: 'statistic'. 
  statistic           = "${var.const_Average_cloudwatch}"                      //Estadística para aplicar a la 'MÉTRICA'.
  threshold           = "${var.const_lista_threshold_cloudwatch[1]}"           //'UMBRAL': valor contra el cual se COMPARA la estadística especificada: (30% de CPU). 
  alarm_actions       = ["${aws_autoscaling_policy.poly_scaling_down.arn}"]    //Referencia al: 'aws_autoscaling_policy' (DECREMENTO). 
  alarm_description   = "ESTA 'MÉTRICA' MONITOREA LAS 'INSTANCIAS EC2' A NIVEL DE 'CPU': (NORMALIDAD DE 'UMBRAL')"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia a las 'AUTO-SCALING-GROUP'.
  }
}

