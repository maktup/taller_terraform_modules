
#-------------------------------------------------------------#
#---------------- CONFIGURACION: 'CLOUDWATCH'----------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Este 'CLOUDWATCH' trabajará de la mano con el 'AUTO-SCALING-GROUP', Validando que 
## NO se sobrepare el 'UMBRAL' (CPU) definido, de los contrario aplicará la 'ELASTICIDAD': (UP/DOWN) 
## a nivel de 'INSTANCIAS (EC2)'.


###### CREANDO RECURSOS: 'CLOUDWATCH' ######: 
resource "aws_cloudwatch_metric_alarm" "cw_alarm_up" {
  alarm_name          = "cw_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"                   //IMPORTANTE: nombre de la operacion MATEMÁTICA aplicada (AUMENTO). 
  evaluation_periods  = "2"                                               //Número de 'PERIODOS'de evaluación de la DATA.
  metric_name         = "CPUUtilization"                                  //Nombre de la 'ALARMA' basada en 'CPU'.
  namespace           = "AWS/EC2"                                         //'NAMESPACE' asociado con la 'MÉTRICA'.
  period              = "120"                                             //Periodo en segundos, con relación a: 'statistic'. 
  statistic           = "Average"                                         //Estadística para aplicar a la 'MÉTRICA'.
  threshold           = "31"                                              //'UMBRAL': valor contra el cual se COMPARA la estadística especificada: (30% de CPU). 
  alarm_actions       = ["${aws_autoscaling_policy.poly_scaling_up.arn}"] //Referencia al: 'aws_autoscaling_policy' (AUMENTO).  
  alarm_description   = "ESTA 'MÉTRICA' MONITOREA LAS 'INSTANCIAS EC2' A NIVEL DE 'CPU': (SOBREPASO DE 'UMBRAL')"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia a las 'AUTO-SCALING-GROUP'. 
  }
}

resource "aws_cloudwatch_metric_alarm" "cw_alarm_down" {
  alarm_name          = "cw_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"                        //IMPORTANTE: nombre de la operacion MATEMÁTICA aplicada (DECREMENTO). 
  evaluation_periods  = "2"                                                 //Número de 'PERIODOS' de evaluación de la DATA.
  metric_name         = "CPUUtilization"                                    //Nombre de la 'ALARMA' basada en 'CPU'.
  namespace           = "AWS/EC2"                                           //'NAMESPACE' asociado con la 'MÉTRICA'.
  period              = "120"                                               //Periodo en segundos, con relación a: 'statistic'. 
  statistic           = "Average"                                           //Estadística para aplicar a la 'MÉTRICA'.
  threshold           = "30"                                                //'UMBRAL': valor contra el cual se COMPARA la estadística especificada: (30% de CPU). 
  alarm_actions       = ["${aws_autoscaling_policy.poly_scaling_down.arn}"] //Referencia al: 'aws_autoscaling_policy' (DECREMENTO). 
  alarm_description   = "ESTA 'MÉTRICA' MONITOREA LAS 'INSTANCIAS EC2' A NIVEL DE 'CPU': (NORMALIDAD DE 'UMBRAL')"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.scaling_group_001.name}" //Referencia a las 'AUTO-SCALING-GROUP'.
  }
}

