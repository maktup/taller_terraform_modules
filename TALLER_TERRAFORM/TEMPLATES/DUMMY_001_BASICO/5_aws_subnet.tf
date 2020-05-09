
#------------------------------------------------------#
#--------------- CONFIGURACION: 'SUBNETs' -------------#
#------------------------------------------------------#
## IMPORTANTE #1: Asignar bien la IP (SUBNETING). 
## IMPORTANTE #2: Asociar bien la 'SUBNET' a la 'AZ' (1 AZ diferente por SUBNET). 
## IMPORTANTE #3: Las 'AZ' varían su nombre en base a la 'REGION' elegida. 


###### CREANDO RECURSOS: 'SUBNETs' ######:  
resource "aws_subnet" "sn_001" {
  vpc_id                  = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC. 
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "SUBNET #001"
  }
}

resource "aws_subnet" "sn_002" {
  vpc_id                  = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC.
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "SUBNET #002"
  }
}

resource "aws_subnet" "sn_003" {
  vpc_id                  = "${aws_vpc.vpc_001.id}" //Obtener el ID de la VPC.
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "SUBNET #003"
  }
}
