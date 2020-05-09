
#-------------------------------------------------------------#
#----------------- CONFIGURACION: 'ROUTE-53' -----------------#
#-------------------------------------------------------------#
## IMPORTANTE #1: Este servicio permite:
## - Refistrar Dominios
## - Brindar Servicios de DNS.
## - Hacer un 'Health-Check'
## IMPORTANTE #2: Si NO se especifica los 'DNS' la plataforma lo crea.  
## IMPORTANTE #3: El 'name' del 'ROUTE-53' debe de ser único en el mundo ('DOMINIO'). 
## IMPORTANTE #4: Considerar que se creará el 'DNS' en 'ROUTE53', pero que el 'DOMINIO'
## se debe de tener creado por ejemplo en: 'https://pe.godaddy.com'.  
## IMPORTANTE #5: El acceso a la URL de 'ROUTE53' NO va a funcionar hasta que no se mapeen
## en 'https://pe.godaddy.com' los DNS generados (aleatorio) por AWS. Ejemplo:

## ns-1536.awsdns-00.co.uk
## ns-0.awsdns-00.com
## ns-1024.awsdns-00.org 
## ns-512.awsdns-00.net


###### CREANDO RECURSOS: 'ROUTE-53' ######: 
resource "aws_route53_zone" "r53_001" {
  name = "capacitacion-terraform.com" //Setear el 'DOMINIO' (ÚNICO) del 'ROUTE-53'. 
}

resource "aws_route53_record" "server_001" {
  zone_id = "${aws_route53_zone.r53_001.zone_id}"
  name    = "www.${aws_route53_zone.r53_001.name}" //Nombre del 'DNS' creado. 
  type    = "A"                                    //Tipo: IPv4.

  alias {
    name                   = "${aws_elb.elb_001.dns_name}"
    zone_id                = "${aws_elb.elb_001.zone_id}"
    evaluate_target_health = true
  }
}

