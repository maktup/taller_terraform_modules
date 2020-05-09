
#-------------------------------------------------#
#------------ CONFIGURACION: 'ROUTE53' -----------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'ROUTE-53' ######: 
resource "aws_route53_zone" "r53_001" {
  name = "${var.const_dominio_route53}" //Setear el 'DOMINIO' (ÚNICO) del 'ROUTE-53'. 
}

resource "aws_route53_record" "server_001" {
  zone_id = "${aws_route53_zone.r53_001.zone_id}"
  name    = "www.${aws_route53_zone.r53_001.name}"
  type    = "${var.const_record_IPv4_route53}"

  alias {
    name                   = "${var.const_ext_dns_name_elb}" //Este valor es 'DINÁMICO'
    zone_id                = "${var.const_ext_zone_id_elb}"  //Este valor es 'DINÁMICO'
    evaluate_target_health = true
  }
}

