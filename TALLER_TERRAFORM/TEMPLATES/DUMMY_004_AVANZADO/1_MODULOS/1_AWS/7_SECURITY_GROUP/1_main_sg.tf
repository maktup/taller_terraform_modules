
#-------------------------------------------------#
#-------- CONFIGURACION: 'SECURITY-GROUP' --------#
#-------------------------------------------------# 
## IMPORTANTE #1: Como TODO está 'MODULARIZADO', es importante preguntarnos: 
## 1. ¿QUE DESEAMOS 'PERSONALIZAR' ... DE LO QUE YA ESTÁ?.
## 2. ¿QUE DESEAMOS 'REUTILIZAR' ... DE LO QUE YA ESTÁ?.

## IMPORTANTE #2: Lo que se desea 'PERSONALIZAR', se tendrá que 'SOBREESCRIBIR'. 
## IMPORTANTE #3: Lo definidos como 'DINAMICOS' son 'REFERENCIAS EXTERNAS' a otros 'MÓDULOS'.
## Estos deberán der 'DECLARADOS' como CONSTANTE para ser luego 'SOBREESCRITOS' en: 'main_*_desa'.   

## IMPORTANTE #4: SI existen valores 'DUPLICADOS' entre los 'MÓDULOS', estos se tendrán
## que considerar & registrar 'INDEPENDIENTEMENTE' por 'MÓDULO'.


###### CREANDO RECURSOS: 'SECURITY-GROUP' ######:  
resource "aws_security_group" "sg_generic" {
  name        = "sg_generic"
  vpc_id      = "${var.const_ext_vpc_id}" //Este valor es 'DINÁMICO'
  description = "IMPORTANTE: permite acceso = SSH - HTTP - HTTPs - TOMCAT"

  //INGRESS => 'INBOUND RULES' de tráfico. 
  dynamic "ingress" {
    for_each = "${var.const_lista_puertos_comunes_ingress}" //ITERACIÓN solo de los 'PUERTOS' comunes: 'from_port' & 'to_port'. 
    content {
      from_port   = "${ingress.value}"
      to_port     = "${ingress.value}"
      protocol    = "${var.const_protocolo_tcp}" //TCP
      cidr_blocks = ["${var.const_ip_all}"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "${var.const_protocolo_icmp}" //ICMP
    cidr_blocks = ["${var.const_ip_all}"]
  }

  //EGRESS => 'OUTBOUND RULES' de tráfico. 
  egress {
    from_port   = "${var.const_valor_neutro}"
    to_port     = "${var.const_valor_neutro}"
    protocol    = "${var.const_protocolo_all}"
    cidr_blocks = ["${var.const_ip_all}"]
  }

  tags = {
    Name = "SECURITY-GROUP #001"
  }
}

