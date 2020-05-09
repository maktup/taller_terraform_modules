
#-------------------------------------------------------------#
#--------------- CONFIGURACION: 'SECURITY-GROUP' -------------#
#-------------------------------------------------------------# 
## IMPORTANTE #1: Considerar para los: 'INGRESS/EGRESS': 
## icmp      => Protoclo de 'Capa Red' para diagnóstico.
## 0.0.0.0/0 => Pemite tráfico 'INTPUT/OUTPUT' de cualquier lugar. 
## -1        => Para soporte a TODO (PUERTO ó PROTOCOLO).
## 22        => Protoloco 'TCP' para soporte a: 'SSH-SFTP'.
## 80        => Protoloco 'TCP' para soporte a: 'HTTP'.
## 443       => Protoloco 'TCP' para soporte a: 'HTTPS-SSL'.
## 8080      => Protoloco 'TCP' para soporte a: 'TOMCAT-JBOSS'.


###### CREANDO RECURSO: 'SECURITY-GROUP' ######:
resource "aws_security_group" "sg_001" {
  name        = "sg_001"
  vpc_id      = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC.
  description = "IMPORTANTE: permite acceso = SSH - HTTP - HTTPs - TOMCAT"

  //INGRESS => 'INBOUND RULES' de tráfico. 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]      
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  //EGRESS => 'OUTBOUND RULES' de tráfico. 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]    
  }

  tags = {
    Name = "SECURITY-GROUP #001"
  }
}

