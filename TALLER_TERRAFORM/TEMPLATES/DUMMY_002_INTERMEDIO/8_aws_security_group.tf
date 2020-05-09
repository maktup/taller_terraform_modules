
#-------------------------------------------------------------#
#--------------- CONFIGURACION: 'SECURITY-GROUP' -------------#
#-------------------------------------------------------------# 
## IMPORTANTE #1: Se esta aplicando una ITERACIÓN NO a nivel de: 'resource', sinó a nivel de: 'ingress'.  
## IMPORTANTE #2: Considerar para los: 'INGRESS/EGRESS': 
## icmp      => Protoclo de 'Capa Red' para diagnóstico.
## 0.0.0.0/0 => Pemite tráfico 'INTPUT/OUTPUT' de cualquier lugar. 
## -1        => Para soporte a TODO (PUERTO ó PROTOCOLO).
## 22        => Protoloco 'TCP' para soporte a: 'SSH-SFTP'.
## 80        => Protoloco 'TCP' para soporte a: 'HTTP'.
## 443       => Protoloco 'TCP' para soporte a: 'HTTPS-SSL'.
## 8080      => Protoloco 'TCP' para soporte a: 'TOMCAT-JBOSS'.
## 0         => En 'from_port' & 'to_port', solo cuando en 'protocol' se pone: -1.


###### CREANDO RECURSO: 'SECURITY-GROUP' ######:
resource "aws_security_group" "sg_generic" {
  name        = "sg_generic"
  vpc_id      = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC.
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

